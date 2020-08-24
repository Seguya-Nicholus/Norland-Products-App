import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

// Main Page
Page {

    id:itemInfo

    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait
    backgroundColor: "#E9FAFF"


    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button
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
        height: parent.height/3
        color: "#F0F0F1"


        Rectangle {
            id: rectImage
            anchors.fill: parent
            color: "#F0F0F1"

            AppImage {
                anchors.fill: parent
                source: "../../assets/product1Details_auto_x1.png"
            }
        }

    } // End Upper Section


    Rectangle{
        id:middleRect
        anchors.top: topRect.bottom
        width: itemInfo.width
        height: parent.height/3
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            anchors.topMargin: dp(5)
            anchors.bottomMargin: dp(5)
            anchors.leftMargin: dp(20)
            anchors.rightMargin: dp(20)
            color: "transparent"

            Rectangle {
                id:rectbelowImage
                anchors.fill: parent
                anchors.bottomMargin: parent.height * 0.7
                color: "transparent"

                Rectangle {
                    id:rectfirst
                    color: "#E9FAFF"
                    anchors.top: parent
                    width: parent.width
                    height: dp(50)


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
                                text: " Info"
                                radius: dp(18)
                                backgroundColor: "#6BEAFC"
                                textColor : "#034083"
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
                                text: "Dosage"
                                radius: dp(18)
                                backgroundColor: "#E9FAFF"
                                textColor : "#034083"
                                borderColor : "#9EB9D9"
                                borderWidth: 1
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
                                text: "  Testimonials"
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
            }

            Rectangle {
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.3
                color: "transparent"

                AppText {
                    id:upperSection
                    text: "<b>Lorem ipsum</b> dolor sit amet, consectetur adipiscing elit."
                    font.pixelSize: sp(13)
                    color: "#777777"

                }

                AppText {
                    id:thirdtext
                    text: "Sed velit nulla, ornare vitae port vitae, pulvinar nec null."
                    font.pixelSize: sp(13)
                    color: "#777777"
                    anchors.top: upperSection.bottom
                }

                AppText{
                    id:secondtext
                    text: "Nam ornare nisi in mi tempu, eget tristique neque laret."
                    font.pixelSize: sp(13)
                    color: "#777777"
                    anchors.top: thirdtext.bottom
                }

                AppText {
                    id:upperSection1
                    text: "Fusce dictum dolor sit amet, consectetur adipiscing elit."
                    font.pixelSize: sp(13)
                    color: "#777777"
                    anchors.top: secondtext.bottom

                }
                AppText{
                    id:secondtext1
                    text: "Nam ornare nisi in mi tempus, eget tristique neque laret."
                    font.pixelSize: sp(13)
                    color: "#777777"
                    anchors.top: upperSection1.bottom
                }

                AppText {
                    id:thirdtext1
                    text: "Sed velit nulla, ornare vitae porta vitae, pulvinar nec nulla."
                    font.pixelSize: sp(13)
                    color: "#777777"
                    anchors.top: secondtext1.bottom
                }

                AppText {
                    id: forthtext1
                    text: "Nam nisl purus, ultricies in nulla sit amet, sodales purus."
                    font.pixelSize: sp(13)
                    color: "#777777"
                    anchors.top: thirdtext1.bottom
                }
            }
        }
    }

    Rectangle{
        id:bottomRect
        anchors.top: middleRect.bottom
        width: parent.width
        height: parent.height/3
        color: "#E9FAFF"

        Rectangle {
            anchors.top: parent
            width : parent.width
            height: parent.height * 0.755
            color: "#E9FAFF"


            Rectangle {
                anchors.top: parent
                width : parent.width
                height: parent.height * 0.3
                color: "#E9FAFF"

                AppButton {
                    id:playAudio
                    text: IconType.fileaudioo + "  Audio"
                    anchors.left: parent.left
                    fontCapitalization : Font.Capitalize
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: dp(10)
                    textSize:sp(18)

                    onClicked: {
                        navigationStack.push(audioPage)
                    }

                }

                AppButton {
                    id:playVideo
                    text: IconType.filevideoo + "  Video"
                    anchors.left: playAudio.right
                    fontCapitalization : Font.Capitalize
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: dp(10)
                    textSize:sp(18)

                    onClicked: {
                        navigationStack.push(videoPage)
                    }
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width : parent.width
                height: parent.height * 0.7
                color: "#E9FAFF"

                Rectangle {
                    anchors.fill: parent
                    anchors.leftMargin: parent.width * 0.05
                    anchors.rightMargin: parent.width * 0.05
                    anchors.topMargin: parent.width * 0.05
                    anchors.bottomMargin: parent.width * 0.08
                    color: "#E9FAFF"

                    ListPage {
                        //some JS array as list model
            //            model: [{
            //                    text: IconType.arrowright + "  Swipe to Buy",
            //                    backgroundColor:"black"

            //                }]

                        model: AppButton {
                                text: IconType.arrowright + "  Swipe to Buy "
                                backgroundColor: "#000000"
                                textSize: sp(20)


                                radius: dp(18)
                                minimumWidth: parent.width * 0.9
                                }



                        // define the SwipeOptionsContainer as delegate
                        delegate: SwipeOptionsContainer {
                            id: container


                            SimpleRow {                         //actual content to be displayed in the list rows
                                id: row


                            }




                            leftOption: AppButton {           //left options, displayed when swiped list row to the right
                                text: "UGX 230,000"
                                radius: dp(18)
                                backgroundColor: "black"
                                minimumWidth: parent.width * 0.9
                                height: row.height
            //                    Rectangle{
            //                        width: parent.width * 0.9
            //                        anchors.fill: parent
            //                        color: "black"


            //                    }
                                onClicked: {
//                                    row.item.text = "Option clicked"
//                                    row.itemChanged()
//                                    container.hideOptions()         //hide automatically when button clicked
                                    navigationStack.push(paymentPage)
                                }
                            }

                        } // SwipeOptionsContainer
                    } // ListPage

                }

//                AppButton {
//                    id:buttonMain
//                    anchors.centerIn: parent
//                    minimumWidth: parent.width * 0.9
//                    width: parent.width * 0.9
//                    height: parent.height
//                    radius: dp(25)
//                    backgroundColor: "#000000"


//                    AppText{
//                        text: "UGX 230,000"
//                        color : "#FFFFFF"
//                        anchors.verticalCenter:  parent.verticalCenter
//                        anchors.left:  parent.left
//                        anchors.leftMargin: dp(30)
//                        font.pixelSize: sp(20)
//                        font.bold: true
//                    }



//                    SwipeButton {
//                        id:btn
//                        anchors.verticalCenter: parent.verticalCenter
//                        anchors.right:  parent.right
//                        text: "<b>"+IconType.arrowright + "  Swipe to buy</b>"
//                        textSize: sp(18)
//                        minimumWidth: parent.width * 0.5
//                        width: parent.width * 0.5
//                        height: parent.height * 0.3
//                        fontCapitalization : Font.Capitalize

//                        radius:dp(25)
//                        backgroundColor: "#999999"
//                        textColor : "#FFFFFF"
//                        hideOptionsOnClick : true
//                    }
//                } // End of Swipe Button
            }


        }


        // ========== Tab Control ========
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
        } // End of Tab Control




    }

    Component {
        id: audioPage
        ProductAudio {}
    }

    Component{
        id:videoPage
        ProductVideo {}
    }

    Component {
        id: paymentPage
          PaymentInfo{}
    }




} // End of Main Page
