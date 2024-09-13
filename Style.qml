pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property color backgroundColor: "#353537"
    readonly property color white: "#FFFFFF"


    function alphaColor(color, alpha) {
        let actualColor = Qt.darker(color, 1)
        actualColor.a = alpha
        return actualColor
    }
}
