import QtQuick 2.0
import Felgo 3.0

Page {

    id:itemInfo

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

        anchors.centerIn: parent.Center
        width: itemInfo.width
        height: parent.height - bottomRect.height - middleRect.height
        color: "#F0F0F1"

        Rectangle {
            id: rectImage
            anchors.fill: parent
            anchors.bottomMargin: dp(50)
            color: "#F0F0F1"

            AppImage {
                id:productImage
                anchors.fill: parent
                source: "../../assets/product1Details_auto_x1.png"
            }
        }

        Rectangle {
            color: "#F0F0F1"
            anchors.top: rectImage.bottom
            width: parent.width
            height: topRect.height - rectImage.height

            AppButton {
                text: IconType.minus
                radius: dp(18)
                backgroundColor: "#6BEAFC"
                textColor : "#034083"
                flat: false
                anchors.top: rectImage.bottom
                anchors.left: parent.left
                anchors.leftMargin: parent .width * 0.3
                width: parent.width * 0.1
                minimumWidth: parent.width * 0.1

                onClicked: {
                    count--
                }
            }


            AppText{
                id: countText
                text: count
                font.bold: true
                font.pixelSize: sp(20)
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#034083"
            }


            AppButton {
                text: IconType.plus
                radius: dp(18)
                backgroundColor: "#6BEAFC"
                textColor : "#034083"
                flat: false
                anchors.top: rectImage.bottom
                anchors.right: parent.right
                anchors.rightMargin: parent .width * 0.3
                width: parent.width * 0.1
                minimumWidth: parent.width * 0.1

                onClicked: {
                    count++
                }
            }
        }

    } // End Upper Section



    Rectangle{
        id:middleRect
        anchors.bottom: bottomRect.top
        width: itemInfo.width
        height: parent.height/3
        color: "#F0F0F1"

        Rectangle {
            id:rectTitle
            anchors.top: parent.top
            width: parent.width
            height: parent.height/4
            color: "#F0F0F1"


            AppText{
                text: "PAYMENT OPTIONS"
                font.bold: true
                anchors.bottom: parent.bottom
                anchors.bottomMargin: dp(5)
                anchors.left: parent.left
                anchors.leftMargin: dp(20)
                color: "#034083"
            }

        }

        Rectangle {
            id:rectCash
            anchors.top: rectTitle.bottom
            width: parent.width
            height: parent.height/4
            color: "#F0F0F1"
            border.color: "#9EB9D9"
            border.width: dp(1)

            AppText {
                text: IconType.money + "    Cash on Delivery"
                color : "#000000"
                font.bold:  true
                anchors.fill:parent
                anchors.left: parent
                anchors.leftMargin: dp(20)
                width: parent.width * 0.7
                height: parent.height
            }


            AppButton {
                text: IconType.arrowright
                radius: dp(18)
                backgroundColor: "transparent"
                borderColor: "transparent"
                textColor : "#000000"
                flat: false
                anchors.right: parent.right
                anchors.rightMargin: dp(10)
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width * 0.2
                minimumWidth: parent.width * 0.2
                height: parent.height

                onClicked: {
                 navigationStack.push(navigationPage)

                }
            }

        }

        Rectangle {
            id:rectMobileMoney
            anchors.top: rectCash.bottom
            width: parent.width
            height: parent.height/4
            color: "#F0F0F1"
            border.color: "#9EB9D9"
            border.width: dp(1)


            AppText {
                text: IconType.mobilephone + "    Mobile Money"
                color : "#000000"
                font.bold:  true
                anchors.fill:parent
                anchors.left: parent
                anchors.leftMargin: dp(20)
                width: parent.width * 0.7
                height: parent.height
            }

            AppButton {
                text: IconType.arrowright
                radius: dp(18)
                backgroundColor: "transparent"
                borderColor: "transparent"
                textColor : "#000000"
                flat: false
                anchors.right: parent.right
                anchors.rightMargin: dp(10)
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width * 0.2
                minimumWidth: parent.width * 0.2
                height: parent.height
            }

        }
        Rectangle {
            id: rectVisaCard
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height/4
            color: "#F0F0F1"
            border.color: "#9EB9D9"
            border.width: dp(1)

            AppText {
                text: IconType.ccvisa + "    Visa Card"
                color : "#000000"
                font.bold:  true
                anchors.fill:parent
                anchors.left: parent
                anchors.leftMargin: dp(20)
                width: parent.width * 0.7
                height: parent.height
            }

            AppButton {
                text: IconType.arrowright
                radius: dp(18)
                backgroundColor: "transparent"
                borderColor: "transparent"
                textColor : "#000000"
                flat: false
                anchors.right: parent.right
                anchors.rightMargin: dp(10)
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width * 0.2
                minimumWidth: parent.width * 0.2
                height: parent.height
            }
        }
    }

    Rectangle{
        id:bottomRect
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height * 0.2
        color: "#F0F0F1"
        border.color: "#9EB9D9"
        border.width: dp(1)


        AppText{
            id: textRelatedItems
            text: "RELATED ITEMS"
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: dp(5)
            anchors.left: parent.left
            anchors.leftMargin: dp(20)
            color: "#034083"
            font.pixelSize: sp(10)
        }

        Rectangle {

            anchors.bottom: parent.bottom
            width: parent.width * 0.9
            height: parent.height * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#F0F0F1"

            Rectangle {
                width: parent.width /3
                height: parent.height
                color: "#F0F0F1"

                AppImage {
                    id: img1footer
                    anchors.top: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: '../../assets/product2_auto_x1-removebg-preview.png'
                    width: parent.width * 0.6
                    height: parent.height * 0.6
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                }


                AppText {
                    text: "Keto Actives"
                    font.bold: true
                    font.pixelSize: sp(12)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: img1footer.bottom
                }
            }

            Rectangle {
                anchors.right:  parent.right
                width: parent.width /3
                height: parent.height
                color: "#F0F0F1"

                AppImage {
                    id: img1footer2
                    anchors.top: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: '../../assets/product5_auto_x1-removebg-preview.png'
                    width: parent.width * 0.6
                    height: parent.height * 0.6
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                }

                AppText {
                    id:text2
                    text: "FDA Micro-"
                    font.bold: true
                    font.pixelSize: sp(12)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: img1footer2.bottom
                }

                AppText {
                    text: "Molecules Peptides"
                    font.bold: true
                    font.pixelSize: sp(12)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: text2.bottom


                }

            }

            Rectangle {
                anchors.centerIn: parent
                width: parent.width /3
                height: parent.height
                color: "#F0F0F1"

                AppImage {
                    id: img1footer3
                    anchors.top: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: '../../assets/product4_auto_x1-removebg-preview.png'
                    width: parent.width * 0.6
                    height: parent.height * 0.6
                    fillMode: Image.PreserveAspectCrop
                    layer.enabled: true
                }


                AppText {
                    id: text1
                    text: "Calcium Iron"
                    font.bold: true
                    font.pixelSize: sp(12)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: img1footer3.bottom

                }
                AppText {
                    text: "& Zinc"
                    font.bold: true
                    font.pixelSize: sp(12)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: text1.bottom
                }
            }
        }
    }


    Component {
        id: navigationPage
        NavigationPage {}
    }
}
