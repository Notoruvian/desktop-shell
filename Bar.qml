import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland

import qs.config

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: barRoot

            Component.onCompleted: {
                Globals.barWindow = barRoot
                console.log("Set Globals bar window as: " + barRoot)
            }

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                left: 4
                right: 4
                top: 4
            }
            
            implicitHeight: Appearance.bar_height + 6 
            color: "transparent"

            Rectangle {
                implicitWidth: parent.width
                implicitHeight: Appearance.bar_height
                color: Appearance.background
                radius: 25
                z: 1

                BarContent {
                    anchors.fill: parent
                }
            }

                
            // Bar shadow
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                implicitHeight: Appearance.bar_height
                implicitWidth: parent.width - 10
                radius: 25
                color: '#dd0e0e0e'
                y: parent.y + 5
            }
            

            
        }

        
    }
}