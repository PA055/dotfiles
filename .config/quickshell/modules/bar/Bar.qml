import Quickshell
import Quickshell.Widgets
import QtQuick
import qs.services
import qs.components.effects

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 32
    color: "transparent"

    Rectangle {
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        implicitWidth: 80
        color: "white"
        bottomRightRadius: 8
        Text {
            id: text
            color: "black"
            anchors.centerIn: parent
            text: Time.format("h:mm:ss AP")
        }
        ClippingRectangle {
            anchors {
                left: parent.right
                top: parent.top
            }
            implicitHeight: 8
            implicitWidth: 8
            color: "white"

            Rectangle {
                anchors {
                    left: parent.left
                    top: parent.top
                }
                implicitWidth: 8
                implicitHeight: 8
                topLeftRadius: 8
                color: "red"
            }
        }
    }
}
