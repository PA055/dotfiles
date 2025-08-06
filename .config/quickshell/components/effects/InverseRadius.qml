import Quickshell.Widgets
import Quickshell
import QtQuick

Item {
    id: root
    property int size

    Rectangle {
        id: solid
        implicitWidth: root.size
        implicitHeight: root.size
    }
    ClippingRectangle {
        implicitWidth: root.size * 2
        implicitHeight: root.size * 2
        radius: root.size
        color: "transparent"
    }
}
