function find_npm_scripts {
  if [ ! -f package.json ]; then
    echo "package.json not found" >&2
    return 1
  fi
  output=$(jq '.scripts | keys[]' package.json -r | fzf --height 30% --reverse --bind 'shift-tab:up,tab:down' --cycle)
  if [ -z "$output" ]; then
    return 0
  else
    yarn $output
  fi
}
