##[>] 🤖
consumes:
  - artifact: gitlab.com/konradodwrot/go-modules/che
    version: {{ env.Getenv "GO_MODULES_CHE_REF" }}
  - artifact: https://gitlab.com/konradodwrot/cross-repo/misc
    version: {{ env.Getenv "MISC_REF" }}
  - artifact: https://gitlab.com/konradodwrot/cross-repo/prose/assets
    version: {{ env.Getenv "PROSE_ASSETS_REF" }}
  - artifact: https://gitlab.com/konradodwrot/cross-repo/prose/spec
    version: {{ env.Getenv "PROSE_SPEC_REF" }}
  - artifact: us-central1-docker.pkg.dev/staging-499418/ci/ci-linux
    version: {{ env.Getenv "OCI_IMAGES_CI_LINUX_REF" }}
##[<] 🤖
