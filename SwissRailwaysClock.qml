/*
 Copyright (c) 2013, Juha Turunen
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 1.1

Item {
    id: clock

    property real seconds
    property real minutes
    property real hours

    property real _scaler : clockFace.width / 600
    // Maintain aspect ration by taking the smaller dimension of the root and binding
    // both of clock's dimensions to that

    Image {
        id: clockFace
        width: parent.width < parent.height ? parent.width : parent.height
        height: width


        source: "swissface.svg"
        sourceSize.width: 600 * _scaler
        sourceSize.height: 600 * _scaler
        anchors.centerIn: parent



        Image {
            source: "minutes.svg"
            smooth: true
            sourceSize.width: 357 * _scaler
            sourceSize.height: 23 * _scaler
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 99.0 * _scaler
            anchors.verticalCenterOffset: 0.5 * _scaler
            transform: Rotation {
                origin.x: 80 * _scaler; origin.y: 11.5 * _scaler;
                angle: (clock.minutes - 15) * 6
            }
        }

        Image {
            source: "hours.svg"
            smooth: true
            sourceSize.width: 249 * _scaler
            sourceSize.height: 29 * _scaler
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 50.0 * _scaler
            anchors.verticalCenterOffset: 0.5 * _scaler
            transform: Rotation {
                origin.x: 75 * _scaler; origin.y: 14.5 * _scaler;
                angle: (clock.hours - 3) * 30 + minutes * 0.5
            }
        }


        Image {
            source: "seconds.svg"
            smooth: true
            sourceSize.width: 357 * _scaler
            sourceSize.height: 70 * _scaler
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 95 * _scaler
            transform: Rotation {
                id: secondRotation
                origin.x: 84 * _scaler; origin.y: 35 * _scaler;
                angle: (clock.seconds - 15) * 6
            }
        }
    }
}
