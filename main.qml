import QtQuick 1.1

Item {
    width: 600
    height: 400

    property int currentLevel: 1

    GameArea {
        id: game
        anchors.fill: parent
        onWonLevel: {
            currentLevel += 1;
            var blockerCount = 0;
            if (currentLevel > 4)
                blockerCount = 1;
            game.startLevel(currentLevel,
                            10000,
                            blockerCount);
        }
        onLostLevel: status.appear("You lose");
    }

    PlayButton {
        id: playButton
        onClicked: {
            playButton.visible = false;
            game.startLevel(1, 10000);
        }
    }

    StatusGame {
        id: status
        anchors.centerIn: parent
    }
}
