import QtQuick 2.4
import QtQuick.Layouts 1.1

Rectangle {
    id: worker

    color: "black"

    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        Image {
            id: logo
            fillMode: Image.PreserveAspectFit

            source: "logo.png"
            Layout.fillWidth: parent
        }

        Text {
            id: datalabel

            anchors.alignWhenCentered: true

            text: "X: " + root.accel_x + "\nY: " + root.accel_y + "\nZ: " + root.accel_z
            color: "white"

        }

    }
}

