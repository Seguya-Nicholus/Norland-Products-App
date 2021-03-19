import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1
import QtGraphicalEffects 1.12
import QtQuick.Window 2.0
import Felgo 3.0

Page {

    title: "Cart"
    Component.onCompleted: {
        CartModel.updateModel()
    }

    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button

        IconButtonBarItem {
            id:shoppingCart
            icon: IconType.shoppingcart
            onClicked: {

            }

            // add badge
            Rectangle {
                x: parent.width * 0.8 - width
                y: parent.height * 0.25
                width: dp(14)
                height: width
                color: "red"
                radius: width * 0.5

                AppText {
                    text: count
                    font.pixelSize: sp(9)
                    font.bold: true
                    anchors.centerIn: parent
                    color: "white"
                }
            }
        }
        IconButtonBarItem {
            icon: IconType.heart
            onClicked: { console.log("item clicked") }
        }
    }


    Rectangle {
        color: "#E9FAFF"
        anchors.fill: parent

        Column {
            id: contentCol
            anchors.fill:parent
            anchors.left: parent.left
            anchors.top: parent
            anchors.right: parent.right
            anchors.margins: dp(15)
            spacing: dp(15)


            AppListView {
                id: listViewCart
                anchors.top: parent.top
                //            anchors.topMargin: dp(15)
                anchors.bottom: footer.top
                spacing: dp(5)

                // The model:
                model: CartModel

                delegate: Component {
                    id: myCartDelegate

                    Rectangle { color: "#FFFFFF"; radius: 5
                        width: parent.width ; height: 250
                        border.color: "#9EB9D9"
                        border.width: dp(1)


                        Rectangle {
                            id:rectDetailsUp
                            width: parent.width
                            height: parent.height * 0.72
                            anchors.top: parent.top
                            color: "transparent"


                            Rectangle {
                                id: rectImage
                                width: parent.height
                                height: parent.height
                                color: "transparent"

                                AppText {
                                    id: productID
                                    visible: false
                                    text: ProductID
                                }
                                // add the image
                                Image {
                                    id: cartImage
                                    source: database.getImage(ProductID)
                                    anchors.fill: parent
                                    anchors.centerIn: parent
                                    anchors.topMargin: dp(5)
                                    anchors.bottomMargin: dp(5)
                                    anchors.leftMargin: dp(5)
                                    anchors.rightMargin: dp(5)
                                }
                            }

                            Rectangle {
                                id:rectDetials
                                width: parent.width * 0.65
                                height: parent.height
                                color: "transparent"
                                anchors.left: rectImage.right



                                AppText{
                                    id:productId
                                    anchors.top: productName.bottom
                                    visible: false
                                    text: ProductID
                                }

                                AppText {
                                    id:productName
                                    anchors.top: parent.top
                                    anchors.topMargin: dp(10)
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(5)
                                    text: ProductName
                                    font.bold: true
                                    font.pixelSize: sp(15)
                                }

                                AppText{
                                    id:productText
                                    anchors.top: productName.bottom
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(5)
                                    text: ProductText
                                    font.pixelSize: sp(13)
                                    color: "#A1A1A1"
                                }

                                AppText{
                                    id: productCost1
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(5)
                                    anchors.top: productText.bottom
                                    anchors.topMargin: dp(5)
                                    font.bold: true
                                    color: "#034083"
                                    text:"UGX " + Cost
                                    font.pixelSize: sp(15)
                                }

                                AppText{
                                    id: productCost
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(5)
                                    visible: false
                                    anchors.top: productText.bottom
                                    anchors.topMargin: dp(5)
                                    font.bold: true
                                    color: "#034083"
                                    text: Cost
                                    font.pixelSize: sp(15)
                                }
                                AppButton {
                                    text: IconType.trash + "   Remove"
                                    textColor: "#FFFFFF"
                                    backgroundColor: "Red"
                                    textSize:sp(15)
                                    fontCapitalization : Font.Capitalize
                                    anchors.right: parent.right
                                    anchors.rightMargin: dp(25)
                                    anchors.verticalCenter:  parent.verticalCenter
                                    x: parent.width * 0.8 - width
                                    y: parent.height * 0.25
                                    width: dp(14)
                                    height: width
                                    radius: width * 0.5
                                    onClicked: {

                                    }
                                }
                            }
                        }

                        Rectangle {
                            id:rectSeparator
                            anchors.top: rectDetailsUp.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "#999999"
                            width: parent.width * 0.95
                            height: dp(2)
                        }

                        Rectangle {
                            id:rectDetailsDown
                            anchors.top: rectDetailsUp.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "transparent"
                            width: parent.width * 0.95
                            height: parent.height - rectSeparator.height - rectDetailsUp.height

                            Rectangle {
                                width:parent.width * 0.6
                                height: parent.height
                                anchors.left: parent.left

                                AppText{
                                    id: quantityText
                                    anchors.verticalCenter:  parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: dp(5)
                                    font.bold: true
                                    color: "#000000"
                                    text: "Quantity"
                                    font.pixelSize: sp(20)
                                }
                            }

                            Rectangle {
                                width:parent.width * 0.4
                                height: parent.height
                                anchors.right: parent.right

                                AppText{
                                    id: countText
                                    text: database.getQuantity(ProductID)
                                    font.bold: true
                                    font.pixelSize: sp(20)
                                    anchors.centerIn: parent
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    color: "#034083"
                                }

                            }
                        }
                    }
                }
            }

            Rectangle {
                id: footer
                anchors.bottom: parent.bottom
                width:parent.width
                height: parent.height * 0.15
                color: "#E9FAFF"

                Rectangle {
                    width:parent.width
                    height:parent.height/2
                    anchors.top: parent.top
                    color: "#E9FAFF"

                    AppText{
                        id: textTotal
                        text: "Total :"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: dp(15)
                        font.bold: true
                        color: "#000000"
                        font.pixelSize: sp(20)
                    }

                    AppText {
                        text: "UGX "+ cartTotal
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: dp(15)
                        font.bold: true
                        color: "#1C97C9"
                        font.pixelSize: sp(20)
                    }

                }

                Rectangle {
                    width:parent.width
                    height:parent.height/2
                    anchors.bottom: parent.bottom
                    color: "#E9FAFF"

                    AppButton {
                        text: "Complete Your Order"
                        minimumWidth: parent.width
                        radius: dp(18)
                        backgroundColor: "#005BAC"
                        textColor : "#FFFFFF"
                        textSize: dp(15)
                        fontCapitalization : Font.Capitalize
                        borderColor : "#005BAC"
                        width: parent.width
                        borderWidth: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            navigationStack.push(pageAddress)
                        }
                    }
                }
            }
        }
    }

    Component {
        id: pageAddress
        AddressPage {}
    }

}

