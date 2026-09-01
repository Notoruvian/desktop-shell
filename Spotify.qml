import QtQuick
import Quickshell
import Quickshell.Io

import qs.config

Item {
    id: root

    implicitWidth: musicText.implicitWidth + 30
    implicitHeight: Appearance.bar_widget_height

    Rectangle {
        id: bgRect

        anchors.fill: parent
        color: Appearance.foreground
        radius: 25

        Text {
            id: musicText
            anchors.centerIn: parent

            text: Media.available ? Media.playing ? Media.title + "  󰎇" : Media.title + "  " : "󰎊"
            color: Media.playing ? Appearance.text : Appearance.text_muted 
            
            Behavior on color { 
                ColorAnimation {
                    duration: 200
                    easing: Easing.OutQuad
                }
            }

            font {
                family: Appearance.font_family
                pixelSize: Appearance.font_size + 1
            }
        }

        MouseArea {
            id: mouseArea
            
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (Media.available) {
                    Media.togglePlay()
                }
            }
        }
    }
}
