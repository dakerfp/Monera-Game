import QtQuick 1.1

Image {
    id: blocker

    width: 150
    height: 150
    source: "woodenbox.png"
    z: 2

    MouseArea {
        anchors.fill: parent
        drag.target: blocker
    }
}
