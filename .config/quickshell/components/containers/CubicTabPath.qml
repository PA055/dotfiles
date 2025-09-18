import QtQuick

PathCubic {
    property int startX
    property int startY
    property int endX
    property int endY

    property int width: endX - startX
    property int height: endY - startY

    control1X: startX + width / 2; control1Y: startY
    control2X: startX + width / 2; control2Y: endY
    x: endX; y: endY
}
