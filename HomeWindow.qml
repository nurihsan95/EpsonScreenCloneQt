import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Rectangle {
    id: homeWindow
    objectName: "homeWindow"
    width: 640
    height: 480
    color: "#003399"

    Rectangle {
        id: baseContent
        objectName: "baseContent"
        color: "#7dffffff"
        anchors{
            left: parent.left
            right: parent.right
            top: homeHeader.bottom
            bottom: parent.bottom
            bottomMargin: 80
            topMargin: 80
        }
        ListView{
            id: contentList
            objectName: "contentList"
            orientation: ListView.Horizontal
            anchors.fill: parent
            snapMode: ListView.SnapToItem
            boundsBehavior: Flickable.StopAtBounds
            spacing: 20
            clip: true
            model: homeContentModel
            delegate: Rectangle{
                id: content
                anchors{
                    top: parent.top
                    bottom:parent.bottom
                }
                width: 200
                color:"#ffffff"
                Column{
                    id: columnContent
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    objectName: "content"
                    Image {
                        id: iconContent
                        objectName: "iconContent"
                        width: 180
                        fillMode: Image.PreserveAspectFit
                        source: icon
                    }
                    Text {
                        id: titleContent
                        text: name
                        font.pixelSize: 28
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }
                MouseArea{
                   anchors.fill: parent
                   onPressed: parent.color ="#e4e4e4"
                   onReleased: parent.color = "#ffffff"
                   onClicked: window !== "" ? mainWindowLoader.source = window : null
                }
            }
        }
        ListModel{
            id:homeContentModel
            ListElement{
                name: "Copy"
                icon: "assets/copyIcon.png"
                window: null
            }
            ListElement{
                name: "Scan"
                icon: "assets/scanIcon.png"
                window: null
            }
            ListElement{
                name: "Memory"
                icon: "assets/memoryIcon.png"
                window: null
            }
            ListElement{
                name: "Settings"
                icon: "assets/settingIcon.png"
                window: "SettingsWindow.qml"
            }
        }
    }

    RowLayout{
        id: homeHeader
        height: 80
        anchors.topMargin: 5
        clip: false
        anchors.rightMargin: 5
        anchors.leftMargin: 450
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }
        Rectangle{
            id: soundStatus
            width: 60
            color: "#ffffff"
            Layout.fillHeight: true
            anchors{
                top: parent.top
                bottom: parent.bottom
            }
            Layout.fillWidth: true
            Image {
                id: soundIcon
                anchors{
                    top: parent.top
                    bottom: parent.bottom
                }
                width: parent.width
                fillMode: Image.PreserveAspectFit
                source: muteSetting.muteSettingValue ? "qrc:/assets/muteIcon.png" :"qrc:/assets/volumeIcon.png"
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
            }
            MouseArea{
               anchors.fill: parent
               onPressed: parent.color ="#e4e4e4"
               onReleased: parent.color = "#ffffff"
               onClicked: muteSetting.muteSettingValue = !muteSetting.muteSettingValue
            }
        }
        Rectangle{
            id: wifiStatus
            width: 60
            color: "#ffffff"
            Layout.fillHeight: true
            anchors{
                top: parent.top
                bottom: parent.bottom
            }
            Layout.fillWidth: true
            Image {
                id: wifiIcon
                anchors{
                    top: parent.top
                    bottom: parent.bottom
                }
                width: parent.width
                fillMode: Image.PreserveAspectFit
                source: "assets/wifiOffIcon.png"
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillWidth: true
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
