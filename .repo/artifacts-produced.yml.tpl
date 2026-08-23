##[>] 🤖
produces:
  - uri: gitlab.com/konradodwrot/ai-harness/configs
    type: gitRepository
    versionEnvVar: AI_CONFIGS_REF
    version: {{ env.Getenv "AI_CONFIGS_REF" }}
##[<] 🤖
