##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c

CHE := che $(if $(CHE_PROFILE),--profiles=$(CHE_PROFILE) --skip-run-if,--target-profile-types=host)
COMMANDS := che-install generic-setup repo-prepare repo-files-untracked-load repo-files-tracked-load host-load-configs host-load-configs-install

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
	@$${BIN_CHE:-che} render-templates --profiles=generic/setup

shared/generic/make/generic.mk: generic-setup
##[<] Setup

##[>] Onto Repo [genai-include]
#[what] prepare the checkout: every repo-git-untracked profile, then every repo-git-tracked one
repo-prepare: repo-files-untracked-load repo-files-tracked-load

#[why] untracked first: the tracked renders (README) inline data files the untracked profiles produce
#[what] run every repo-git-untracked profile: gitignored renders, generic payload
repo-files-untracked-load:
	@che run --target-profile-types=repo-git-untracked

#[what] run every repo-git-tracked profile: git-tracked renders (README, LICENSE)
repo-files-tracked-load:
	@che run --target-profile-types=repo-git-tracked
##[<] Onto Repo

##[>] Onto Host [genai-include]
#[what] load AI configs onto host, profile by profile: each profile's full op sequence minus scripts and package installs
host-load-configs:
	@$(CHE) run --skip-ops=run-scripts,install-packages

#[what] install AI configs onto host, profile by profile: each profile's full op sequence, scripts included
host-load-configs-install:
	@$(CHE) run
##[<] Onto Host
##[<] 🤖🤖
