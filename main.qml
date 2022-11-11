import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: home
    width: 640
    height: 480
    visible: true
    title: qsTr("Demo Project")
    
    Loader{
        id: mainWindowLoader
        anchors.fill: parent
        source: "HomeWindow.qml"
    }
}
