import QtQuick 1.1

Image {
    id: monera

    property int hp: 2
    signal died()

    source: "monera.png"

    function shufflePosition() {
        var x = Math.random() *
            (parent.width - monera.width);
        var y = Math.random() *
            (parent.height - monera.height);

        return Qt.point(x, y);
    }

    Behavior on x {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutQuad
        }
    }

    Behavior on y {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutQuad
        }
    }

    NumberAnimation {
        id: disappearAnimation
        duration: 500
        target: monera
        property: "opacity"
        from: 1
        to: 0
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            hp -= 1;

            if (hp > 0) {
                var newPos = shufflePosition();
                monera.x = newPos.x;
                monera.y = newPos.y;
            } else if (hp == 0) {
                monera.died();
                disappearAnimation.start();
            }
        }
    }
}

