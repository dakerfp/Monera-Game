import QtQuick 1.1

Text {
    id: playButton
    signal clicked()

    anchors {
        right: parent.right
        top: parent.top
        rightMargin: 40
        topMargin: 20
    }
    text: "Play"
    font.pixelSize: 32
    color: "white"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            playButton.clicked();
        }
    }
}

