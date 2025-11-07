#!/bin/bash
home-manager expire-generations 0
nix-collect-garbage -d
