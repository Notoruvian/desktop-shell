import Quickshell
import QtQuick
import Quickshell.Networking

import qs.config

Item {
    id: root
    property bool expanded: false

    implicitWidth: text.implicitWidth + 20
    implicitHeight: Appearance.bar_widget_height
    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
            easing: Easing.OutExpo
        }
    }

    SequentialAnimation {
        id: pulseInOut
        running: false

        property int animDuration: 250
        
        ColorAnimation {
            target: text
            duration: parent.animDuration
            property: "color"
            to: Appearance.background
            easing: Easing.OutCubic
        }

        ScriptAction {
            script: {
                root.expanded = !root.expanded 
            }
        }

        ColorAnimation {
            target: text
            duration: parent.animDuration
            property: "color"
            to: Appearance.text
            easing: Easing.OutCubic
        }
    }

    Rectangle {
        anchors.fill: parent

        color: "transparent"
        radius: 25

        Text {
            id: text
            anchors.centerIn: parent

            text: {
                let text = "No Connection 󰖪"
                
                let devices = Networking.devices.values
                
                for (let i=0; i < Networking.devices.values.length; i++) {
                    let device = Networking.devices.values[i]
                    
                    for (let i=0; i < device.networks.values.length; i++) {
                        let network = device.networks.values[i]
                        
                        if (network.connected == true) {
                            if (root.expanded) {
                                text = network.name + "  "
                            } else {
                                text = ""
                            }
                        
                        } else if (root.expanded) {
                            text = "No Connection 󰖪"
                        } else {
                            text = "󰖪"
                        }
                    }
                }

                return text
            }
            color: Appearance.text
            font {
                family: Appearance.font_family
                pixelSize: Appearance.font_size + 2
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                pulseInOut.running = true
            }
        }
    }
}