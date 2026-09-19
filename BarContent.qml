import QtQuick
import QtQuick.Layouts

import qs.config

Item {
    id: root

    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 16

        PowerMenuButton {}
        Workspaces {}
        Spotify {}
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 4

        Clock {}
    }

    RowLayout {
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 16

        Rectangle {
            implicitHeight: Appearance.bar_widget_height
            implicitWidth: row.width
            radius: 25
            color: Appearance.foreground
            
            RowLayout {
                id: row
                spacing: 15
                
                Network {}
                CpuStat {}
                RamStat {}
            }
            
        }
        
        
        SystemTray {}
        Notifications {}
        Power {}
    }
}