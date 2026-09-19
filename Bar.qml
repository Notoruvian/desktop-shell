import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick.Effects

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
            
            implicitHeight: Appearance.bar_height + 15
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

                RectangularShadow {
                    implicitHeight: parent.implicitHeight
                    implicitWidth: parent.implicitWidth * 0.99
                    anchors.horizontalCenter: parent.horizontalCenter
                    offset.y: 5
                    radius: 25
                    blur: 12
                    spread: 1
                    color: Qt.rgba(0.0, 0.0, 0.0, 0.7)
                    cached: true
                    z: -1
                }
            }
        }
    }
}
