import QtQuick 1.1
import Box2D 1.0
import "game.js" as Game

World {
    id: root

    property int bacteryCount: 5
    property int timeout: 10000

    signal wonLevel();
    signal lostLevel();

    onWonLevel: {
        for (var i in Game.enemies) {
            var enemy = Game.enemies[i];
            enemy.destroy();
        }
    }

    function startLevel(enemyCount, timeout, blockCount) {
        roundTimer.start();
        Game.enemies = [];
        bacteryCount = enemyCount;
        root.timeout = timeout;
        for (var i = 0; i < bacteryCount; i++) {
            var monera = moneraComponent.createObject(root);
            var newPos = monera.shufflePosition();
            monera.x = newPos.x;
            monera.y = newPos.y;
            Game.enemies.push(monera);
        }
        for (var i = 0; i < blockCount; i++) {
            var blocker = blockerComponent.createObject(root);
            Game.enemies.push(blocker);
        }
        print(Game.enemies.length);
    }

    onBacteryCountChanged: {
        if (bacteryCount <= 0) {
            roundTimer.stop();
            wonLevel();
        }
    }

    Rectangle {
        radius: 15
        color: "black"
        anchors.fill: parent
    }

    Timer {
        id: roundTimer
        interval: timeout
        onTriggered: {
            lostLevel();
        }
    }

    Component {
        id: moneraComponent
        Monera {
            id: monera
            x: monera.shufflePosition().x
            y: monera.shufflePosition().y
            onDied: {
                print("Killed");
                bacteryCount -= 1;
            }
        }
    }

    Component {
        id: blockerComponent
        Blocker {
            id: blocker
            x: Math.random() *
                (parent.width - blocker.width);
            y: Math.random() *
                (parent.height - blocker.height);
        }
    }

    Wall {
        height: 1
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }

    Wall {
        height: 1
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Wall {
        width: 1
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
    }

    Wall {
        width: 1
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
    }
}
