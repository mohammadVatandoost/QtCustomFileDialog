import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Choose File")

    ColumnLayout {
       width: parent.width/2
       spacing: 15
       Button {
           Layout.alignment: Qt.AlignHCenter
           text: qsTr("open Usb")
           highlighted: true
           Material.background: Material.Blue
           onClicked: {
               if(FileItemsModel.isUSBDrive()) {
                   FileItemsModel.refreshDirectory();
                    popup.open();
               }
           }
       }

    }

    Popup {
            id: popup
            padding: 0
            width: 400
            height: 500
            x: Math.round((parent.width - width) / 2)
            y: 30
            z: 10
            focus: true
            closePolicy: Popup.CloseOnEscape
            ColumnLayout {
                anchors.fill: parent
                ListView {
                    width: parent.width*0.95;
                    height: 350
                    Layout.alignment: Qt.AlignHCenter
                    property bool auth: false
                    function setAuth(temp) {root.auth = temp;}
                    model: FileItemsModel
                    delegate: FileItem {
                        name: model.Name
                        isDirectory: model.isDirectory
                        path: model.Path
                    }
                    ScrollBar.vertical: ScrollBar {}
                }
                Button {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Back")
                    highlighted: true
                    Material.background: Material.Blue
                    onClicked: {
                         FileItemsModel.backDirectory();
                    }
                }
            }
    }
}
