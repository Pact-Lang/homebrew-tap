<div align="center">

<img src="https://raw.githubusercontent.com/Pact-Lang/pact/main/assets/favicon.png" width="80" alt="PACT Logo">

# Homebrew Tap for PACT

**A typed, permission-enforced language for orchestrating AI agents.**

[![Formula](https://img.shields.io/badge/formula-pact--lang-blue)](Formula/pact-lang.rb)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Pact-Lang/pact/blob/main/LICENSE)

</div>

---

## Install

```bash
brew tap pact-lang/tap
brew install pact-lang
```

This installs:
- **`pact`** — the PACT CLI (check, run, fmt, doc, playground, mermaid)
- **`pact-lsp`** — the Language Server for VS Code integration
- **`pact-mcp`** — the Model Context Protocol server for Claude Desktop

## Verify

```bash
pact --version
pact check --help
```

## Quick Start

```bash
# Scaffold a new project
pact init hello.pact

# Type-check and validate permissions
pact check hello.pact

# Run with Claude
export ANTHROPIC_API_KEY=sk-...
pact run hello.pact --flow hello --args "world" --dispatch claude
```

## What is PACT?

PACT is a **programming language** (not a framework) for building AI agent systems with compile-time safety:

- **Typed parameters** — `query :: String`, `count :: Int`, `tags :: List<String>`
- **Permission enforcement** — agents can't use tools they lack permission for, caught at compile time
- **Templates & Directives** — composable, reusable prompt architecture
- **10 built-in providers** — DuckDuckGo, Google, Brave search, HTTP, filesystem, time, JSON
- **Multi-backend** — Claude, OpenAI, Ollama
- **Auto-guardrails** — GDPR, HIPAA, PCI-DSS, COPPA injected from permission declarations
- **MCP server** — use PACT tools directly from Claude Desktop, Cursor, Windsurf
- **Full toolchain** — LSP, VS Code extension, formatter, doc generator, REPL

## MCP Integration

PACT includes a built-in Model Context Protocol server with 5 tools:

| Tool | Description |
|------|-------------|
| `pact_check` | Validate .pact source for syntax and semantic errors |
| `pact_list` | List all declarations (agents, tools, flows, templates) |
| `pact_run` | Execute a flow using mock dispatch |
| `pact_scaffold` | Generate .pact source from agent descriptions |
| `pact_validate_permissions` | Check for overly broad permissions |

Add to Claude Desktop config (`~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "pact": {
      "command": "pact-mcp"
    }
  }
}
```

## Links

- **Website:** [pactlang.dev](https://pactlang.dev)
- **GitHub:** [Pact-Lang/pact](https://github.com/Pact-Lang/pact)
- **Docs:** [README](https://github.com/Pact-Lang/pact#readme)
- **VS Code:** [Editor Setup](https://github.com/Pact-Lang/pact#editor-support)

## Alternative Install

```bash
# Via Cargo (requires Rust toolchain)
cargo install pact-lang
```

## License

MIT — Copyright (c) 2025-2026 Gabriel Lars Sabadin
