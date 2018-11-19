# What's this
My Race Inspired Car Enhancement (RICE).
The files constantly change, some of the screenshots might be outdated as well.
Generally the one on top marked "latest" is always up to date.

# Screens

![](images/new.png)

# Stuff used 
These are the stuff that I use. They all have configs here apart from the two suckless programs.

- rxvt-unicode (I have stopped using it but it's still there)
- [this st](https://github.com/podocarp/st)
- [this tabbed](https://github.com/podocarp/tabbed)
- ranger
  - w3m
  - pywal
  - feh
  - [schemer2](https://github.com/thefryscorer/schemer2)
 - vim (or gvim for convenient source of +clipboard)
  - Vundle
- i3-gaps
  - i3-lock
  - i3status (dormant)
  - polybar
  - Xcompmgr
- fonts (included)
  - Some from [nerd font](https://github.com/ryanoasis/nerd-fonts)
  - Adobe Source Han

# Usage
`./setup.sh`.
This script makes all your configs a symlink of whatever files are in here, so it *will wipe your current configs*.

# Notes
There might be some changes that you don't like. This section lists a few changes that might annoy you:

| Change | Location of config |
| --- | --- |
| Caps is Esc | `.Xmodmap` |
| Synaptic Trackpad disabled by default | `.xprofile` |
| Alpha fade in/out delay | `.xprofile` |

# Keybinds
Here are some extra stuff I added.
Most of the other keybinds are default unless stated otherwise.

## ranger
| Key combo | Function |
| --- | --- |
| bw | Set background and generate new theme based on the image under your cursor. |
| bl | Set lock screen wallpaper based on the image under your cursor. Does not generate theme. |

## vim
There's really quite a few here, please read the config. This is just the more obvious ones:

| Key combo | Function |
| --- | --- |
| ij | Esc. |
| Ctrl c | Copies to system clipboard. Requires vim compiled with +clipboard. |
| Ctrl v | In insert mode, pastes from system clipboard. Requires +clipboard. |
| Ctrl+hjkl | Replaces Ctrl+W+hjkl for split focus. |
| Ctrl+w+hjkl | Replaces Ctrl+w+HJKL for split motion. |
