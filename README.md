This is a setup for moving your shell config to remote machines for SSH sessions on user accounts shared with others.
The usual dotfile managing methods assume that you have your own account on every machine, which is not always the case.

This is WIP and for now only has a ZSH config and a tmux launcher.
Syncing other program configs should be possible to add.

It is meant to be used in a custom SSH login function like this:
```
ssmart() {
   IP=$1
   shift
   ssh user@$IP "curl https://raw.githubusercontent.com/jordus100/dotfiles/refs/heads/main/bootstrap.sh | bash"
   ssh -t user@$IP $@
}
```

