pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

// This code was copied from: https://github.com/nucleus-hq/nucleus-shell/blob/main/quickshell/nucleus-shell/services/SystemDetails.qml
Singleton {

    property real ramPercent: 0
    property string ramUsage: ""
    property real cpuPercent: 0

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            ramProc.running = true;
            cpuProc.running = true;
        }
    }

    Process {
        id: ramProc
        running: true
        command: ["free","-g"]

        stdout: StdioCollector {
            onStreamFinished: {
                const line = text.split("\n").find(l => {
                    return l.startsWith("Mem:");
                });
                if (!line) {
                    return;
                }

                const p = line.split(/\s+/);
                const total = parseInt(p[1]);
                const used = parseInt(p[2]);
                ramPercent = used / total;
                ramUsage = `${used}/${total} GB`;
            }
        }
    }

    Process {
        id: cpuProc
        running: true
        command: ["uptime"]

        stdout: StdioCollector {
            onStreamFinished: {
                const match = text.match(/load average: ([0-9.]+)/);
                if (!match) {
                    return;
                }
                const load = parseFloat(match[1]);
                cpuPercent = Math.min(load / 4, 1);
            }
        }
    }
}
