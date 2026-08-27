##[>] 🤖
downstream:
  - uri: gitlab.com/konradodwrot/ai-harness/ai-tools-configs
    type: gitRepository
    versionEnvVar: AI_TOOLS_CONFIGS_REF
    version: {{ env.Getenv "AI_TOOLS_CONFIGS_REF" }}
##[<] 🤖
