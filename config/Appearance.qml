pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    property int font_size: 15
    property string font_family: "JetBrainsMono Nerd Font"

    property color primary: Colors.primary
    property color background: Colors.background
    property color border: Colors.border
    property color foreground: Colors.foreground
    property color highlight: Colors.highlight
    property color text: Colors.text
    property color text_dim: Colors.text_dim
    property color text_muted: Colors.text_muted

    property int bar_height: 43
    property int bar_widget_height: 35
}
