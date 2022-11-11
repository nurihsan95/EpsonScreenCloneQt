import QtQuick 2.15

Rectangle{
    id: background
    width:640
    height: 480

    Rectangle{
        id: header
        height: 80
        color: "#003399"
        width: parent.width
        
        Text {
            id: titleText
            color: "#ffffff"
            text: qsTr("Settings")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: backButton
            width: 200
            height: 60
            color: "#2c2c2c"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 10
            anchors.topMargin: 10
            radius: 20
            Text {
                id: buttonText
                color: "#ffffff"
                text: qsTr("Back")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 32
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                anchors.fill: parent
                onPressed: parent.color ="#b32c2c2c"
                onReleased: parent.color = "#2c2c2c"
                onClicked: mainWindowLoader.source = "HomeWindow.qml"
            }
        }
    }
    Rectangle{
        id: baselist
        height: parent.height -80
        anchors.top: parent.top
        anchors.topMargin: 80
        width: parent.width

        ListView{
            anchors.fill: parent
            interactive: true
            clip: true
            model: settingsModel
            delegate: Rectangle{
                id: baseRow
                width: 640
                height: 150
                border.color: "black"
                border.width: 1
                Text {
                    id: listText
                    width: 640
                    height: 100
                    font.pixelSize: 34
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    clip: true
                    leftPadding: 5
                    topPadding: 5
                    maximumLineCount: 2
                    text: model.title
                    elide: Text.ElideLeft
                }

                Rectangle {
                    id: switchArea
                    x: 408
                    y: 106
                    width: 224
                    height: 36
                    color: "#999999"

                    Text {
                        id: switchText
                        color: "#ffffff"
                        anchors.fill: parent
                        text: muteSetting.muteSettingValue ? "On" : "Off"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 34
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: muteSetting.muteSettingValue = !muteSetting.muteSettingValue
                    }
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
