# WJUtils - Bash

Bash Utilities for Web Developers - powered by [OhMyBash]

[Skip to installation](#installation)

## Features

WJUtils Bash (WJU bash: "wi-ju-bash") is comprised of several tools and aliases
primarily for web developers. Any feature can be toggled individually.

### Git Aliases

> Config: `git`

The Git aliases are a collection of shorthands for common `git` commands.

| Shorthand                      | Expansion                            | Textual                 |
| ------------------------------ | ------------------------------------ | ----------------------- |
| `gt`                           | `git`                                | git                     |
| `gtcn "user/repo" [directory]` | `git clone "git@github.com:$1" "$2"` | git clone github repo   |
| `gta`                          | `git add`                            | git add                 |
| `gtc`                          | `git commit`                         | git commit              |
| `gtcm`                         | `git commit -m`                      | git commit with message |
| `gtpl`                         | `git pull`                           | git pull                |
| `gtps`                         | `git push`                           | git push                |
| `gtsh`                         | `git stash`                          | git stash               |
| `gtr`                          | `git remote`                         | git remote              |
| `gts`                          | `git status`                         | git status              |
| `gtl`                          | `git log`                            | git log                 |
| `gtb`                          | `git branch`                         | git branch              |
| `gtch`                         | `git checkout`                       | git checkout            |

You can also run `gthelp` to see a list of all aliases.

### Gitmoji Aliases

> Config: `gitmoji`

The Gitmoji aliases require [gitmoji-cli] to be installed and available.

| Shorthand | Expansion    | Textual        |
| --------- | ------------ | -------------- |
| `gtmj`    | `gitmoji`    | gitmoji        |
| `gtmjc`   | `gitmoji -c` | gitmoji commit |

You can also run `gtmjhelp` to see a list of all aliases.

### Git Utilities

> Config: `gitutils`

The Git utilities are a collection of commands to make working with Git more
convenient.

| Command | Description                       |
| ------- | --------------------------------- |
| `gtbs`  | Interactively create a new branch |

### Node Loader

> Config: `nodeload`

**Recommended: some WJU bash features rely on JSON and will not work without**
**Node.**

The Node loader is intended for combined use with the [NVM Loader](#nvm-loader).
It will use NVM to install a version of Node.

If available, it will use the version provided in the `.nvmrc` file. If this
file is not available, it will use the newest version permitted by
the local `package.json` `engines.node` field. If there is no `package.json`, or
if it has no `engines.node` field, it will use the latest LTS version of Node.

You can re-run this task without restarting your terminal by running `nvmu`.

### NVM Loader

> Config: `nvmload`

The NVM loader will update/install NVM automatically.

You can re-run this task without restarting your terminal by running `nvmi`.

This also sets the following, so you can safely omit them from your `.bashrc`:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

### PNPM Aliases

> Config: `pnpm`

The PNPM aliases are a collection of shorthands for common `pnpm` commands.

| Shorthand | Expansion            | Textual                       |
| --------- | -------------------- | ----------------------------- |
| `pp`      | `pnpm`               | pnpm                          |
| `ppr`     | `pnpm -r`            | pnpm recursive                |
| `ppc`     | `pnpm -C`            | pnpm in workspace             |
| `ppi`     | `pnpm install`       | pnpm install                  |
| `ppid`    | `pnpm install -D`    | pnpm install dev              |
| `ppir`    | `pnpm -r install`    | pnpm recursive install        |
| `ppic`    | `pnpm -C install`    | pnpm install in workspace     |
| `ppidc`   | `pnpm -C install -D` | pnpm install dev in workspace |
| `ppiw`    | `pnpm -W install`    | pnpm install in root          |
| `ppidw`   | `pnpm -W install -D` | pnpm install dev in root      |
| `ppup`    | `pnpm update`        | pnpm update                   |
| `ppupr`   | `pnpm update -r`     | pnpm update recursive         |
| `pps`     | `pnpm search`        | pnpm search                   |
| `ppl`     | `pnpm link`          | pnpm link                     |
| `ppnl`    | `pnpm unlink`        | pnpm unlink                   |

You can also run `pphelp` to see a list of all aliases.

\* _NPM aliases will not be added. PNPM is equally as simple to use but_
_significantly faster._

### PNPM Loader

> Config: `pnpmload`

The PNPM loader is intended for combined use with the [NVM Loader](#nvm-loader)
and [Node Loader](#node-loader). It will install PNPM via `corepack` if it is
not already installed.

You can re-run this task without restarting your terminal by running `ppcp`.

### Miscellanous Utilities

> Config: `misc`

The miscellanous utilities are a collection of unrelated commands which aren't
large enough to warrant their own category.

| Command | Description                                                               |
| ------- | ------------------------------------------------------------------------- |
| `copy`  | Copy the first arg, or piped content, to the clipboard (requires `xclip`) |

## Installation

> Windows users: to use WJUtils bash, you will need to install
> [Windows Subsystem for Linux][WSL].

<!-- This comment separates the blockquotes do not remove -->

> MacOS users: your results may vary. Feel free to test and contribute, MacOS
> support would be very welcome.

Ensure you have [OhMyBash] installed.

### Install with `curl`

Install/Update:

```bash
bash -c "$(curl -fsSL "https://raw.githubusercontent.com/wjutils/bash/trunk/install.sh")"
```

### Install from Source

Install:

```bash
git clone git@github.com:WJUtils/bash path/to/copy
cd path/to/copy
bash install.sh --local
```

Update:

```bash
cd path/to/copy
git pull
bash install.sh --local
```

## Configuration

WJU bash is configured by a single environment variable; `WJU_DISABLE`.

As this is primarily for web developers, you can imagine this variable working
like a class in HTML.

Examples:

```bash
# disable the NVM Loader's update/install, all git/gitmoji aliases (not utils), surpress colored outputs
WJU_DISABLE="nvm nvmload git gitmoji color"
# disable all NVM Loader functionality, gitmoji aliases (not git, not utils), and pnpm aliases
WJU_DISABLE="nvm nvmload gitmoji pnpm"
# disable all automatic loaders/installers
WJU_DISABLE="nodeload nvm nvmload pnpm pnpmload"
```

The recognised values are:

| Value      | Description                                                                        |
| ---------- | ---------------------------------------------------------------------------------- |
| `color`    | Effects if command outputs (**not** aliases) will be colored.                      |
| `git`      | Effects whether the [Git aliases](#git-aliases) are enabled.                       |
| `gitmoji`  | Effects whether the [Gitmoji aliases](#gitmoji-aliases) are enabled.               |
| `gitutils` | Effects whether the [Git Utilities](#git-utilities) are enabled.                   |
| `nodeload` | Effect whether the [Node Loader](#node-loader) will load the Node version.         |
| `nvmload`  | Effect whether the [NVM Loader](#nvm-loader) will update/install NVM.              |
| `pnpm`     | Effects whether the [PNPM aliases](#pnpm-aliases) are enabled.                     |
| `pnpmload` | Effects whether the [PNPM Loader](#pnpm-loader) will update/install PNPM.          |
| `misc`     | Effects whether the [miscellanous utilities](#miscellanous-utilities) are enabled. |

[OhMyBash]: https://github.com/ohmybash/oh-my-bash
[WSL]: https://learn.microsoft.com/en-us/windows/wsl/install
[gitmoji-cli]: https://github.com/carloscuesta/gitmoji-cli
