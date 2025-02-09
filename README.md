# dotfiles

Personal dotfiles repository.

## Generating dotfiles

Some dotfiles are based on a template (The `.gitconfig` for instance). Thus, it is necessary to generate them. The `just install` command will automatically trigger the generation process.

However, if you want to manually generate them, use the following commands:

```sh
# Generate all dotfiles packages
just generate

# Generate a specific dotfiles package
just generate-pkg PACKAGE_NAME
```

## Install dotfiles

Install dotfiles simply by running the stow command:

```sh
stow .
```

Or use `just` (will generate packages before stowing):

```sh
just install
```

## Uninstall dotfiles

Uninstall dotfiles simply by running the stow command:

```sh
stow -D .
```

Or use `just`:

```sh
just uninstall
```

## Install default shell, fonts and additional CLI tools

```sh
# Install default shell (fish)
./install-shell.sh

# Install additional CLI tools (nvim, zellij, etc.)
./install-tools.sh

# Install default fonts (Fira Code, Hack, Lato, etc.)
./install-fonts.sh
```

## Requirements

The following tools are required on your system to install the dotfiles:

| Tool                                                            | Command |
| --------------------------------------------------------------- | ------- |
| [GNU stow](https://www.gnu.org/software/stow/)                  | `stow`  |
| [GNU sed](https://www.gnu.org/software/sed/)                    | `sed`   |
| [Just command runner](https://github.com/casey/just) (optional) | `just`  |
