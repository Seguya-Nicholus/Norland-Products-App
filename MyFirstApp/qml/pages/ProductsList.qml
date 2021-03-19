import QtQuick 2.0
//import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.12
import QtQuick.Window 2.0
import Felgo 3.0

Page {

    title: "Products"

    Rectangle {
        color: "#E9FAFF"
        anchors.fill: parent

        Rectangle {
            id: header
            anchors.top: parent.top
            width:parent.width
            height: parent.height - footer.height
            color: "transparent"

            GridView {
                id: gridView
                anchors.rightMargin: -50
                anchors.leftMargin: dp(15)
                anchors.topMargin: dp(15)
                anchors.bottomMargin: dp(15)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.fill: parent
                contentHeight: 350
                cellWidth: dp(170)
                cellHeight:dp(170)

                model: ProductModel

                delegate: Item {
                    // your item can not be clickable if it has zero width and height
                    width: gridView.cellWidth - 8
                    height: gridView.cellHeight - 8


                    Rectangle {
                        id: rectProduct
                        border.color: "#9EB9D9"
                        border.width: dp(1)
                        width: parent.width
                        height: parent.height

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log(database.returnProductRecord(ProductModel.getProductId(productsListview.currentIndex)));
                                console.log(imgProduct.source);
                                navigationStack.push(pageInfo, {model:{ImagePath: imgProduct.source,ProductName:productName.text,ProductText:productText.text,Cost:productCost.text}})
                            }
                        }

                        Rectangle{
                            id:upperImage
                            radius: dp(10)
                            width : parent.width
                            height: parent.height * 0.5
                            anchors.top: parent.top
                            color: "transparent"

                            AppImage{
                                id:imgProduct
                                anchors.fill: parent
                                anchors.topMargin: dp(9)
                                anchors.leftMargin: dp(9)
                                anchors.rightMargin: dp(9)
                                anchors.bottomMargin: dp(9)
                                source: ImagePath
                                width: parent.width * 0.8
                                height: parent.height * 0.8
                                fillMode: Image.PreserveAspectFit
                                layer.enabled: true
                            }
                        }


                        Rectangle{
                            id:lowerText
                            radius: dp(10)
                            width  : parent.width
                            height: parent.height - upperImage.height
                            anchors.bottom: parent.bottom
                            color: "transparent"

                            AppText {
                                id:productName
                                anchors.top: imgProduct.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: ProductName
                                font.bold: true
                                font.pixelSize: sp(15)
                            }

                            AppText{
                                id:productId
                                anchors.top: productName.bottom
                                visible: false
                                text: ProductID
                            }

                            AppText{
                                id:productText
                                anchors.top: productName.bottom
                                text: ProductText
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: sp(13)
                                color: "#A1A1A1"
                            }

                            AppText{
                                id: productCostDb
                                visible: false
                                anchors.left: parent.left
                                anchors.leftMargin: dp(5)
                                anchors.top: productText.bottom
                                anchors.topMargin: dp(5)
                                font.bold: true
                                color: "#034083"
                                text: Cost
                                font.pixelSize: sp(15)
                            }

                            AppText {
                                id: productCost
                                anchors.top: productText.bottom
                                anchors.topMargin: dp(5)
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                                color: "#034083"
                                text: "UGX " + Cost
                                font.pixelSize: sp(15)
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
            height: dp(50)
            color: "transparent"


        }
    }
}
