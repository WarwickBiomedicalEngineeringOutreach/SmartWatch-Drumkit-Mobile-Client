import QtQuick 2.4
import QtBluetooth 5.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    id: btSelectionPage
    width: 360
    height: 360
    color: "black"

    anchors.fill: parent


    ListView {
        id: btDeviceList

        anchors.fill: parent

        model: BluetoothDiscoveryModel {
            discoveryMode: BluetoothDiscoveryModel.FullServiceDiscovery
            onErrorChanged: {
                if (error == BluetoothDiscoveryModel.NoError)
                    return;
                if (error == BluetoothDiscoveryModel.PoweredOffError)
                    console.log("Bluetooth turned off");
                else
                    console.log("Cannot find devices");
            }
        }

        delegate: Button {
            width: btDeviceList.width + 2
            text: model.name
            onClicked: {
                root.remoteDevice = model.remoteAddress;
                btSocket.setService(model.service);
            }
        }
    }

}
