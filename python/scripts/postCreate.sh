#!/usr/bin/env sh
localWorkspaceFolder=$1
containerWorkspaceFolder=$2
localWorkspaceFolderBasename=$3
containerWorkspaceFolderBasename=$4

cd "${containerWorkspaceFolder}"

templateDir="${containerWorkspaceFolder}/.devcontainer/template"

if [ ! -f pyproject.toml ]; then
	uv init .
	uv add --group lint ruff
	uv add --group lint pre-commit
fi
# Ruff _could_ be configured in the pyproject.toml, but we'll keep the script
# simple for now and assume it is always done in ruff.toml
if [ ! -f ruff.toml ]; then
	cp "${templateDir}/ruff.toml" ./
fi

if [ ! -f .pre-commit-config.yaml ]; then
	cp "${templateDir}/.pre-commit-config.yaml" ./
	uv run --group lint pre-commit install
	uv run --group lint pre-commit run
fi
