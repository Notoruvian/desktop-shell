import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

import qs.config

Variants {
    id: root
    property bool unload: false

    property color backgroundColor: '#80000000'
	property color buttonColor: Appearance.foreground
	property color buttonHoverColor: Appearance.highlight

    default property list<LogoutButton> buttons

    model: Quickshell.screens

    PanelWindow {
        id: window

        property var modelData
        screen: modelData

        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

        color: "transparent"

        contentItem {
            focus: true
            Keys.onPressed: event => {
                if (event.key == Qt.Key_Escape) root.unload = true;
                else {
                    for (let i = 0; i < buttons.length; i++) {
                        let button = buttons[i];
                        if (event.key == button.keybind) button.exec();
                    }
                }
            }
        }

        anchors {
			top: true
			left: true
			bottom: true
			right: true
		}

        Rectangle {
            color: root.backgroundColor
            anchors.fill: parent

            MouseArea {
                anchors.fill: parent
                
                onClicked: Qt.quit()

                RowLayout {
                    anchors.centerIn: parent

                    width: parent.width * 0.85
                    height: parent.height * 0.85

                    spacing: 15

                    Repeater {
                        model: buttons
                        delegate: Rectangle {
                            required property LogoutButton modelData;

                            implicitWidth: mouseArea.containsMouse ? parent.width * 0.18 : parent.width * 0.15
                            Behavior on implicitWidth {
                                NumberAnimation {
                                    duration: 150
                                    easing: Easing.OutQuad
                                }
                            }
                            
                            implicitHeight: parent.height * 0.75

                            color: mouseArea.containsMouse ? buttonHoverColor : buttonColor
                            Behavior on color {
                                ColorAnimation {
                                    duration: 200
                                    easing: Easing.OutCubic
                                }
                            }
                            radius: 25

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: modelData.exec()
                            }

                            Text {
                                id: icon
                                anchors.centerIn: parent
                                text: modelData.icon
                                color: mouseArea.containsMouse ? Appearance.background : Appearance.primary
                                font {
                                    pixelSize: 150
                                    family: Appearance.font_family
                                }

                            }

                            Text {
                                anchors {
                                    top: icon.bottom
                                    topMargin: 50
                                    horizontalCenter: parent.horizontalCenter
                                }

                                text: modelData.text
                                font {
                                    pixelSize: 30
                                    family: Appearance.font_family
                                }
                                color: mouseArea.containsMouse ? Appearance.background : Appearance.text
                            }
                        }
                    }
                }
            }
        }
    }
}