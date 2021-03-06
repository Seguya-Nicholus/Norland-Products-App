import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

//import QtQuick 2.12
//import QtQuick.Controls 2.12

Page {

    id:welcomePage

    //        navigationBarHidden: true

    // Onload Function
    Component.onCompleted: {
        ProductModel.updateModel();      
        EventModel.updateModel();
    }


    //    function numberWithCommas(price) {
    //        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

    //    }


    // add a navigation bar row to the right slot
    leftBarItem: NavigationBarRow {
        // ... and an icon button

        AppImage {
            id: img
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: dp(10)
            anchors.topMargin: parent.height * 0.1
            anchors.bottomMargin: dp(30)
            source: '../../assets/avatar.png'
            width: 80
            height: 80
            fillMode: Image.PreserveAspectCrop
            layer.enabled: true
        }
    }

    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button

        IconButtonBarItem{
            id:searchIcon
            anchors.top: parent.top
            anchors.right:  menuIcon.right
            anchors.rightMargin: dp(50)
            icon: IconType.search
            //                iconSize: dp(30)
            onClicked: {}
        }

        IconButtonBarItem{
            id: menuIcon
            anchors.top: parent.top
            anchors.right:  parent.right
            //                iconSize: dp(30)
            icon: IconType.navicon
        }

    }


    // tabbar
    AppTabBar {
        id: appTabBar

        AppTabButton {

            Rectangle{
                anchors.fill: parent
                color: parent.pressed ? Theme.tabBar.backgroundColor : Theme.tabBar.backgroundColor
                AppText {
                    id: welcomeText1
                    text: "Welcome back,"
                    font.family: "Emigre"
                    font.bold : true
                    color: "white"
                    font.pixelSize: sp(15)
                    anchors.top: parent.top
                    //                    anchors.topMargin: dp(5)
                    anchors.left: parent.left
                    anchors.leftMargin: dp(5)
                }
                AppText{
                    id: welcomeText2
                    text: database.getUsername(loginUsername.text, loginPassword.text)
                    font.family: "Emigre"
                    font.bold : true
                    color: "white"
                    font.pixelSize: sp(15)
                    anchors.top: welcomeText1.bottom
                    anchors.topMargin: dp(3)
                    anchors.left: parent.left
                    anchors.leftMargin: dp(5)
                }
            }
        }
    }


    Rectangle {
        color: "#E9FAFF"
        anchors.fill: parent
        anchors.top: appTabBar.bottom
        anchors.topMargin: appTabBar.height - 5

        AppFlickable {
            anchors.fill: parent
            contentHeight: content.height

            Column {
                anchors.fill: parent
                anchors.margins: dp(10)
                spacing: dp(5)

                Rectangle {
                    id: rectbuttons
                    width: parent.width
                    height: parent.height * 0.08
                    color: "transparent"

                    RowLayout {
                        id: firstRow
                        anchors.fill: parent
                        spacing: 2
                        Rectangle {
                            color: '#E9FAFF'
                            Layout.fillWidth: true
                            Layout.fillHeight:  true
                            Layout.minimumWidth: parent.width * 0.329
                            Layout.preferredWidth: parent.width * 0.329
                            Layout.maximumWidth: parent.width * 0.329
                            Layout.minimumHeight: parent.height

                            AppButton {
                                text: "Training"
                                radius: dp(18)
                                //                            "#6BEAFC"
                                backgroundColor: "#E9FAFF"
                                textColor : "#0098C8"
                                textColorPressed: "#034083"
                                backgroundColorPressed : "#6BEAFC"
                                borderColor : "#9EB9D9"
                                borderWidth: 1
                                //                            wordWrap : true
                                flat: false
                                fontCapitalization: Font.Capitalize
                                minimumWidth : parent.width * 0.95
                                anchors.centerIn: parent
                            }
                        }
                        Rectangle {
                            color: '#E9FAFF'
                            Layout.fillWidth: true
                            Layout.fillHeight:  true
                            Layout.minimumWidth: parent.width * 0.329
                            Layout.preferredWidth: parent.width * 0.329
                            Layout.maximumWidth: parent.width * 0.329
                            Layout.minimumHeight: parent.height

                            AppButton {
                                text: "Treatment"
                                radius: dp(18)
                                backgroundColor: "#E9FAFF"
                                textColor : "#0098C8"
                                textColorPressed: "#034083"
                                backgroundColorPressed : "#6BEAFC"
                                borderColor : "#9EB9D9"
                                borderWidth: 1
                                flat: false
                                //                            wordWrap: true
                                fontCapitalization: Font.Capitalize
                                minimumWidth : parent.width * 0.95
                                anchors.centerIn: parent

                                onClicked: {
                                    navigationStack.push(pageTreatment)
                                    console.log("Treatment Button Clicked");
                                }
                            }

                        }

                        Rectangle {
                            color: '#E9FAFF'
                            Layout.fillWidth: true
                            Layout.fillHeight:  true
                            Layout.minimumWidth: parent.width * 0.329
                            Layout.preferredWidth: parent.width * 0.329
                            Layout.maximumWidth: parent.width * 0.329
                            Layout.minimumHeight: parent.height


                            AppButton {
                                text: "Testimonials"
                                radius: dp(18)
                                backgroundColor: "#E9FAFF"
                                textColor : "#0098C8"
                                textColorPressed: "#034083"
                                backgroundColorPressed : "#6BEAFC"
                                fontCapitalization : Font.Capitalize
                                borderColor : "#9EB9D9"
                                borderWidth: 1
                                minimumWidth : parent.width * 0.95
                                anchors.centerIn: parent

                                onClicked: {
                                    navigationStack.push(pageTestimonials)
                                }
                            }
                        }
                    }

                    //                                }


                }

                Rectangle {
                    id: rectProducts
                    width: parent.width
                    height: parent.height * 0.469
                    color: "transparent"

                    Rectangle {
                        id : rectFeaturedLabel
                        anchors.top : parent.top
                        width: parent.width
                        height: parent.height * 0.1
                        color: "transparent"
                        //                                                            color: "red"

                        RowLayout {
                            id: secondRow
                            anchors.fill: parent
                            spacing: 2
                            Rectangle {
                                color: 'transparent'
                                Layout.fillWidth: true
                                Layout.fillHeight:  true
                                Layout.minimumWidth: parent.width * 0.66
                                Layout.preferredWidth: parent.width * 0.66
                                Layout.maximumWidth: parent.width * 0.66
                                Layout.minimumHeight: parent.height


                                AppText{
                                    text: "FEATURED PRODUCTS"
                                    font.bold: true
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: sp(13)
                                    anchors.left: parent.left
                                    //                                                anchors.leftMargin: dp(20)
                                    color: "#555555"
                                }
                            }

                            Rectangle {
                                color: 'transparent'
                                Layout.fillWidth: true
                                Layout.fillHeight:  true
                                Layout.minimumWidth: parent.width * 0.329
                                Layout.preferredWidth: parent.width * 0.329
                                Layout.maximumWidth: parent.width * 0.329
                                Layout.minimumHeight: parent.height

                                AppButton{
                                    text: "View All  " + IconType.arrowright
                                    backgroundColor: "#E9FAFF"
                                    textColor : "#0098C8"
                                    fontCapitalization : Font.Capitalize
                                    borderColor : "#E9FAFF"
                                    borderWidth: 1
                                    height: parent.height * 0.6
                                    flat: true
                                    anchors.right: parent.right
                                    //                                                anchors.rightMargin: dp(10)
                                    anchors.bottom: parent.bottom
                                    anchors.fill:parent

                                    onClicked: {
                                        navigationStack.push(pageProducts)
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        anchors.top: rectFeaturedLabel.bottom
                        width: parent.width
                        height: parent.height * 0.88
                        color: "transparent"

                        //                        Rectangle{
                        //                            anchors.fill: parent
                        //                            anchors.bottomMargin:  dp(3)
                        //                            anchors.topMargin: dp(3)
                        //                            color: "#E9FAFF"
                        //                        }


                        AppListView {
                            id:productsListview
                            anchors.fill: parent
                            orientation: AppListView.Horizontal
                            spacing: dp(10)
                            //                                                        leftMargin: dp(10)
                            //                                                        rightMargin: dp(10)
                            topMargin: dp(10)

                            model: ProductModel
                            delegate: Rectangle {
                                id: rectProduct
                                border.color: "#9EB9D9"
                                border.width: dp(1)
                                radius: dp(15)
                                width: dp(130)
                                height: parent.height


                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        console.log(database.returnProductRecord(ProductModel.getProductId(productsListview.currentIndex)));
                                        console.log(imgProduct.source);
                                        navigationStack.push(pageInfo, {model:{ImagePath: imgProduct.source,ProductName:productName.text,ProductText:productText.text,Cost:productCost.text}})
                                    }
                                }

                                //                        SimpleRow{
                                //                            item: ProductModel.get(index)
                                //                            anchors.fill: parent
                                //                            onSelected: {
                                //                                console.log(database.returnProductRecord(ProductModel.getProductId(productsListview.currentIndex)));
                                //                                console.log(imgProduct.source);
                                //                                navigationStack.push(pageInfo, {model:{ImagePath: imgProduct.source,ProductName:productName.text,ProductText:productText.text,Cost:productCost.text}})
                                //                            }

                                //                            DropShadow {
                                //                                anchors.fill: rectProduct
                                //                                horizontalOffset: 3
                                //                                verticalOffset: 3
                                //                                radius: 8.0
                                //                                samples: 17
                                //                                color: "#6BEAFC"
                                //                                source: rectProduct
                                //                            }

                                Rectangle{
                                    id:upperImage
                                    radius: dp(10)
                                    width : parent.width
                                    height: parent.height * 0.65
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
                                        id:productText
                                        anchors.top: productName.bottom
                                        text: ProductText
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        font.pixelSize: sp(13)
                                        color: "#A1A1A1"
                                    }

                                    AppText{
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

                                //                        }
                            }
                        }
                    }

                }

                Rectangle {
                    id: rectbottom
                    //                                    anchors.top : rectProducts.bottom
                    //                                    anchors.topMargin: app.dp(5)
                    width: parent.width
                    height: parent.height * 0.38
                    color: "transparent"
                    //                color: "cyan"

                    Rectangle {
                        id:rectTestimonialText
                        anchors.top: parent.top
                        width: parent.width
                        height: parent.height * 0.13
                        color: "transparent"

                        RowLayout {
                            id: forthRow
                            anchors.fill: parent
                            spacing: 2

                            Rectangle {
                                color: 'transparent'
                                Layout.fillWidth: true
                                Layout.fillHeight:  true
                                Layout.minimumWidth: parent.width * 0.66
                                Layout.preferredWidth: parent.width * 0.66
                                Layout.maximumWidth: parent.width * 0.66
                                Layout.minimumHeight: parent.height


                                AppText{
                                    text: "TESTIMONIALS"
                                    font.bold: true
                                    font.pixelSize: sp(13)
                                    anchors.verticalCenter:  parent.verticalCenter
                                    anchors.left: parent.left
                                    //                                                anchors.leftMargin: dp(20)
                                    color: "#555555"
                                }
                            }

                            Rectangle {
                                color: 'transparent'
                                Layout.fillWidth: true
                                Layout.fillHeight:  true
                                Layout.minimumWidth: parent.width * 0.329
                                Layout.preferredWidth: parent.width * 0.329
                                Layout.maximumWidth: parent.width * 0.329
                                Layout.minimumHeight: parent.height

                                AppButton{
                                    text: "View All  " + IconType.arrowright
                                    radius: 15
                                    backgroundColor: "#E9FAFF"
                                    textColor : "#0098C8"
                                    fontCapitalization : Font.Capitalize
                                    borderColor : "#E9FAFF"
                                    borderWidth: 1
                                    height: parent.height * 0.6
                                    flat: true
                                    anchors.right: parent.right
                                    anchors.bottom: parent.bottom
                                    anchors.fill:parent

                                    onClicked: {
                                        navigationStack.push(pageTestimonials)
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        anchors.top: rectTestimonialText.bottom
                        width : parent.width
                        height: parent.height * 0.755
                        color: "#E9FAFF"

                        RowLayout {
                            id: fifthRow
                            anchors.fill: parent
                            spacing: 2

                            Rectangle {
                                color: '#FFFFFF'
                                border.color: "#9EB9D9"
                                border.width: dp(1)
                                radius: dp(5)
                                anchors.centerIn: parent
                                Layout.fillWidth: true
                                Layout.fillHeight:  false
                                Layout.minimumHeight: parent.height
                                Layout.minimumWidth: parent.width
                                Layout.preferredWidth: parent.width
                                Layout.maximumWidth: parent.width


                                RowLayout {
                                    anchors.fill: parent
                                    Rectangle {
                                        color: "transparent"
                                        Layout.fillWidth: true
                                        Layout.fillHeight:  true
                                        Layout.minimumWidth: parent.width * 0.2
                                        Layout.preferredWidth: parent.width * 0.2
                                        Layout.maximumWidth: parent.width * 0.2
                                        Layout.minimumHeight: parent.height

                                        AppImage {
                                            id: img1
                                            anchors.centerIn: parent
                                            source: '../../assets/avatar.png'
                                            width: 80
                                            height: 80
                                            fillMode: Image.PreserveAspectCrop
                                            layer.enabled: true
                                        }

                                        AppImage{
                                            id:flag
                                            anchors.top: img1.bottom
                                            anchors.topMargin: dp(5)
                                            anchors.horizontalCenter: parent.horizontalCenter
                                            source: '../../assets/ugandanFlag.png'
                                            width: 50
                                            height: 30
                                            fillMode: Image.PreserveAspectCrop
                                            layer.enabled: true

                                        }
                                    }
                                    Rectangle {
                                        color: 'transparent'
                                        Layout.fillWidth: true
                                        Layout.fillHeight:  true
                                        Layout.minimumWidth: parent.width * 0.6
                                        Layout.preferredWidth: parent.width * 0.6
                                        Layout.maximumWidth: parent.width * 0.6
                                        Layout.minimumHeight: parent.height



                                        Rectangle {
                                            id:top

                                            color: "transparent"

                                            anchors.top: parent
                                            width: parent.width
                                            height: 80

                                            AppText{
                                                text: "Vusi Thumbekwayo"
                                                font.bold: true
                                                anchors.bottom: parent.bottom
                                                anchors.bottomMargin: dp(5)
                                            }

                                        }

                                        Rectangle {
                                            id:middle
                                            anchors.top: top.bottom
                                            width: parent.width
                                            height: 110
                                            color: "transparent"

                                            AppText {
                                                id:text
                                                text: "Lorem ipsum dolor sit amet, elit.Namo \nAliquam viverra rutrum sem,consectet \n et pharetra ipsum dapibus egete nec \n niovj. Nam nisl purus, ultricies in nulla."
                                                font.bold: false
                                                font.pixelSize: sp(12)
                                                color: "#777777"
                                            }
                                        }

                                        Rectangle {
                                            id: lower
                                            anchors.bottom: parent.bottom
                                            width: parent.width
                                            height: 50
                                            color: "transparent"

                                            AppText{
                                                text: "2 days ago  <b>|</b> " + IconType.comment + " Comments  <b>|</b> " + IconType.share +" Share"
                                                font.bold: true
                                                anchors.centerIn: parent.Center
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                font.pixelSize: sp(12)
                                                color: "#034083"
                                            }
                                        }
                                    }

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.fillHeight:  true
                                        Layout.minimumWidth: parent.width * 0.2
                                        Layout.preferredWidth: parent.width * 0.2
                                        Layout.maximumWidth: parent.width * 0.2
                                        Layout.minimumHeight: parent.height
                                        color: "transparent"
                                    }
                                }
                            }
                        }
                    }
                    //                            }
                }

            }

        }



        Component {
            id: pageInfo
            ProductInfoPage { }
        }

        Component {
            id: pageTestimonials
            TestimonialsList { }
        }

        Component {
            id: pageProducts
            ProductsList { }
        }

        Component {
            id: pageTreatment
            TreatmentPage { }
        }

        Component {
            id: pageAddEvent
            NewEventPage { }
        }

    }


    // Start of Tab Control

    TabControl {
        id:tabControl1
        showIcon : true
        currentIndex: 1
        tabPosition: Qt.BottomEdge

        anchors.fill: parent
        NavigationItem {
            id:navItem1
            title: "Events"
            icon: IconType.calendar
            //            anchors.top: appTabBar.bottom
            anchors.topMargin: appTabBar.height

            Component.onCompleted: {
                EventModel.updateModel()
            }

            Page{

                Rectangle {
                    color: "#E9FAFF"
                    anchors.fill: parent

//                    Column{

//                        anchors.margins: dp(10)


                    AppListView {
                        id: alarmListView
                        delegate: SimpleRow {

                            text: Subject
                            detailText: StartTime + " - " + EndTime
                        }
                        model: EventModel
                    }

//                    }
                    Rectangle {
                        id: footer
                        anchors.bottom: parent.bottom
                        width:parent.width
                        height: dp(50)
                        color: "light blue"


                        AppButton {
                            id: checkoutButton
                            text: IconType.plus + " Add Event"
                            minimumWidth: parent.width * 0.9
                            minimumHeight: dp(42)
                            anchors.right: parent.right
                            radius: dp(25)
                            backgroundColor: "#005BAC"
                            textColor : "#FFFFFF"
                            fontCapitalization : Font.Capitalize
                            borderColor : "#005BAC"
                            width: parent.width * 0.9
                            borderWidth: 1
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: {
                                navigationStack.push(pageAddEvent)

                            }
                        }
                    }
                }
            }

        }

        //                currentTab : NavigationItem
        NavigationItem {
            id:navItem2
            title: "Locate Us"
            icon: IconType.mapmarker
            //                    TodoListPage {}
        }

        NavigationItem {
            id:navItem3
            title: "Become a Member"
            icon: IconType.user
        }
    }
}
