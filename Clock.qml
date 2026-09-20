import QtQuick
import Quickshell

import qs.config

Item {
    id: root

    property bool short: true

    implicitWidth: timeText.implicitWidth + 40
    implicitHeight: Appearance.bar_widget_height

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutExpo
        }
    }

    SequentialAnimation {
        id: pulseInOut
        running: false

        property int animDuration: 250
        
        ColorAnimation {
            target: timeText
            duration: parent.animDuration
            property: "color"
            to: Appearance.background
            easing: Easing.OutCubic
            onFinished: {
                root.short = !root.short
            }
        }

        ScriptAction {
            script: {
                root.short = !root.short
            }
        }

        ColorAnimation {
            target: timeText
            duration: parent.animDuration
            property: "color"
            to: Appearance.text
            easing: Easing.OutCubic
        }
    }


    Rectangle {
        id: bgRect

        implicitHeight: parent.implicitHeight
        implicitWidth: parent.implicitWidth
        anchors.centerIn: parent

        color: Appearance.foreground

        radius: 25

        Text {
            id: timeText
            
            anchors.centerIn: parent

            text: root.short ? Qt.formatDateTime(Time.time, "hh:mm AP") : Qt.formatDateTime(Time.time, "ddd, MMM dd - hh:mm AP")
            color: Appearance.text

            font {
                pixelSize: 16
                family: Appearance.font_family
            }
        }

        MouseArea {
            id: mouse
            anchors.fill: parent

            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onClicked: pulseInOut.running = true
        }
    }
}
