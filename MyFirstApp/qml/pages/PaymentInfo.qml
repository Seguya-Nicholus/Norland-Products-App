import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.3 as QQC2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Page {

    id:itemInfo

    title: "Checkout Order"

    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait
    backgroundColor: "#E9FAFF"
    property int count: 0

    Component.onCompleted: {

    }

    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button

        IconButtonBarItem {
            id:shoppingCart
            icon: IconType.shoppingcart
            onClicked: {
                
            }
        }
        IconButtonBarItem {
            icon: IconType.heart
            onClicked: { console.log("item clicked") }
        }
    }

    // ========== Upper Section to display image and description
    Rectangle {
        id:topRect

//        anchors.centerIn: parent.Center
//        width: itemInfo.width
//        height: parent.height - bottomRect.height - middleRect.height
//        color: "#F0F0F1"

//        Rectangle {
//            id: rectImage
//            anchors.fill: parent
//            anchors.bottomMargin: dp(50)
//            color: "#F0F0F1"

//            AppImage {
//                id:productImage
//                anchors.fill: parent
//                source: "../../assets/product1Details_auto_x1.png"
//            }
//        }

//        Rectangle {
//            color: "#F0F0F1"
//            anchors.top: rectImage.bottom
//            width: parent.width
//            height: topRect.height - rectImage.height

//            AppButton {
//                text: IconType.minus
//                radius: dp(18)
//                backgroundColor: "#6BEAFC"
//                textColor : "#034083"
//                flat: false
//                anchors.top: rectImage.bottom
//                anchors.left: parent.left
//                anchors.leftMargin: parent .width * 0.3
//                width: parent.width * 0.1
//                minimumWidth: parent.width * 0.1

//                onClicked: {
//                    count--
//                }
//            }


//            AppText{
//                id: countText
//                text: count
//                font.bold: true
//                font.pixelSize: sp(20)
//                anchors.centerIn: parent
//                anchors.horizontalCenter: parent.horizontalCenter
//                color: "#034083"
//            }


//            AppButton {
//                text: IconType.plus
//                radius: dp(18)
//                backgroundColor: "#6BEAFC"
//                textColor : "#034083"
//                flat: false
//                anchors.top: rectImage.bottom
//                anchors.right: parent.right
//                anchors.rightMargin: parent .width * 0.3
//                width: parent.width * 0.1
//                minimumWidth: parent.width * 0.1

//                onClicked: {
//                    count++
//                }
//            }
//        }

    } // End Upper Section



//    Rectangle{
//        id:middleRect
//        anchors.bottom: bottomRect.top
//        width: itemInfo.width
//        height: parent.height/3
//        color: "#F0F0F1"

//        Rectangle {
//            id:rectTitle
//            anchors.top: parent.top
//            width: parent.width
//            height: parent.height/4
//            color: "#F0F0F1"


//            AppText{
//                text: "PAYMENT OPTIONS"
//                font.bold: true
//                anchors.bottom: parent.bottom
//                anchors.bottomMargin: dp(5)
//                anchors.left: parent.left
//                anchors.leftMargin: dp(20)
//                color: "#034083"
//            }

//        }

//        Rectangle {
//            id:rectCash
//            anchors.top: rectTitle.bottom
//            width: parent.width
//            height: parent.height/4
//            color: "#F0F0F1"
//            border.color: "#9EB9D9"
//            border.width: dp(1)

//            AppText {
//                text: IconType.money + "    Cash on Delivery"
//                color : "#000000"
//                font.bold:  true
//                anchors.fill:parent
//                anchors.left: parent
//                anchors.leftMargin: dp(20)
//                width: parent.width * 0.7
//                height: parent.height
//            }


//            AppButton {
//                text: IconType.arrowright
//                radius: dp(18)
//                backgroundColor: "transparent"
//                borderColor: "transparent"
//                textColor : "#000000"
//                flat: false
//                anchors.right: parent.right
//                anchors.rightMargin: dp(10)
//                anchors.verticalCenter: parent.verticalCenter
//                width: parent.width * 0.2
//                minimumWidth: parent.width * 0.2
//                height: parent.height

//                onClicked: {
//                 navigationStack.push(navigationPage)

//                }
//            }

//        }

//        Rectangle {
//            id:rectMobileMoney
//            anchors.top: rectCash.bottom
//            width: parent.width
//            height: parent.height/4
//            color: "#F0F0F1"
//            border.color: "#9EB9D9"
//            border.width: dp(1)


//            AppText {
//                text: IconType.mobilephone + "    Mobile Money"
//                color : "#000000"
//                font.bold:  true
//                anchors.fill:parent
//                anchors.left: parent
//                anchors.leftMargin: dp(20)
//                width: parent.width * 0.7
//                height: parent.height
//            }

//            AppButton {
//                text: IconType.arrowright
//                radius: dp(18)
//                backgroundColor: "transparent"
//                borderColor: "transparent"
//                textColor : "#000000"
//                flat: false
//                anchors.right: parent.right
//                anchors.rightMargin: dp(10)
//                anchors.verticalCenter: parent.verticalCenter
//                width: parent.width * 0.2
//                minimumWidth: parent.width * 0.2
//                height: parent.height
//            }

//        }
//        Rectangle {
//            id: rectVisaCard
//            anchors.bottom: parent.bottom
//            width: parent.width
//            height: parent.height/4
//            color: "#F0F0F1"
//            border.color: "#9EB9D9"
//            border.width: dp(1)

//            AppText {
//                text: IconType.ccvisa + "    Visa Card"
//                color : "#000000"
//                font.bold:  true
//                anchors.fill:parent
//                anchors.left: parent
//                anchors.leftMargin: dp(20)
//                width: parent.width * 0.7
//                height: parent.height
//            }

//            AppButton {
//                text: IconType.arrowright
//                radius: dp(18)
//                backgroundColor: "transparent"
//                borderColor: "transparent"
//                textColor : "#000000"
//                flat: false
//                anchors.right: parent.right
//                anchors.rightMargin: dp(10)
//                anchors.verticalCenter: parent.verticalCenter
//                width: parent.width * 0.2
//                minimumWidth: parent.width * 0.2
//                height: parent.height
//            }
//        }
//    }

//    Rectangle{
//        id:bottomRect
//        anchors.bottom: parent.bottom
//        width: parent.width
//        height: parent.height * 0.2
//        color: "#F0F0F1"
//        border.color: "#9EB9D9"
//        border.width: dp(1)


//        AppText{
//            id: textRelatedItems
//            text: "RELATED ITEMS"
//            font.bold: true
//            anchors.top: parent.top
//            anchors.topMargin: dp(5)
//            anchors.left: parent.left
//            anchors.leftMargin: dp(20)
//            color: "#034083"
//            font.pixelSize: sp(10)
//        }

//        Rectangle {

//            anchors.bottom: parent.bottom
//            width: parent.width * 0.9
//            height: parent.height * 0.8
//            anchors.horizontalCenter: parent.horizontalCenter
//            color: "#F0F0F1"

//            Rectangle {
//                width: parent.width /3
//                height: parent.height
//                color: "#F0F0F1"

//                AppImage {
//                    id: img1footer
//                    anchors.top: parent
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    source: '../../assets/product2_auto_x1-removebg-preview.png'
//                    width: parent.width * 0.6
//                    height: parent.height * 0.6
//                    fillMode: Image.PreserveAspectCrop
//                    layer.enabled: true
//                }


//                AppText {
//                    text: "Keto Actives"
//                    font.bold: true
//                    font.pixelSize: sp(12)
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.top: img1footer.bottom
//                }
//            }

//            Rectangle {
//                anchors.right:  parent.right
//                width: parent.width /3
//                height: parent.height
//                color: "#F0F0F1"

//                AppImage {
//                    id: img1footer2
//                    anchors.top: parent
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    source: '../../assets/product5_auto_x1-removebg-preview.png'
//                    width: parent.width * 0.6
//                    height: parent.height * 0.6
//                    fillMode: Image.PreserveAspectCrop
//                    layer.enabled: true
//                }

//                AppText {
//                    id:text2
//                    text: "FDA Micro-"
//                    font.bold: true
//                    font.pixelSize: sp(12)
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.top: img1footer2.bottom
//                }

//                AppText {
//                    text: "Molecules Peptides"
//                    font.bold: true
//                    font.pixelSize: sp(12)
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.top: text2.bottom


//                }

//            }

//            Rectangle {
//                anchors.centerIn: parent
//                width: parent.width /3
//                height: parent.height
//                color: "#F0F0F1"

//                AppImage {
//                    id: img1footer3
//                    anchors.top: parent
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    source: '../../assets/product4_auto_x1-removebg-preview.png'
//                    width: parent.width * 0.6
//                    height: parent.height * 0.6
//                    fillMode: Image.PreserveAspectCrop
//                    layer.enabled: true
//                }


//                AppText {
//                    id: text1
//                    text: "Calcium Iron"
//                    font.bold: true
//                    font.pixelSize: sp(12)
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.top: img1footer3.bottom

//                }
//                AppText {
//                    text: "& Zinc"
//                    font.bold: true
//                    font.pixelSize: sp(12)
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.top: text1.bottom
//                }
//            }
//        }
//    }


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
                    height: dp(40)

                    Text{
                        text: "Address Details"
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: dp(10)
                        font.pixelSize : sp(15)
                        font.bold: true
                        color: "#1C97C9"

                    }
                }

                Rectangle {
                    color: "white"
                    width: parent.width
                    height: dp(90)

                    Column {
                        anchors.fill: parent
                        spacing: dp(12)

                        Text{
                            text: "Customer Name"
                            font.bold: true

                        }

                        Text{
                            text: "Customer Address"
                            font.bold: true

                        }

                        Text{
                            text: "Area"
                            font.bold: true

                        }

                        Text{
                            text: "Phone Number"
                            font.bold: true

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
        id: navigationPage
        NavigationPage {}
    }
}
