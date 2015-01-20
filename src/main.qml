import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

import QtBluetooth 5.3
import QtSensors 5.3
import QtQuick.Layouts 1.1

Window {
    id: root
    visible: true
    width: 360
    height: 360

    property string remoteDevice;

    property real accel_x: 0
    property real accel_y: 0
    property real accel_z: 0

    onRemoteDeviceChanged: {
        loader.source = "btworker.qml";
        console.log("Using device: " + remoteDevice);
    }

    Rectangle {
        id: background
        color: "black"

        anchors.fill: parent

        ColumnLayout {
            id: colLayout
            anchors.fill:parent
            Image {
                id: logo
                fillMode: Image.PreserveAspectFit

                source: "logo.png"
                Layout.fillWidth: parent
            }

            Button {
                id: connectButton
                text: "Select Parent Device"

                Layout.alignment: Qt.AlignCenter

                onClicked: { loader.source = "btSelector.qml"; }
            }
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
    }

    Accelerometer {
        id: accel
        dataRate: 200
        active: true

        onReadingChanged: {
            accel_x = reading.x
            accel_y = reading.y
            accel_z = reading.z

            if (btSocket.connected) {
                var string = "x:"+accel_x+"y:"+accel_y+"z:"+accel_z
                btSocket.sendStringData(string)
            }
        }
    }

    BluetoothSocket {
        id: btSocket
        connected: true

        onSocketStateChanged: {
            console.log("Socket State Changed: \t", socketState)

            if (socketState != 3) {
                //disconnected
                loader.source = "btSelector.qml";
            }
        }


    }
}
