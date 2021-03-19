import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.3 as QQC2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Page {

    title: "Address"

    Rectangle {

        anchors.fill: parent
        color: "#E9FAFF"

        AppFlickable {
            anchors.fill: parent                // The AppFlickable fills the whole page
            anchors.margins: dp(10)
            contentWidth: parent.width   // You need to define the size of your content item
            contentHeight: contentColumn.height


            // Using a Column as content item is very convenient
            // The height of the column is set automatically depending on the child items
            Column {
                id: contentColumn
                width: parent.width // We only need to set the width of a column

                Rectangle {
                    color: "transparent"
                    width: parent.width
                    height: dp(50)

                    Text{
                        text: "Address Details"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: dp(10)
                        font.pixelSize : sp(25)
                        font.bold: true
                        color: "#1C97C9"

                    }
                }

                Rectangle {
                    color: "transparent"
                    width: parent.width
                    height: dp(80)

                    Column {
                        anchors.fill: parent
                        spacing: dp(12)

                        Text{
                            text: "Customer Name"
                            font.bold: true

                        }

                        // Username text field
                        AppTextField {
                            id: textCustomerName
                            text: database.getUsername(loginUsername.text, loginPassword.text)
                            width: parent.width
                            placeholderText: qsTr("E.g James Brown")
                        }
                    }

                }

                Rectangle {
                    color: "transparent"
                    width: parent.width
                    height: dp(80)

                    Column {
                        anchors.fill: parent
                        spacing: dp(12)

                        Text{
                            text: "Address"
                            font.bold: true
                        }

                        // Customer text field
                        AppTextField {
                            id: textCustomerAddress
                            width: parent.width
                            placeholderText: qsTr("Customer address")
                        }
                    }
                }

                Rectangle {
                    color: "transparent"
                    width: parent.width
                    height: dp(100)

                    Column {
                        anchors.fill: parent
                        spacing: dp(12)

                        Text{
                            text: "Region"
                            font.bold: true
                        }

                        // Region ComboBox
                        ComboBox {
                            width: parent.width * 0.9
                            model: ["Eastern Region", "Central Region", "Northern Region", "Western Region"]
                        }
                    }
                }


                Rectangle {
                    color: "transparent"
                    width: parent.width
                    height: dp(100)

                    Column {
                        anchors.fill: parent
                        spacing: dp(12)

                        Text{
                            text: "District/Town/Area"
                            font.bold: true
                        }

                        // Region ComboBox
                        ComboBox {
                            width: parent.width * 0.9
                            model: ["Bakuli", "Banda", "Bugolobi"]
                        }
                    }
                }

                Rectangle {
                    color: "transparent"
                    width: parent.width
                    height: dp(80)

                    Column {
                        anchors.fill: parent
                        spacing: dp(12)

                        Text{
                            text: "Mobile Phone Number"
                            font.bold: true
                        }

                        // Customer MMobile Number text field
                        AppTextField {
                            id: textCustomerPhone
                            width: parent.width
                            text: loginUsername.text
                            placeholderText: qsTr("Customer address")
                        }
                    }
                }

                Rectangle {
                    color: "transparent"    // This will be "red", "green", ...
                    width: parent.width
                    height: dp(100)

                    AppButton {
                        text: "Continue to Payment"
                        minimumWidth: parent.width * 0.9
                        minimumHeight : dp(40)
                        radius: dp(18)
                        height: dp(40)
                        backgroundColor: "#005BAC"
                        textSize: dp(15)
                        textColor : "#FFFFFF"
                        fontCapitalization : Font.Capitalize
                        borderColor : "#005BAC"
                        width: parent.width * 0.9
                        borderWidth: 1
                        anchors.left: parent.left
                        onClicked: {

                            navigationStack.push(pagePayment)

                        }
                    }
                }
            }
        }
    }
    
    
    Component {
        id: pagePayment
        PaymentInfo {}
    }
}
