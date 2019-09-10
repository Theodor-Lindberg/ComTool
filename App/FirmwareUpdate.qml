import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "Constants.js" as Const

Page {
    leftPadding: 10

    background: Rectangle {
        color: Const.Color_DarkGrey
    }

    Rectangle {
        color: Const.Color_DarkGrey
        anchors.fill: parent

        ScrollView {
            anchors.fill: parent
            id: scrollView
            contentItem: content
        }

        ColumnLayout {
            id: content
            clip: true
            spacing: 30
            //width: Math.max(implicitWidth, scrollView.width)
            Text {
                text: "Download Firmware"
                font.pixelSize: 24
                color: "white"
            }
            Text {
                text: "*Note that all other USB and Modbus communication will be stopped when updating the firmware."
                font.pixelSize: 12
                font.italic: true
                wrapMode: Text.WordWrap
                Layout.preferredWidth: scrollView.width
                color: "white"
            }

            Button {
                text: "Download firmware"
            }

            ColumnLayout {
                Text {
                    id: updateStatus
                    text: "Update status: "
                    font.pixelSize: 15
                    wrapMode: Text.WordWrap
                    Layout.preferredWidth: scrollView.width
                    color: "white"
                }
                ProgressBar {
                    id: progressBar
                    x: 123
                    y: 156
                    width: 400
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
        }
    }
}
