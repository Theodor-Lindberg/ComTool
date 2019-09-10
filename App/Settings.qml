import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "Constants.js" as Const

Page {
    background: Rectangle {
        color: Const.Color_DarkGrey
    }

    property int fontSize: 24
    leftPadding: 10

    ScrollView {
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.interactive: true
        anchors.fill: parent
        ColumnLayout {
            spacing: 30
            clip: true

            ColumnLayout {
                Text {
                    text: "System Of Measurement"
                    font.pixelSize: fontSize
                    color: "#FFFFFF"
                }
                ButtonGroup {
                    id: unitGroup
                }

                RadioButton {
                    text: "Metric"
                    indicator.width: 14
                    indicator.height: 14
                    ButtonGroup.group: unitGroup
                    implicitHeight: 25
                    Layout.leftMargin: 10
                }
                RadioButton {
                    text: "American"
                    indicator.width: 14
                    indicator.height: 14
                    ButtonGroup.group: unitGroup
                    implicitHeight: 25
                    Layout.leftMargin: 10
                    Layout.topMargin: 10
                }
            }

            ColumnLayout {
                Text {
                    text: "Time Format"
                    font.pixelSize: fontSize
                    color: "#FFFFFF"
                }
                ComboBox {
                    model: ["mm/dd/yy", "yyyy/mm/dd"]
                    implicitWidth: 130
                }
            }

            ColumnLayout {
                Text {
                    text: "About this app"
                    font.pixelSize: fontSize
                    color: "#FFFFFF"
                }
                Text {
                    text: "Current version 3.2.5"
                    font.pixelSize: 14
                    color: "#FFFFFF"
                }
                Text {
                    text: "Latest version 3.3.2"
                    font.pixelSize: 14
                    color: "#FFFFFF"
                }
            }

            Text {
                text: "To report a problem please open an issue <a style=\"color:red;\" href='https://github.com/Theodor-Lindberg/ComTool/issues'>here</a>."
                onLinkActivated: Qt.openUrlExternally(link)
                font.pixelSize: 14
                color: "#FFFFFF"

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
                    cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }
        }
    }
}
