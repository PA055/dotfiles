import qs.components.containers
import QtQuick
import QtQuick.Shapes

Item {
    id: root

    Shape {
        id: shape
        anchors.fill: parent
        ShapePath {
            // strokeWidth: 2
            // strokeColor: "white"
            fillColor: "white"

            CubicTabPath {
                startX: 0; startY: 0
                endX: shape.height; endY: shape.height
            }
            PathLine { x: shape.width - shape.height; y: shape.height }
            CubicTabPath {
                startX: shape.width - shape.height; startY: shape.height
                endX: shape.width; endY: 0
            }
            PathLine { x: 0; y: 0 }
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
}
