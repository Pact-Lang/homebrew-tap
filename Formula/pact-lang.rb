class PactLang < Formula
  desc "A typed, permission-enforced language for orchestrating AI agents"
  homepage "https://pactlang.dev"
  url "https://github.com/Pact-Lang/pact/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f43ad32f2a9d58127e4f3429085ccffab44ee3aba80d7b428f9503f81fa2494c"
  license "MIT"
  head "https://github.com/Pact-Lang/pact.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/pact-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/pact-lsp")
  end

  test do
    assert_match "pact", shell_output("#{bin}/pact --version")

    (testpath/"hello.pact").write <<~PACT
      permit_tree {
          ^llm { ^llm.query }
      }

      tool #greet {
          description: <<Generate a greeting.>>
          requires: [^llm.query]
          params { name :: String }
          returns :: String
      }

      agent @greeter {
          permits: [^llm.query]
          tools: [#greet]
          prompt: <<You are friendly.>>
      }

      flow hello(name :: String) -> String {
          result = @greeter -> #greet(name)
          return result
      }
    PACT

    assert_match "no errors", shell_output("#{bin}/pact check #{testpath}/hello.pact")
  end
end
