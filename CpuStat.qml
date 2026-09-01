import QtQuick
import Quickshell

import qs.config

Item {
    implicitHeight: Appearance.bar_widget_height
    implicitWidth: cpuText.implicitWidth + 25

    Rectangle {
        id: bgRect
        
        anchors.fill: parent
        
        color: "transparent"
        radius: 25

        Text {
            id: cpuText

            anchors.centerIn: parent
            
            text: "  " + SystemStats.cpuPercent.toFixed(2) + "%"
            color: Appearance.text
            font {
                family: Appearance.font_family
                pixelSize: Appearance.font_size + 1
            }
        }
    }
}