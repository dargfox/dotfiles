# Dotfiles
> *Dotfiles for dargfox environment*

![preview][preview]

## Requirements
> Please, read how to clone[^clone] before you do anything, project has submodules[^modules]
### Packages
 - stow
 - neovim
 - tmux
 - lazygit
 - powerline (optional)

 **Stow** is used for sync of dotfiles. Read more how to use stow for correct environment setup.

 **Neovim** is used as a main code editor. Configured with bamboo theme. LSP configured for JS, Python, Lua, Bash, Vue.Treesitter is used for beautiful highlights. Added floaterm and LazyGit for easy git operating. That's main features, try all of it by yourself.

**Tmux** is used for easy operating in terminal. With current .bashrc it opens on bash start. Added theme, that has a lot of useful information in your terminal.

**LazyGit** - if you are going to use NeoVim as main code editor - **please** setup it, it will make your life easier and brighter.

## Setup
 **Setup environment using stow**
 ```bash
 stow tmux/ #? Setup tmux
 stow nvim/ #? Setup nvim
 stow *     #? Setup all (be careful, better setup folder by folder, what you need)
 ```

## Tmux
### Keybinds

> Useful information
```
<C-...> - Ctrl + ...
<S-...> - Shift + ...
<Pr-...> - Prefix + ...
<Scroll> - Mouse scroll
```
> Keybinds
```
<C-s> - prefix
<Pr-r> - reload tmux configuration
<C-Tab> - next window
<C-S-Tab> - previous window
<C-l> - clear current pane
<C-c> - copy to clipboard
<Pr-[> - select/copy mode (q to exit)
<Scroll> - select/copy mode (q to exit)
<Pr-"> - split vertically
<Pr-%> - split horizontally
<Pr-w> - show open sessions/panes/windows
```

## Neovim
### Keybinds
> Useful information
```
Buffer ~= file
<Space> - leader
<C-...> - Ctrl + ...
<S-...> - Shift + ...
<CR> - Enter
<w>,<e>,<b> - remapped with nvim-spider
<"><+><y>(Visual Mode) - copy selected to clipboard
```
> Keybinds
```
<leader-h> - clear search
<C-n> - focus neotree (q to close when focused)
<leader-b-f> - show open buffers
<Tab>(Visual Mode) - tab line(s)
<S-Tab>(Visual Mode) - untab line(s)
<leader-Tab> - open next buffer
<leader-S-Tab> - open previous buffer
<f> - hop (to prevent use of mouse)
<leader-f> - hop pattern
<leader-l-g> - LazyGit
<leader-t> - terminal
<leader-e> - troubles overview
<g-d> - search word under cursor
<g-d>(Visual Mode) - search selected text
<CR> - beautiful replacement of <:> (DO NOT MAP <:> TO THIS)
<C-w> - close buffer
<C-b> - scroll complitions by -4
<C-f> - scroll complitions by +4
<C-Space> - complete
<C-e> - abort complitions
<Tab> - if complitions shown - confirm complition
<C-b><U> - toggle debug
<leader-b-b> - toggle debug breakpopint
<Tab> - if lsp complitions visible - select next complition
<S-Tab> - if lsp complitions visible - select previous complition
<CR> - if lsp complitions visible - confirm complition

<leader-g-d> - go to definition
<leader-g-y> - go to type definition
<leader-g-i> - go to implementation
<leader-g-r> - show references
<K> - show lsp information about value under cursor
<C-p> - open telescope
<Space><Space> - old buffers (list of buffers sorted by time)
<Space-f-g> - live grep (global search)
<Space-f-h> - help tags
<leader-s-r> - easy to use search (and replace)
 |- <n> - next match
 |- <N> - previous match
 |- <CR> - confirm replace
 |- <leader><CR> - replace all
<g-c-c> - comment line (not always works correctly)
<g-c>(Visual Mode) - comment selected (not always works correctly)

```
### Commands
```
Lazy - show lazy.nvim menu
Lazy reload all - reload installed plugins. Not all plugins may be reloaded in that way.
TransparentToggle - make nvim background transparent
Alpha - show cool starting screen (still configurating for correct start)
Leet - show cool LeetCode screen, where you can start solve problems
Leet run - run solution
Leet submit - submit solution to leet code
CocConfig - LSP configuration file
CocRestart - restart LSP service
CocUpdate - update LSP plugins
CocInstall - install LSP plugin (read more coc.nvim)
<:><(number)> - go to line (will show in buffer)
%s/\v<pattern>/<replacement?> - not beautiful but still search (and replace)
```
### Structure
```
init.lua - core file with all imports
coc-settings.json - file that you can open with command "CocConfig"
lua/vim-options.lua - core configurations for nvim
lua/keymaps.lua - core keybinds for nvim
lua/plugins/* - all the plugins. If you want to add any plugin - do it here.
Check some plugins for more info how to setup plugin.
```

### Good to know
 - Some plugins require set keymaps inside it's setup function. So if you can't find keymap - try to search in lua/plugins/
 - For plugin management Lazy is used. Read more about lazy.nvim
 - :q! - force quit
 - You always can close whole tmux pane (if using tmux) with <Pr-w>(Select)<x>

## Bash
### Good to know
 - PowerLine is used for beautiful interface of the PS. You are able to turn off it
 - History size increased to 20000
 - If PowerLine won't be used - PS also custom wrote
 - At the end of .bashrc you can find bunch of different if-statements. It's **strongly** recommended not to touch it. If you will not setup all the bash environment - I **recommend** to move all these if-statements to your .bash_profile or .bashrc

## Konsole
### Good to know
 - Main theme is used Stone
 - Main color is #e7bf7e
 - No buttons, no tabs, no menus. Just terminal
## Pictures
_Just some pictures that is used for environment_

[^clone]: When you **clone** code you should use `--recurse-submodules`, like this:
    ```bash
    git clone --recurse-submodules git@github.com:dargfox/dotfiles.git
    ```

[^modules]: Some of the directories have it's own repository, so in that case you have to add it to .gitmodules. In my case it's tmux plugins, that are cloned from git remote repositories.

    > [Thanks to Fatih Arslan](https://stackoverflow.com/a/10607225)

    To add modules to your dotfiles you can use next command:
    ```bash
    for x in $(find . -type d) ; do if [ -d "${x}/.git" ] ; then cd "${x}" ; origin="$(git config --get remote.origin.url)" ; cd - 1>/dev/null; git submodule add "${origin}" "${x}" ; fi ; done
    ```
    Or more readable version:
    ```bash
    for x in $(find . -type d) ; do
        if [ -d "${x}/.git" ] ; then
            cd "${x}"
            origin="$(git config --get remote.origin.url)"
            cd - 1>/dev/null
            git submodule add "${origin}" "${x}"
        fi
    done
    ```

[preview]: https://github.com/dargfox/dotfiles/raw/main/preview.png
