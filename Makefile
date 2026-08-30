##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c

CHE := che $(if $(CHE_PROFILE),--profiles=$(CHE_PROFILE) --skip-run-if)
COMMANDS := che-install generic-setup host-load-configs host-load-configs-install

.PHONY: $(COMMANDS)

-include shared/generic/make/generic.mk

##[>] Environment Variables [genai-include]
#[what] force one che profile for host ops, passed as `$ che --profiles --skip-run-if`
#[vals] ai/host/macos|ai/base/macos|ai/virt/linux
export CHE_PROFILE
##[<] Environment Variables

##[>] Setup [genai-include]
#[what] install the latest released che into ~/.local/bin, only when the one on PATH is older
che-install:
	@curl -fsSL https://konradodwrot.gitlab.io/go-modules/che-install.sh | sh -s -- --skip-if-present-is-newer

#[what] render the generic consumer payload (generic.mk, lefthook.yml, shared/generic/) at the pinned CENTRALIZED_ASSETS_GENERIC_REF
generic-setup:
	@$${CHE_BIN:-che} render-templates --profiles=genericSetup

shared/generic/make/generic.mk: generic-setup
##[<] Setup

##[>] Onto Host [genai-include]
#[what] load AI configs onto host, profile by profile: each profile's full op sequence minus scripts and package installs
host-load-configs:
	@$(CHE) run --skip-ops=run-scripts,install-packages

#[what] install AI configs onto host, profile by profile: each profile's full op sequence, scripts included
host-load-configs-install:
	@$(CHE) run
##[<] Onto Host
##[<] 🤖🤖
