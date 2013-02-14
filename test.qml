import QtQuick 1.1

Rectangle {
    width: 800
    height: 600
    color: "#bbbbbb"


    SwissRailwaysClock {
        id: clock
        anchors.fill: parent
        anchors.margins: 50
        seconds: 52
        minutes: 23
        hours: 7
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            clock.seconds = clock.seconds + 1
            if (clock.seconds > 59) {
                clock.seconds = 0
                clock.minutes = clock.minutes + 1
                if (clock.minutes > 59) {
                    clock.minutes = 0
                    clock.hours = clock.hours + 1
                    if (clock.hours > 12)
                        clock = 0
                }
            }
        }
    }
}
