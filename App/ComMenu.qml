import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "Constants.js" as Const

Page {
    background: Rectangle {
        color: Const.Color_DarkGrey
    }

    ScrollView {
        leftPadding: 20
        clip: true
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.interactive: true
        ColumnLayout {
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
            CheckBox {
                text: qsTr("Check Box")
            }

            CheckBox {
                text: qsTr("Check Box")
            }
        }
    }
}
