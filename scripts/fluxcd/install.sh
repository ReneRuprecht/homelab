#!/bin/bash
curl -s https://fluxcd.io/install.sh | sudo bash

. <(flux completion zsh)

echo "${fpath// /\n}" | grep -i completion
flux completion zsh > _flux

mv _flux ~/.oh-my-zsh/completions  # oh-my-zsh
