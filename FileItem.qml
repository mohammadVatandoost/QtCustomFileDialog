import QtQuick 2.0

Item {
    property string name: ""
    property bool isDirectory: true
    property string path: ""
    width: 200
    height: 80
    Text {
        text: qsTr(name)
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
             console.log("MouseArea")
          if(isDirectory) {
             FileItemsModel.goToDirectory(path);
          } else {
              FileItemsModel.selectFile(path);
          }
        }
    }
}
