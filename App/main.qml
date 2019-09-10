import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.3
import "Constants.js" as Const

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr(Const.MainWindow_Title)
    color: Const.Color_DarkGrey

    Material.theme: Material.Dark
    Material.accent: Material.BlueGrey

    footer: ToolBar {
        background: Rectangle {
            anchors.fill: parent
            color : "#ffa040"
        }
        height: 25
        z: 2
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: sidemenu.left
        anchors.leftMargin: 0
        RowLayout {
            anchors.fill: parent
            spacing: 10
            Label { // Disconnect color bf360c, reconnecting 01579b, connect 33691e
                text: "USB status: <font color=\"#bf360c\">No connection</font>"
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: false
            }

            Label { // Disconnect color bf360c, reconnecting 01579b
                text: "Modbus status: "//<font color=\"#bf360c\">Disconnect</font>
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: false
            }
            Image {
                id: name
                source: "res/error_mark.png"
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: false
                MouseArea {
                    id: ma
                    hoverEnabled: true         //this line will enable mouseArea.containsMouse
                    anchors.fill: parent
                   }
                ToolTip.visible: ma.containsMouse
                ToolTip.text: "Connection error"
                ToolTip.delay: 1000
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    Settings {
        id: settings_page
        z: -1
    }

    FirmwareUpdate {
        id: fw_page
    }

    ComMenu {
        id: com_page
    }

    ToolBar {
        id: sidemenu
        width: 55
        z: 1
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        background: Rectangle {
            color: Const.Color_DarkBlueGrey
        }

        Button {
            id: btnSettingsMenu
            x: 69
            y: 410
            icon.source: "res/settings_menu.png"
            ToolTip.visible: hovered
            ToolTip.delay: 1000
            ToolTip.text: "Manage"
            width: 40
            height: 48
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            antialiasing: true
            onClicked: stack.replace(settings_page)
            background: Rectangle {
                        color: parent.hovered ? Const.Color_LightBlueGrey : Const.Color_DarkBlueGrey
                        border.color: Const.Color_DarkBlueGrey
                        border.width: 1
                        radius: 4
                    }
        }

        Button {
            id: btnHomeMenu
            x: 69
            ToolTip.visible: hovered
            ToolTip.delay: 1000
            ToolTip.text: "Home"
            icon.source: "res/home_menu.png"
            width: 40
            height: 48
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            antialiasing: true
            background: Rectangle {
                        id: recHomeMenu
                        color: parent.hovered ? Const.Color_LightBlueGrey : Const.Color_DarkBlueGrey
                        border.color: Const.Color_DarkBlueGrey
                        border.width: 1
                        radius: 4
                    }
        }

        Button {
        id: btnFirmwareMenu
        x: 69
        icon.source: "res/firmware_menu.png"
        ToolTip.visible: hovered
        ToolTip.delay: 1000
        ToolTip.text: "Update Firmware"
        width: 40
        height: 48
        anchors.top: btnComMenu.bottom
        anchors.topMargin: 40
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        antialiasing: true
        onClicked: stack.replace(fw_page)
        background: Rectangle {
                    color: parent.hovered ? Const.Color_LightBlueGrey : Const.Color_DarkBlueGrey
                    border.color: Const.Color_DarkBlueGrey
                    border.width: 1
                    radius: 4
                }
        }

        Button {
        id: btnComMenu
        x: 69
        icon.source: "res/connection_logo.png"
        ToolTip.visible: hovered
        ToolTip.delay: 1000
        ToolTip.text: "Device Communication"
        width: 40
        height: 48
        anchors.top: btnHomeMenu.bottom
        anchors.topMargin: 40
        antialiasing: true
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: stack.replace(com_page)
        background: Rectangle {
                    color: parent.hovered ? Const.Color_LightBlueGrey : Const.Color_DarkBlueGrey
                    border.color: Const.Color_DarkBlueGrey
                    border.width: 1
                    radius: 4
                }
        }
    }

    StackView {
        id: stack
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: sidemenu.right
        anchors.leftMargin: 0
        initialItem: settings_page
        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 100
            }
        }
        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        pushEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 100
                }
            }
            pushExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 100
                }
            }
            popEnter: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 0
                    to:1
                    duration: 100
                }
            }
            popExit: Transition {
                PropertyAnimation {
                    property: "opacity"
                    from: 1
                    to:0
                    duration: 100
                }
            }
    }
}



















































































































/*##^## Designer {
    D{i:2;anchors_y:339}D{i:1;anchors_height:436;anchors_x:0;anchors_y:44}D{i:13;anchors_height:48;anchors_y:170}
D{i:15;anchors_height:48;anchors_y:330}D{i:17;anchors_height:48;anchors_y:250}
}
 ##^##*/
