Whenever you change a Niri setting or add a new config folder to your dotfiles, follow this simple "Add-Commit-Push" routine:

```
git add . (Stages your changes)

git commit -m "Updated niri keybinds" (Labels your changes)

git push (Uploads them to GitHub)
```
How to use this on a new computer?
If you ever break your system or buy a new one, your "Recovery Plan" is now just 4 commands:

Bash
```
git clone https://github.com/X4eros/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow niri
stow noctalia
```

