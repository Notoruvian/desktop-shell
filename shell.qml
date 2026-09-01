import QtQuick
import Quickshell

import qs.config
import qs.logout

ShellRoot {
    Bar {}
    
    LazyLoader {
        id: logoutLoader

        loading: Globals.loadLogoutMenu

        LogoutMenu {
            id: logoutMenu
            onUnloadChanged: {
                logoutLoader.active = false
                Globals.loadLogoutMenu = false
            }

            LogoutButton {
                command: "loginctl lock-session"
                keybind: Qt.Key_K
                text: "Lock"
                icon: ""
            }

            LogoutButton {
                command: "hyprctl dispatch 'hl.dsp.exit()'"
                keybind: Qt.Key_E
                text: "Logout"
                icon: "󰍃"
            }

            LogoutButton {
                command: "systemctl suspend"
                keybind: Qt.Key_U
                text: "Suspend"
                icon: ""
            }

            LogoutButton {
                command: "systemctl hibernate"
                keybind: Qt.Key_H
                text: "Hibernate"
                icon: "󰤄"
            }

            LogoutButton {
                command: "systemctl poweroff"
                keybind: Qt.Key_K
                text: "Shutdown"
                icon: ""
            }

            LogoutButton {
                command: "systemctl reboot"
                keybind: Qt.Key_R
                text: "Reboot"
                icon: ""
            }
	    }
    }
}