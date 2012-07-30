import QtQuick 1.1

Text {
    id: label
    opacity: 0
    scale: 0.3
    color: "white"
    font.pixelSize: 42

    Behavior on opacity { NumberAnimation { duration: 500 } }
    Behavior on scale { NumberAnimation { duration: 500 } }

    function appear(message) {
        label.text = message;
        label.opacity = 1;
        label.scale = 1;
    }
}
