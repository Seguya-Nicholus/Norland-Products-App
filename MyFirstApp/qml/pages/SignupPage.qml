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
            height: parent.height * 0.28
            color: "#E9FAFF"
//            color: "black"


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
            height: parent.height - bottomRect.height - topRect.height
            color: "#E9FAFF"

            Column {
                anchors.fill: parent
                anchors.margins: dp(12)
                spacing: dp(12)


                // input Username
                AppTextField {
                    id: signupUsername
                    width: parent.width
                    placeholderText: qsTr(""+IconType.user + "   Username   ")
                }

                // input Phone number
                AppTextField {
                    id: signupPhoneNumber
                    width: parent.width
                    placeholderText: qsTr(""+IconType.phone + "   Phone Number ")
                }

                // input Password
                AppTextField {
                    id: signupPassword
                    width: parent.width
                    placeholderText: qsTr(""+IconType.lock + "   Password    ")
                    borderColor: Theme.tintColor
                    borderWidth: !Theme.isAndroid ? dp(2) : 0
                    echoMode: TextInput.Password
                }

                // input Country of origin
                AppTextField {
                    id: signupCountry
                    width: parent.width
                    placeholderText: qsTr(""+IconType.globe + "   Country                            ")
                }


                // input Refferal Code
                AppTextField {
                    id: signupCode
                    width: parent.width
                    placeholderText: qsTr(""+IconType.mobile + "   Refferal Code                            ")
                }
            }
        }

        Rectangle {
            id:bottomRect
            anchors.bottom:  parent.bottom
            width: parent.width
            height: parent.height * 0.25
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
                    minimumHeight: dp(42)
                    text: " Signup "
                    textSize:sp(18)
                    radius: dp(25)
                    fontCapitalization : Font.Capitalize
                    width: parent.width * 0.9
                    backgroundColor: "#005BAC"
                    onClicked: {
                        validateUserInputs(signupUsername.text,signupPhoneNumber.text,signupPassword.text,signupCountry.text,signupCode.text)
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
                    textSize:sp(18)
                    minimumWidth: parent.width * 0.9
                    minimumHeight: dp(42)
                    radius: dp(25)
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
        title: "Error"
        icon: StandardIcon.Critical
        text: ""
        standardButtons: StandardButton.Ok
    }

    MessageDialog {
        id: popup1
        title: "Create New User"
//        icon: StandardIcon.Information
        text: ""
        standardButtons: StandardButton.Ok
    }

    function clearInputs()
    {
        signupUsername.text = ""
        signupPassword.text = ""
        signupPhoneNumber.text = ""
        signupCountry.text = ""
        signupCode.text = ""
        //        signupUsername.focus
    }


    //
    function validateUserInputs(userName,phoneNumber,password,country,code)
    {
        if(userName !== "" && phoneNumber !== "" && password !== "" && country !== "" && code!== "")
        {
            //            database.insertIntoUsersTable(userName,phoneNumber,password,country);
            if(database.insertIntoUsersTable(userName,phoneNumber,password,country,code))
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


