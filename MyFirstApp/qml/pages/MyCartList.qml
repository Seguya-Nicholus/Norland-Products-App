import QtQuick 2.0
//import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.12
import QtQuick.Window 2.0
import Felgo 3.0

Page {

    title: "My Cart List"
    property int count: 0
    property  int  qtyCount: 0
    property  int cartTotal : 0

    //    function sum() {
    //         let cartTotal = 0;
    //          for (var i = 0; i < nums.length; i++) {
    //           cartTotal += parseInt(nums[i]);
    //         }
    //         return cartTotal;
    //       }

    Component.onCompleted: {
        database.removeCartList();
        btnCart.enabled = false
    }

    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button

        IconButtonBarItem {
            id:shoppingCart
            icon: IconType.shoppingcart
            onClicked: {

                //                var result = 0
                //                for (var i=0; i < cartListModel.count; i++){
                //                    database.insertIntoMyCartTable(cartListModel.get(i).itemId,cartListModel.get(i).imagePath, cartListModel.get(i).itemName, cartListModel.get(i).itemText,1, cartListModel.get(i).itemCost,cartTotal,database.getUserId(loginUsername.text, loginPassword.text));
                //                    console.log(cartListModel.get(i).itemId,cartListModel.get(i).imagePath, cartListModel.get(i).itemName, cartListModel.get(i).itemText,1, cartListModel.get(i).itemCost,cartTotal,database.getUserId(loginUsername.text, loginPassword.text));
                //                    result += JSON.stringify(cartListModel.get(i));
                //                }

//                                navigationStack.push(events)

                //                console.log("### ==== Result ==== ###")
                //                console.log(result);

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
                contentHeight: 450
                cellWidth: dp(170)
                cellHeight:dp(320)

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

                            Rectangle {
                                id:rectQtyControl
                                width:parent.width * 0.8
                                height: btnCart.height
                                anchors.top: productCost.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "transparent"

                                RoundButton {
                                    id: minusRbutton
                                    text: IconType.minus
                                    flat: false
                                    visible: true
                                    anchors.left: parent.left
                                    anchors.verticalCenter:  parent.verticalCenter
                                    height: dp(30)
                                    width: dp(30)

                                    background: Rectangle {
                                        radius: plusRbutton.radius
                                        color: "#6BEAFC"
                                    }

                                    onClicked: {
                                        countText.text -= 1
                                        count--
                                        cartTotal -= (Cost * countText.text)
                                        console.log(count);
                                        console.log(cartTotal)
                                        //                                        if(qtyCount >= 1){
                                        //                                            minusRbutton.enabled = true
                                        //                                        }
                                        //                                        else{
                                        //                                            minusRbutton.enabled = false

                                        //                                        }
                                    }
                                }


                                AppText{
                                    id: countText
                                    text: qtyCount
                                    font.bold: true
                                    visible: true
                                    font.pixelSize: sp(20)
                                    anchors.centerIn: parent
                                    anchors.verticalCenter:  parent.verticalCenter
                                    color: "#034083"
                                }


                                RoundButton {
                                    id:plusRbutton
                                    text: IconType.plus
                                    anchors.right: parent.right
                                    //                                    font.bold: true
                                    font.pixelSize: sp(20)
                                    visible: true
                                    //                                    anchors.top: parent.top
                                    anchors.verticalCenter:  parent.verticalCenter
                                    height: dp(30)
                                    width: dp(30)

                                    background: Rectangle {
                                        radius: plusRbutton.radius
                                        color: "#6BEAFC"
                                    }

                                    onClicked: {

                                        var qtyCount = parseInt(countText.text, 10);

                                        qtyCount ++
                                        countText.text = qtyCount
                                        count++
                                        //                                        var itemProduct = countText.text * Cost
                                        //                                        cartTotal += (Cost * countText.text)
                                        console.log(count)
                                        console.log(cartTotal)
                                        btnCart.visible = true

                                    }
                                }
                            }

                            AppButton {
                                id: btnCart
                                text:IconType.shoppingcart + "  Add to Cart"
                                anchors.top: rectQtyControl.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                minimumWidth: parent.width * 0.85
                                visible: false
                                //                                minimumHeight: dp(42)
                                textSize:sp(15)
                                radius: dp(25)
                                fontCapitalization : Font.Capitalize
                                width: parent.width * 0.85
                                backgroundColor: "#005BAC"
                                onClicked: {
                                    btnCart.text = IconType.checksquare + "  Added"
                                    btnCart.enabled = false
                                    minusRbutton.enabled = false
                                    plusRbutton.enabled = false
                                    //                                    var qtyText = parseInt(countText.text, 10)
                                    //                                    countText.text = qtyText
                                    //                                    cartTotal += Cost
                                    cartTotal += (Cost * countText.text)

                                    var itemProductId = productId.text
                                    var img = imgProduct.source
                                    var itemProductName = productName.text
                                    var itemProductText = productText.text
                                    var itemProductQty = countText.text
                                    var itemProductCost = productCostDb.text

                                    console.log(JSON.stringify({itemId:itemProductId,imagePath: img, itemName: itemProductName, itemText: itemProductText,itemQty:itemProductQty, itemCost: itemProductCost}))
                                    cartListModel.append({itemId:itemProductId,imagePath: img, itemName: itemProductName, itemText: itemProductText,itemQty:itemProductQty, itemCost: itemProductCost})

                                }
                            }
                        }

                        //                            MouseArea {
                        //                                anchors.fill: parent
                        //                                onClicked: navigationStack.push(Qt.resolvedUrl(page))
                        //                            }
                    }

                }

                Rectangle {
                    visible: false
                    //                            width: 200; height: 200

                    AppText{
                        id: orderId
                        text: database.getLastOrderId() + 1
                    }

                    ListModel {
                        id: cartListModel
                        ListElement {
                            itemId : ""
                            imagePath: ""
                            itemName: ""
                            itemText: ""
                            itemQty: ""
                            itemCost: ""
                        }
                    }

                    Component {
                        id: cartListDelegate
                        Row {

                            AppText {
                                id:productItemId
                                anchors.top: parent.top
                                anchors.topMargin: dp(10)
                                anchors.left: parent.left
                                anchors.leftMargin: dp(5)
                                text: itemId
                                font.bold: true
                                font.pixelSize: sp(15)
                            }

                            spacing: 10
                            // add the image
                            Image {
                                id: cartItemImage
                                source: ImagePath
                                anchors.fill: parent
                                anchors.centerIn: parent
                                anchors.topMargin: dp(5)
                                anchors.bottomMargin: dp(5)
                                anchors.leftMargin: dp(5)
                                anchors.rightMargin: dp(5)
                            }

                            AppText {
                                id:productItemName
                                anchors.top: parent.top
                                anchors.topMargin: dp(10)
                                anchors.left: parent.left
                                anchors.leftMargin: dp(5)
                                text: itemName
                                font.bold: true
                                font.pixelSize: sp(15)
                            }

                            AppText{
                                id:productItemText
                                //                            anchors.top: productName.bottom
                                //                            anchors.left: parent.left
                                anchors.leftMargin: dp(5)
                                text: itemText
                                font.pixelSize: sp(13)
                                color: "#A1A1A1"
                            }

                            AppText{
                                id: productItemQty
                                anchors.left: parent.left
                                anchors.leftMargin: dp(5)
                                anchors.top: productText.bottom
                                anchors.topMargin: dp(5)
                                font.bold: true
                                color: "#034083"
                                text: itemQty
                                font.pixelSize: sp(15)
                            }

                            AppText{
                                id: productItemCost
                                anchors.left: parent.left
                                anchors.leftMargin: dp(5)
                                anchors.top: productText.bottom
                                anchors.topMargin: dp(5)
                                font.bold: true
                                color: "#034083"
                                text: itemCost
                                font.pixelSize: sp(15)
                            }
                        }
                    }

                    ListView {
                        id: cartListview
                        visible: false
                        anchors.fill: parent
                        model: cartListModel
                        delegate: cartListDelegate
                    }
                }
            }
        }
        Rectangle {
            id: footer
            anchors.bottom: parent.bottom
            width:parent.width
            height: dp(50)
            color: "light blue"


            AppButton {
                id: checkoutButton
                text: "Check Out " + IconType.arrowright
                minimumWidth: parent.width * 0.9
                minimumHeight: dp(42)
                anchors.right: parent.right
                textSize:sp(15)
                radius: dp(25)
                backgroundColor: "#005BAC"
                textColor : "#FFFFFF"
                fontCapitalization : Font.Capitalize
                borderColor : "#005BAC"
                width: parent.width * 0.9
                borderWidth: 1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {

                    var result = 0
                    for (var i=0; i < cartListModel.count; i++){
                        database.insertIntoMyCartTable(cartListModel.get(i).itemId,cartListModel.get(i).imagePath, cartListModel.get(i).itemName, cartListModel.get(i).itemText,cartListModel.get(i).itemQty, cartListModel.get(i).itemCost,cartTotal,database.getUserId(loginUsername.text, loginPassword.text));
                        database.insertIntoOrdersTable(orderId.text,cartListModel.get(i).itemId,cartListModel.get(i).imagePath, cartListModel.get(i).itemName, cartListModel.get(i).itemText,cartListModel.get(i).itemQty, cartListModel.get(i).itemCost,cartTotal,database.getUserId(loginUsername.text, loginPassword.text))
                        console.log(cartListModel.get(i).itemId,cartListModel.get(i).imagePath, cartListModel.get(i).itemName, cartListModel.get(i).itemText,cartListModel.get(i).itemQty, cartListModel.get(i).itemCost,cartTotal,database.getUserId(loginUsername.text, loginPassword.text));
                        result += JSON.stringify(cartListModel.get(i));

                    }

                    navigationStack.push(cartCheckout)

                    console.log("### ==== Result ==== ###")
                    console.log(result);
                    console.log (cartTotal)
                    console.log(orderId.text)
                    cartListModel.clear()
                }

            }
        }
        Component {
            id: cartCheckout
            CheckoutOrderPage{}
        }

        Component {
            id: events
            EventsPage{}
        }
    }


}
