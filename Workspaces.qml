import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.config

Item {

    Layout.leftMargin: 4

    implicitWidth: bgRect.implicitWidth
    implicitHeight: bgRect.implicitHeight


    Rectangle {
        id: bgRect
        
        implicitHeight: Appearance.bar_widget_height
        implicitWidth: workspacesRow.implicitWidth + 12
        radius: 25

        color: Appearance.foreground


        RowLayout {
            id: workspacesRow
            anchors.centerIn: parent

            spacing: 4         

            Repeater {
                model: 9

                Rectangle {
                    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                    
                    property bool is_active: Hyprland.focusedWorkspace?.id === (index + 1)


                    anchors.horizontalCenter: parent
                    
                    implicitHeight: 35
                    implicitWidth: is_active ? 65 : 50
                    Behavior on implicitWidth {
                        NumberAnimation {
                            duration: 300
                            easing {
                                type: Easing.OutExpo
                            }
                        }
                    }

                    radius: 25
                    color: is_active ? Appearance.primary : mouse.containsMouse ? Appearance.highlight : bgRect.color
                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                            easing: Easing.OutQuad
                        }
                    }
                    
                    
                    Text {
                        anchors.centerIn: parent
                        
                        text: index + 1
                        color: mouse.containsMouse ? Appearance.background : parent.is_active ? Appearance.background : (parent.ws ? Appearance.text_dim : Appearance.text_muted)
                        font {
                            pixelSize: Appearance.font_size
                            family: Appearance.font_family
                        } 
                    }

                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${index + 1} })`) 
                    }
                }
                
            }  
        }
    }
}
