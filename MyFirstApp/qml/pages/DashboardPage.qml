import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Page {

    id:welcomePage


    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait


    navigationBarHidden: true


    Rectangle {
        color: "#E9FAFF"
        anchors.fill: parent

        // ========== Upper Section to display image and description
        Rectangle {
            id:topRect
            anchors.top: parent
            width: parent.width
            height: parent.height/3
            color: "black"

            Rectangle {
                id:rectNavBar
                anchors.top: parent.top
                width: parent.width
                height: parent.height - rectbuttons.height - rectFeaturedLabel.height
                color: "red"

                // Customized Navigation Bar
                NavigationBar {

                    id:navBar
                    backgroundColor: "#005BAC"

                    height: dp(118)

                    Rectangle{
                        id:rectNav
                        anchors.fill: rectNavBar
                        anchors.top: parent.top
                        anchors.topMargin: dp(20)
                        width: rectNavBar.width
                        height: rectNavBar.height
                        //            radius: 8
                        color: "#005BAC"

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


                        AppText{
                            id: welcomeText1
                            text: "Welcome back,"
                            font.family: "Emigre"
                            font.bold : true
                            color: "white"
                            font.pixelSize: sp(15)
                            anchors.top: img.bottom
                            anchors.topMargin: dp(5)
                            anchors.left: parent.left
                            anchors.leftMargin: dp(5)
                        }


                        AppText{
                            id: welcomeText2
                            text: "Orban"
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
                id: rectbuttons
                anchors.bottom : rectFeaturedLabel.top
                width: parent.width
                height: parent.height * 0.25
                color: "#E9FAFF"


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
                            text: IconType.building + " Product Trainning"
                            radius: dp(18)
                            backgroundColor: "#6BEAFC"
                            textColor : "#034083"
                            wordWrap : true
                            flat: false
                            fontCapitalization: Font.Capitalize

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
                            text: IconType.refresh + " Treatment Formula"
                            radius: dp(18)
                            backgroundColor: "#E9FAFF"
                            textColor : "#034083"
                            borderColor : "#9EB9D9"
                            borderWidth: 1
                            flat: false
                            wordWrap: true
                            fontCapitalization: Font.Capitalize
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
                            text: IconType.navicon + "  Testimonials"
                            radius: dp(18)
                            backgroundColor: "#E9FAFF"
                            textColor : "#034083"
                            fontCapitalization : Font.Capitalize
                            borderColor : "#9EB9D9"
                            borderWidth: 1
                        }
                    }
                }


            }

            Rectangle {
                id : rectFeaturedLabel
                anchors.bottom : parent.bottom
                width: parent.width
                height: parent.height * 0.15
                color: "#E9FAFF"

                RowLayout {
                    id: secondRow
                    anchors.fill: parent
                    spacing: 2
                    Rectangle {
                        color: '#E9FAFF'
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
                            anchors.leftMargin: dp(20)
                            color: "#555555"
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

                        AppButton{
                            text: "View All  " + IconType.arrowright
                            backgroundColor: "#E9FAFF"
                            textColor : "#034083"
                            fontCapitalization : Font.Capitalize
                            borderColor : "#E9FAFF"
                            borderWidth: 1
                            height: parent.height * 0.6
                            flat: true
                            anchors.right: parent.right
                            anchors.rightMargin: dp(10)
                            anchors.bottom: parent.bottom
                            anchors.fill:parent

                            onClicked: {
                                navigationStack.push(pageProducts)
                            }
                        }
                    }
                }
            }





        } // End of Upper Section

        // ========== Middle Section to display text
        Rectangle{
            id:middleRect
            anchors.bottom:  bottomRect.top
            width: parent.width
            height: parent.height /3
            color: "#E9FAFF"

            Rectangle {
                anchors.top: parent.top
                width: parent.width
                height: parent.height * 0.88
                color: "orange"

                RowLayout {
                    id: thirdRow
                    anchors.fill: parent
                    spacing: 2
                    Rectangle {
                        color: '#6BEAFC'
                        Layout.fillWidth: true
                        Layout.fillHeight:  true
                        Layout.minimumWidth: parent.width * 0.329
                        Layout.preferredWidth: parent.width * 0.329
                        Layout.maximumWidth: parent.width * 0.329
                        Layout.minimumHeight: parent.height


                        AppButton{
                            id:button1
                            anchors.top: parent
                            width: parent.width
                            height: 200

                            AppImage {
                                id: img2
                                anchors.top: parent
                                anchors.fill: parent
                                anchors.horizontalCenter: parent.horizontalCenter
                                source: '../../assets/product1_auto_x1.png'
                                width: parent.width
                                height: button1.height
                                fillMode: Image.PreserveAspectCrop
                                layer.enabled: true
                            }


                            AppText{
                                id:firstText
                                anchors.top: img2.bottom
                                text: " Hypoglycemic"
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                                font.pixelSize: sp(16)
                            }

                            AppText{
                                id:secondText
                                anchors.top: firstText.bottom
                                text: " Herbal Capsules"
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                                font.pixelSize: sp(12)
                            }

                            AppText{
                                id:thirdText
                                anchors.top: secondText.bottom
                                text: " Anti-aging protien"
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: sp(10)
                                color: "#034083"
                            }

                            AppText{
                                id:forthText
                                anchors.top: thirdText.bottom
                                anchors.topMargin: dp(10)
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.bold: true
                                text: " UGX 230,000"
                                font.pixelSize: sp(16)
                                color: "#034083"
                            }

                            onClicked: {
                                navigationStack.push(pageInfo)
                            }
                        }


                    }
                    Rectangle {
                        color: '#FFFFFF'
                        Layout.fillWidth: true
                        Layout.fillHeight:  true
                        Layout.minimumWidth: parent.width * 0.329
                        Layout.preferredWidth: parent.width * 0.329
                        Layout.maximumWidth: parent.width * 0.329
                        Layout.minimumHeight: parent.height


                        AppButton{
                            id:button2
                            anchors.top: parent
                            width: parent.width
                            height: 200

                            AppImage {
                                id: img3
                                anchors.top: parent
                                anchors.horizontalCenter: parent.horizontalCenter
                                source: '../../assets/product2_auto_x1.png'
                                width: parent.width
                                height: button2.height
                                fillMode: Image.PreserveAspectCrop
                                layer.enabled: true
                            }

                            onClicked: {
                                navigationStack.push(pageInfo)
                            }
                        }


                        AppText{
                            id:text1
                            anchors.top: button2.bottom
                            text: " Keto Actives"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: sp(16)
                        }

                        AppText{
                            id:text2
                            anchors.top: text1.bottom
                            text: " Herbal Capsules"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: sp(12)
                        }

                        AppText{
                            id:text3
                            anchors.top: text2.bottom
                            text: " Weight loss regimen"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: sp(10)
                            color: "#034083"
                        }

                        AppText{
                            id:text4
                            anchors.top: text3.bottom
                            anchors.topMargin: dp(10)
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            text: " UGX 120,000"
                            font.pixelSize: sp(16)
                            color: "#034083"
                        }
                    }

                    Rectangle {
                        color: '#FFFFFF'
                        Layout.fillWidth: true
                        Layout.fillHeight:  true
                        Layout.minimumWidth: parent.width * 0.329
                        Layout.preferredWidth: parent.width * 0.329
                        Layout.maximumWidth: parent.width * 0.329
                        Layout.minimumHeight: parent.height


                        AppButton{
                            id:button3
                            anchors.top: parent
                            width: parent.width
                            height: 200

                            AppImage {
                                id: img4
                                anchors.top: parent
                                anchors.horizontalCenter: parent.horizontalCenter
                                source: '../../assets/product4_auto_x1.png'
                                width: parent.width
                                height: button3.height
                                fillMode: Image.PreserveAspectCrop
                                layer.enabled: true
                            }

                            onClicked: {
                                navigationStack.push(pageInfo)
                            }
                        }


                        AppText{
                            id:text5
                            anchors.top: button3.bottom
                            text: "Calcium Iron &"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: sp(15)
                        }

                        AppText{
                            id:text6
                            anchors.top: text5.bottom
                            text: "Zinc Capsules"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: sp(12)
                        }

                        AppText{
                            id:text7
                            anchors.top: text6.bottom
                            text: " Building strong bones"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: sp(10)
                            color: "#034083"
                        }

                        AppText{
                            id:text8
                            anchors.top: text7.bottom
                            anchors.topMargin: dp(10)
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            color: "#034083"
                            text: " UGX 85,000"
                            font.pixelSize: sp(16)
                        }

                    }
                }
            }

            Rectangle {
                id:rectTestimonialText
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height * 0.12
                color: "#E9FAFF"

                RowLayout {
                    id: forthRow
                    anchors.fill: parent
                    spacing: 2

                    Rectangle {
                        color: '#E9FAFF'
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
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.leftMargin: dp(20)
                            color: "#555555"

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

                        AppButton{
                            text: "View All  " + IconType.arrowright
                            radius: 15
                            backgroundColor: "#E9FAFF"
                            textColor : "#034083"
                            fontCapitalization : Font.Capitalize
                            borderColor : "#E9FAFF"
                            borderWidth: 1
                            height: parent.height * 0.6
                            flat: true
                            anchors.right: parent.right
                            anchors.rightMargin: dp(10)
                            anchors.bottom: parent.bottom
                            anchors.fill:parent

                            onClicked: {
                                navigationStack.push(pageTestimonials)
                            }
                        }
                    }
                }

            }

        }
        // End of Middle Section


        // ========== Bottom Section to display PageControl and button
        Rectangle {
            id:bottomRect
            anchors.bottom:  parent.bottom
            width: parent.width
            height: parent.height /3
            color: "#E9FAFF"


            Rectangle {
                anchors.top: parent
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
                        Layout.minimumHeight: parent.height * 0.9
                        Layout.minimumWidth: parent.width * 0.9
                        Layout.preferredWidth: parent.width * 0.9
                        Layout.maximumWidth: parent.width * 0.9


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


            TabControl {
                id:tabControl1
                showIcon : true
                currentIndex: 1
                tabPosition: Qt.BottomEdge

                anchors.fill: parent
                NavigationItem {
                    id:navItem1
                    title: "Consult"
                    icon: IconType.questioncircle
                }

                currentTab : NavigationItem
                NavigationItem {
                    id:navItem2
                    title: "Locate Us"
                    icon: IconType.mapmarker
                }

                NavigationItem {
                    id:navItem3
                    title: "Business"
                    icon: IconType.user
                }
            }


        }  // End of Bottom Section

    }


    Component {
        id: pageInfo
            ProductInfoPage { }
    }

    Component {
        id: pageTestimonials
            TestimonialsList{}
    }

    Component {
        id: pageProducts
            ProductsList{}
    }
}
