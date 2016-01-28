# Load .profile, containing login, non-bash related initializations.
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
 
# Load .bashrc, containing non-login related bash initializations.
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

