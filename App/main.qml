import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("ComTool")
    color: "#333333"

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
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
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
            color: "#34515f"
        }

        Button {
            id: btnSettingsMenu
            x: 69
            y: 410
            onHoveredChanged: rec.color = hovered ? "#8eacbc" : "#34515f"

            icon.source: "res/settings_menu.png"
            ToolTip.visible: hovered
            ToolTip.delay: 1000
            ToolTip.text: "Manage"
            width: 40
            height: 48
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                        id: rec
                        color: "#34515f"
                        border.color: "#34515f"
                        border.width: 1
                        radius: 4
                    }
        }

        Button {
            id: btnHomeMenu
            x: 69
            onHoveredChanged: rec2.color = hovered ? "#8eacbc" : "#34515f"
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
            background: Rectangle {
                        id: rec2
                        color: "#34515f"
                        border.color: "#34515f"
                        border.width: 1
                        radius: 4
                    }
        }

        Button {
        id: btnFirmwareMenu
        x: 69
        onHoveredChanged: rec3.color = hovered ? "#8eacbc" : "#34515f"

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
        background: Rectangle {
                    id: rec3
                    color: "#34515f"
                    border.color: "#34515f"
                    border.width: 1
                    radius: 4
                }
        }

        Button {
        id: btnComMenu
        x: 69
        onHoveredChanged: rec4.color = hovered ? "#8eacbc" : "#34515f"

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
        background: Rectangle {
                    id: rec4
                    color: "#34515f"
                    border.color: "#34515f"
                    border.width: 1
                    radius: 4
                }
        }
    }

    CheckBox {
        id: checkBox
        x: 50
        y: 353
        text: qsTr("Check Box")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 63
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Slider {
        id: slider
        x: 346
        y: 261
        value: 0.5
        onHoveredChanged: test.color = hovered || pressed ? "#f6f6f6" : "#8eacbc"
        onPressedChanged: test.color = hovered || pressed ? "#f6f6f6" : "#8eacbc"
        background: Rectangle {
            x: slider.leftPadding
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: slider.availableWidth
            height: implicitHeight
            radius: 2
            color: "#FFFFFF"

            Rectangle {
                width: slider.visualPosition * parent.width
                height: parent.height
                color: "#607d8b"
                radius: 2
            }
        }

        handle: Rectangle {
            id: test
            x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            implicitWidth: 16
            implicitHeight: 16
            radius: 3
            color: "#8eacbc"
            border.color: "#8eacbc"
        }
    }

    ProgressBar {
        id: progressBar
        x: 323
        y: 156
        from:slider.from
        to:slider.to
        value:slider.value
        contentItem: Item {
            Rectangle {
                id: bar
                width: progressBar.visualPosition * parent.width
                height: parent.height
                radius: 0
                color:"#FF6347"
            }
        }
    }
}













































































































/*##^## Designer {
    D{i:2;anchors_y:339}D{i:1;anchors_height:436;anchors_x:0;anchors_y:44}D{i:13;anchors_height:48;anchors_y:170}
D{i:15;anchors_height:48;anchors_y:330}D{i:17;anchors_height:48;anchors_y:250}
}
 ##^##*/
