import QtQuick 2.0
import Felgo 3.0

Dialog {

    id: dialog1


    anchors.fill: parent
    autoSize: true

    title: "Select end time"
    titleDividerVisible: Theme.isIos

    onCanceled: close()
    onAccepted: close()


    property alias datePicker1: picker1

    DatePicker {
        id: picker1
        width: parent.width
        //dateFormat: "MMM d, yyyy"
        dateFormat: "ddd d. MMM"
    }

}
