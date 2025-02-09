#
# Settings
#

set quiet := true

#
# Tasks
#

# Show this help message
default:
  just -l

# Install all packages
install: generate
  stow .

# Uninstall all packages
uninstall:
  stow -D .

# Generate dotfiles for a specific package
generate-pkg PACKAGE:
  ./generate/{{ PACKAGE }}/generate

# Generate all package dotfiles
generate:
  find \
    ./generate/* \
    -type f \
    -iname generate \
    -exec sh -c "echo 'Generating: {}' && /usr/bin/env sh '{}'" \;
