import Felgo 3.0
import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.2

Page {
    title: qsTr("Login")
    preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait

    backgroundColor: "#E9FAFF"

    Rectangle {
        color: "#E9FAFF"
        anchors.fill: parent


        Rectangle {
            id:topRect
            anchors.top: parent
            width: parent.width
            height: parent.height - middleRect.height - bottomRect.height
            color: "#E9FAFF"


            AppImage {
                id:appLogo
                anchors.centerIn:  parent
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../../assets/norland_logo.png"
                width: 300; height: 300
                fillMode: Image.PreserveAspectFit
                clip: true
                autoTransform: true
            }
        }


        Rectangle {
            id:middleRect
            anchors.top: topRect.bottom
            width: parent.width
            height: parent.height * 0.2
            color: "#E9FAFF"

            Rectangle {
                id:rectPhoneNumber
                anchors.top: parent.top
                width: parent.width
                height: parent.height/2
                color: "#E9FAFF"

                // input Phone number
                AppTextField {
                    id: loginUsername
                    width: parent.width * 0.7
                    placeholderText: qsTr(""+IconType.phone + "   Phone Number ")
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id:rectPassword
                anchors.bottom:  parent.bottom
                width: parent.width
                height: parent.height/2
                color: "#E9FAFF"

                // input Password
                AppTextField {
                    id: loginPassword
                    width: parent.width * 0.7
                    placeholderText: qsTr(""+IconType.lock + "   Password    ")
                    anchors.centerIn: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    borderColor: Theme.tintColor
                    borderWidth: !Theme.isAndroid ? dp(2) : 0
                    echoMode: TextInput.Password
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
                id:rectLoginButton
                anchors.top: parent.top
                width: parent.width
                height: parent.height/2
                color: "#E9FAFF"

                // Button Login

                AppButton {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    minimumWidth: parent.width * 0.9
                    text: " Login "
                    textSize:sp(15)
                    radius: dp(18)
                    fontCapitalization : Font.Capitalize
                    width: parent.width * 0.9
                    backgroundColor: "#005BAC"
                    onClicked: {
                        validateUserCredentials(loginUsername.text, loginPassword.text)
//                        navigationStack.push(dashboard)
                    }
                }

            }

            Rectangle {
                id:rectSignUp
                anchors.bottom:  parent.bottom
                width: parent.width
                height: parent.height/2
                color: "#E9FAFF"

                // Button SignUp

                AppButton{
                    text: "Don't have an account ? <b>Sign Up</b>"
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
                        navigationStack.push(signup)
                    }
                }
            }
        }
    }

    Component {
        id: dashboard
        DashboardPage { }
    }

    Component{
        id:signup
        SignupPage{}
    }


    //Popup to show messages or warnings on the screen


    MessageDialog {
        id: popup
        title: "Invalid Credentials"
        icon: StandardIcon.Critical
        text: "Invalid User Credentials"
        standardButtons: StandardButton.Ok
    }

    function clearInputs()
    {
        loginUsername.text = ""
        loginPassword.text = ""
        loginUsername.focus()
    }



    function validateUserCredentials(phoneNumber, password)
    {
        if(phoneNumber === "" && password === "")
        {
            popup.text = "Missing credentials!"
            popup.open()
            clearInputs()
            return
        }
        else if(phoneNumber !== "" && password === "")
        {
            popup.text = "Password Missing!"
            popup.open()
            clearInputs()
        }
        else if(phoneNumber === "" && password !== "")
        {
            popup.text = "Phone Number Missing!"
            popup.open()
            clearInputs()
        }
        else if(phoneNumber !== "" && password !== "")
        {
            //            database.loginUser(loginUsername.text, loginPassword.text)
            if(database.loginUser(loginUsername.text, loginPassword.text))
            {
                navigationStack.push(dashboard)
            }
            else
            {
                popup.text = "Wrong Username and Password!"
                popup.open()
            }


        }
        else
        {
            popup.text = "Invalid credentials!"
            popup.open()
            clearInputs()
        }


    }

    // Login users
    function loginUser(uname, pword)
    {

        if(uname !== "")
        {
            message = "User not registered!"
            popup.popMessage = message
            popup.open()
        }
        else if(pword !== "orban")
        {
            message = ""
            popup.popMessage = message
            popup.open()
        }
        else
        {
            console.log("Login Success!")

        }
    }

}

