import QtQuick
import Quickshell
import Quickshell.Io

import qs.config

Item {
    implicitHeight: Appearance.bar_widget_height
    implicitWidth: 45

    Rectangle {
        implicitHeight: parent.implicitHeight
        implicitWidth: parent.implicitWidth

        color: mouseArea.containsMouse ? Appearance.highlight : Appearance.foreground
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing: Easing.OutQuad
            }
        }
        radius: 25

        Text {
            anchors.centerIn: parent

            text: ""
            color: mouseArea.containsMouse ? Appearance.background : '#eb4473'
            font {
                family: Appearance.font_family
                pixelSize: Appearance.font_size
            }
        }

        MouseArea {
            id: mouseArea
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
            onClicked: Globals.loadLogoutMenu = true
        }
    }
    
}