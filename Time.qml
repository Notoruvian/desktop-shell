pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
    id: root
    property date time: new Date()

    Timer {
        interval: 30000
        running: true
        repeat: true

        onTriggered: root.time = new Date()
    }
}