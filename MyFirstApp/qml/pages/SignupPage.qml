import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

Page {

    title: "Signup"

    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait
    backgroundColor: Qt.rgba(0,0,0, 0.75) // page background is translucent, we can see other items beneath the page
    useSafeArea: false // do not consider safe area insets of screen

    // login form background
    Rectangle {
        //        id: loginForm
        color: "#E9FAFF"
        anchors.fill: parent


        Rectangle {
            id:topRect
            anchors.top: parent
            width: parent.width
            height: parent.height /3
            color: "#E9FAFF"


            AppImage {
                id:appLogo
                anchors.top: parent.top
                anchors.topMargin: dp(20)
                anchors.horizontalCenter: parent.horizontalCenter

                source: "../../assets/norland_logo.png"
                width: 250; height: 250
                fillMode: Image.PreserveAspectFit
                clip: true
                autoTransform: true
            }
        }


        Rectangle {
            id:middleRect
            anchors.top: topRect.bottom
            width: parent.width
            height: parent.height /3
            color: "#E9FAFF"


            Rectangle{
                id:rectUsername
                anchors.top: parent.top
                width: parent.width
                height: parent.height/4
                color: "#E9FAFF"

                // input Username
                AppTextField {
                    id: signupUsername
                    width: parent.width * 0.7
                    placeholderText: qsTr(""+IconType.user + "   Username   ")
                    anchors.centerIn: parent.Center
                    anchors.horizontalCenter: parent.horizontalCenter
                }

            }

            Rectangle {
                id:rectPhoneNumber
                anchors.top: rectUsername.bottom
                width: parent.width
                height: parent.height/4
                color: "#E9FAFF"

                // input Phone number
                AppTextField {
                    id: signupPhoneNumber
                    width: parent.width * 0.7
                    placeholderText: qsTr(""+IconType.phone + "   Phone Number ")
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id:rectPassword
                anchors.top:  rectPhoneNumber.bottom
                width: parent.width
                height: parent.height/4
                color: "#E9FAFF"

                // input Password
                AppTextField {
                    id: signupPassword
                    width: parent.width * 0.7
                    placeholderText: qsTr(""+IconType.lock + "   Password    ")
                    anchors.centerIn: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    borderColor: Theme.tintColor
                    borderWidth: !Theme.isAndroid ? dp(2) : 0
                    echoMode: TextInput.Password
                }
            }


            Rectangle{
                id:rectCountry
                anchors.bottom:  parent.bottom
                width: parent.width
                height: parent.height/4
                color: "#E9FAFF"


                // input Country of origin
                AppTextField {
                    id: signupCountry
                    width: parent.width * 0.7
                    placeholderText: qsTr(""+IconType.globe + "   Country                            ")
                    anchors.centerIn: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                }

            }
        }

        Rectangle {
            id:bottomRect
            anchors.bottom:  parent.bottom
            width: parent.width
            height: parent.height /3
            color: "#E9FAFF"

            Rectangle {
                id:rectSignUp
                anchors.top:  parent.top
                width: parent.width
                height: parent.height/2
                color: "#E9FAFF"

                // Button SignUp

                AppButton{
                    anchors.bottom:  parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    minimumWidth: parent.width * 0.9
                    text: " Signup "
                    textSize:sp(15)
                    radius: dp(18)
                    fontCapitalization : Font.Capitalize
                    width: parent.width * 0.9
                    backgroundColor: "#005BAC"
                    onClicked: {
                        validateUserInputs(signupUsername.text,signupPhoneNumber.text,signupPassword.text,signupCountry.text)
                    }
                }
            }

            Rectangle {
                id:rectLoginButton
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height/2
                color: "#E9FAFF"

                // Button Login

                AppButton {
                    text: "Have an account ? <b>Login.</b>"
                    textSize:sp(13)
                    minimumWidth: parent.width * 0.9
                    radius: dp(18)
                    backgroundColor: "#E9FAFF"
                    textColor : "#005BAC"
                    fontCapitalization : Font.Capitalize
                    borderColor : "#005BAC"
                    width: parent.width * 0.9
                    borderWidth: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        navigationStack.push(loginPage)
                    }
                }

            }
        }

    }




    //Popup to show messages or warnings on the screen


    MessageDialog {
        id: popup
        title: "Create New User"
        icon: StandardIcon.Critical
        text: ""
        standardButtons: StandardButton.Ok
    }

    MessageDialog {
        id: popup1
        title: "Create New User"
        icon: StandardIcon.Information
        text: ""
        standardButtons: StandardButton.Ok
    }

    function clearInputs()
    {
        signupUsername.text = ""
        signupPassword.text = ""
        signupPhoneNumber.text = ""
        signupCountry.text = ""
        //        signupUsername.focus
    }


    //
    function validateUserInputs(userName,phoneNumber,password,country)
    {
        if(userName !== "" && phoneNumber !== "" && password !== "" && country !== "")
        {
            //            database.insertIntoUsersTable(userName,phoneNumber,password,country);
            if(database.insertIntoUsersTable(userName,phoneNumber,password,country))
            {
                popup1.text = "User Created Successfully"
                popup1.open()
                clearInputs()
                navigationStack.push(loginPage)
            }

        }
        else
        {
            popup.text = "Some Fields are Missing!"
            popup.open()
            clearInputs()
            return
        }
    }

}


