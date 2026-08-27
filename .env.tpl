##[>] 🤖🤖
{{ localFile ".repo/upstream.env" | alwaysUpdate }}
AI_TOOLS_CONFIGS_REF={{ shell "glab variable get -g konradodwrot GRP_KO_VAR_AI_TOOLS_CONFIGS_REF" }}
ARTIFACT_REGISTRY={{ shell "glab variable get -g konradodwrot GRP_KO_VAR_ARTIFACT_REGISTRY" }}
TAG_TOKEN={{ shell "glab variable get -R konradodwrot/ai-harness/ai-tools-configs REPO_PROTECTED_VAR_BOT_TAG_TOKEN" }}
##[<] 🤖🤖
