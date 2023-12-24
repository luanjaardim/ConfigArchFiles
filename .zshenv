# Function to check if a directory is in the PATH
path_contains() {
  [[ ":$PATH:" == *":$1:"* ]]
}

# Add a directory to the PATH if it doesn't exist
add_to_path_if_not_exists() {
  local dir_to_add="$1"

  if ! path_contains "$dir_to_add"; then
    export PATH="$PATH:$dir_to_add"
  fi
}

add_to_path_if_not_exists "$HOME/code/Dulang"
add_to_path_if_not_exists "$HOME/code/zig_path"
add_to_path_if_not_exists "$HOME/code/zls/zig-out/bin"
add_to_path_if_not_exists "$HOME/.config/emacs/bin"
