import qs.services
import qs.components.containers
import QtQuick
import QtQuick.Shapes

Item {
    id: root
    property int textOffset: -9

    Shape {
        id: shape
        anchors.fill: parent
        ShapePath {
            // strokeWidth: 2
            // strokeColor: "white"
            fillColor: "white"
            PathLine { x: 0; y: shape.height }
            PathLine { x: shape.width - shape.height; y: shape.height }
            CubicTabPath {
                startX: shape.width - shape.height; startY: shape.height
                endX: shape.width; endY: 0
            }
            PathLine { x: 0; y: 0 }
        }

    }

    Text {
        id: text
        color: "black"
        anchors.centerIn: shape
        anchors.horizontalCenterOffset: root.textOffset
        text: Time.format("h:mm:ss AP")
    }
}
