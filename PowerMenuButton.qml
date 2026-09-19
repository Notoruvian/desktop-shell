import QtQuick
import Quickshell
import Quickshell.Widgets

import qs.config

Item {
    implicitHeight: Appearance.bar_widget_height
    implicitWidth: 40

    Rectangle {
        anchors.fill: parent
        color: mouseArea.containsMouse ? Appearance.primary : Appearance.foreground
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing: Easing.OutQuad
            }
        }
        radius: 25

        Image {
            anchors.centerIn: parent
            source: "assets/icons/nixos_logo.png"
            sourceSize.width: 25
            sourceSize.height: 25
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }
 
}
