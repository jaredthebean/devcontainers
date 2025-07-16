#!/usr/bin/env zsh
echo "\nARGUMENTS:\n"
localWorkspaceFolder=$1
containerWorkspaceFolder=$2
localWorkspaceFolderBasename=$3
containerWorkspaceFolderBasename=$4
typeset localWorkspaceFolder containerWorkspaceFolder localWorkspaceFolderBasename containerWorkspaceFolderBasename

echo "\nENVIRONMENT:\n"
env
