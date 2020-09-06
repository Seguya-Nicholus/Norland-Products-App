import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3 as QQC2

Page {
    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait
    readonly property  real contentPadding: dp(Theme.navigationBar.defaultBarItemPadding)
    property alias childNavigationStack : navStack

    useSafeArea: false


    NavigationStack {

        id: navStack

        leftColumnIndex: 1
        splitView: tablet

        Page {
            id: mainPage
            //            title: "Welcome"
            navigationBarHidden: true

            Rectangle {
                color: "#E9FAFF"
                anchors.fill: parent

                // ========== Upper Section to display image and description
                Rectangle {
                    id:topRect
                    anchors.top: parent
                    width: parent.width
                    height: parent.height - bottomRect.height - middleRect.height
                    color: "#E9FAFF"

                    AppImage {
                        id:appLogo
                        anchors.bottom:  parent.bottom
                        anchors.bottomMargin: dp(30)
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "../../assets/norland_logo.png"
                        width: 300; height: 300
                        fillMode: Image.PreserveAspectFit
                        clip: true
                        autoTransform: true
                    }

                } // End of Upper Section

                // ========== Middle Section to display text
                Rectangle{
                    id:middleRect
                    anchors.bottom:  bottomRect.top
                    width: parent.width
                    height: parent.height * 0.25
                    color: "#E9FAFF"

                    AppText {
                        id: centerItem
                        anchors.top: parent.top
                        anchors.topMargin: dp(30)
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Welcome to the science"
                        font.pixelSize:sp(25)
                        font.bold: false
                        color: "#005BAC"
                    }


                    AppText{
                        id: centerItem2
                        anchors.centerIn: parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "of rejuvenation, regeneration"
                        font.pixelSize: sp(25)
                        font.bold: false
                        color: "#005BAC"
                    }


                    AppText{
                        id: centerItem3
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: dp(30)
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "and restoration."
                        font.pixelSize:sp(25)
                        font.bold: false
                        color: "#005BAC"
                    }

                }
                // End of Middle Section


                // ========== Bottom Section to display PageControl and button
                Rectangle {
                    id:bottomRect
                    anchors.bottom:  parent.bottom
                    width: parent.width
                    height: parent.height * 0.29
                    color: "#E9FAFF"

                    Rectangle{
                        id:pageControlRect
                        anchors.top:  parent.top
                        width: parent.width
                        height: parent.height/3
                        color: "#E9FAFF"

                        QQC2.SwipeView {
                            id: view
                            currentIndex: 3
                            anchors.top:  parent.top
                        }

                        PageControl {
                            pages: 7
                            anchors.top:  parent.top
                            currentPage: view.currentIndex
                            indicatorSize: dp(12)
                            tintColor : "#AAAAAA"
                            activeTintColor : "#005BAC"
                        }
                    }

                    AppButton {
                        anchors.centerIn: parent
                        minimumWidth: parent.width * 0.9
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Let's get Started     " + IconType.arrowleft
                        fontCapitalization : Font.Capitalize
                        textSize:sp(15)
                        radius: dp(18)
                        width: parent.width * 0.9
                        backgroundColor: "#005BAC"

                        onClicked: {
                            mainPage.navigationStack.popAllExceptFirstAndPush(loginPage)
                        }
                    }

                }  // End of Bottom Section

            }
        }
    }

    Component {
        id: loginPage
        LoginPage { }
    }
}



