# Purpose

## What It Is

The AI toolchain as che profiles: claude, codex, ollama, the shared agent prose payload and the LLM-backed git wrappers. Che loads one `root/` tree onto the host per profile: symlinked by default, `.ontoHost.cp` copied, `*.ontoHost.tpl` rendered. The prose payload (agent docs, claude rules, skills, output styles, snippets) renders from `cross-repo/prose/assets` at a pinned version.

## Why It Exists

The AI harness released on the dotfiles cadence: an agent prose edit shipped the whole `configs` repo, and a shell or observability edit shipped the AI payload every repo pins. Apart, each moves on its own, behind its own pin `AI_TOOLS_CONFIGS_REF`.

## Goals

- One home for the AI toolchain: claude, codex, ollama, agent prose, git wrappers.
- Own release stream: an AI change never releases the tool profiles, and the reverse.
- Profiles load onto any supported host profile (host/macos, virt/linux).
