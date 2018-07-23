function _find_npm_scripts {
  if [ ! -f package.json ]; then
    echo "package.json not found" >&2
    zle send-break
  fi
  output=$(jq '.scripts | keys[]' package.json -r | fzf --height 40% --reverse --bind 'shift-tab:up,tab:down' --cycle)
  zle reset-prompt
  if [ -z "$output" ]; then
    zle accept-line
  else
    zle -U "yarn ${output}"
  fi
}

zle -N find-npm-scripts _find_npm_scripts
