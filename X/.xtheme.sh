# Set GTK+ theme
# export GTK_THEME=Arc-Dark-solid
export GTK_THEME=wal
export GTK2_RC_FILES="$HOME/.themes/$GTK_THEME/gtk-2.0/gtkrc"
# Set Qt5 theme
export QT_QPA_PLATFORMTHEME=qt5ct
# NB: Qt4 style is set by qtconfig-qt4 in ~/.config/Trolltech.conf

# inform system about our choice
dbus-update-activation-environment --systemd GTK_THEME GTK2_RC_FILES QT_STYLE_OVERRIDE

