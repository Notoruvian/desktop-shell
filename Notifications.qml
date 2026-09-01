import QtQuick
import Quickshell
import Quickshell.Io

import qs.config

Item {
    implicitHeight: Appearance.bar_widget_height
    implicitWidth: 40

    Rectangle {
        anchors.fill: parent

        radius: 25
        color: mouseArea.containsMouse ? Appearance.highlight : Appearance.foreground
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing: Easing.OutQuad
            }
        }

        Text {
            anchors.centerIn: parent
            text: ""
            color: mouseArea.containsMouse ? Appearance.background : Appearance.text
            font {
                pixelSize: Appearance.font_size + 2
                family: Appearance.font_family
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: notifProc.running = true
        }
    }

    Process {
        id: notifProc
        command: ["swaync-client", "-op"]
        running: false
        onExited: running = false
    }
}