import QtQuick 2.0
import Felgo 3.0

Page {

    Component.onCompleted: {
        NativeDialog.inputText("Delivery Address and Contact", "Delivery Address ?", "Input Address here", "", function(ok, address) {
            if(ok) {
                NativeDialog.inputText("Delivery Address and Contact", "Recipient Number ?", "Input Number here", "", function(ok, number) {
                    if(ok) {
                        inputBtn.text = "Input: " + text
                    }
                })
            }
        })

    }

}
