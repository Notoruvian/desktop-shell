import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

import qs.config

Item {
    implicitHeight: Appearance.bar_widget_height
    implicitWidth: systemTrayRow.width + 30

    Rectangle {
        id: bgRect

        implicitWidth: parent.implicitWidth
        implicitHeight: parent.implicitHeight
        color: Appearance.foreground
        radius: 25

        RowLayout {
            id: systemTrayRow
            spacing: 8
            anchors.centerIn: parent

            Repeater {
                id: items
                model: SystemTray.items

                delegate: Item {
                    id: trayItem
                    property SystemTrayItem item: modelData

                    implicitWidth: 20
                    implicitHeight: 20

                    Image {
                        anchors.fill: parent
                        asynchronous: true

                        source: {
                            let icon = trayItem.item.icon;
                            if (icon.includes("?path=")) {
                                const [name,path] = icon.split("?path=");
                                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
                            }

                            console.log("SysTray icon: " + icon)
                            return icon;
                        }
                    }

                    MouseArea {
                        id: trayItemMouseArea
                        anchors.fill: parent

                        onClicked: event => {  
                            switch (event.button) {
                                case Qt.LeftButton:
                                    if (item.hasMenu) {
                                        menu.open();
                                    }
                                    break;
                                case Qt.RightButton:
                                    if (item.hasMenu) {
                                        menu.open();
                                    }
                                    break;
                            }

                            event.accepted = true;
                        }

                        HoverHandler {
                            id: hover
                            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    QsMenuAnchor {
                        id: menu
                        menu: trayItem.item.menu
                        anchor.window: Globals.barWindow

                        anchor.rect.x: trayItem.mapToGlobal(0, 0).x
                        anchor.rect.y: trayItem.mapToGlobal(0, 0).y
                        
                        anchor.rect.width: trayItem.width
                        anchor.rect.height: trayItem.height
                        
                        anchor.edges: Edges.Bottom
                    }

                    
                }
            }
        }
    }
}
