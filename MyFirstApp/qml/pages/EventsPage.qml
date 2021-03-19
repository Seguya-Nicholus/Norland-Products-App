import Felgo 3.0
//import QtQuick 2.0
//import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls.Private 1.0
//import QtQuick.Layouts 1.1
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11



Page {

//    title: "Events"



//    Rectangle {
//        color: "#E9FAFF"
//        anchors.fill: parent
////        anchors.top: top1.bottom
////        anchors.topMargin: appTabBar.height


//        AppListView {
//            id: alarmListView
//            delegate: SimpleRow {

//                ColumnLayout {
//                    spacing: 0

//                    RowLayout {
//                        ColumnLayout {
//                            id: dateColumn

//                            readonly property date alarmDate: new Date(
//                                                                  model.year, model.month - 1, model.day, model.hour, model.minute)

//                            Label {
//                                id: timeLabel
//                                font.pixelSize: Qt.application.font.pixelSize * 2
//                                //                                            text: dateColumn.alarmDate.toLocaleTimeString(window.locale, Locale.ShortFormat)
//                                text: text
//                            }
//                            //                                        RowLayout {
//                            //                                            Label {
//                            //                                                id: dateLabel
//                            ////                                                text: dateColumn.alarmDate.toLocaleDateString(window.locale, Locale.ShortFormat)
//                            //                                                    text: detailText
//                            //                                            }
//                            //                                            Label {
//                            //                                                id: alarmAbout
//                            //                                                text: "⸱ " + model.label
//                            //                                                visible: model.label.length > 0 && !root.checked
//                            //                                            }
//                            //                                        }
//                        }
//                        //                                    Item {
//                        //                                        Layout.fillWidth: true
//                        //                                    }
//                        //                                    Switch {
//                        //                                        checked: model.activated
//                        //                                        Layout.alignment: Qt.AlignTop
//                        //                                        onClicked: model.activated = checked
//                        //                                    }
//                    }
//                    //        CheckBox {
//                    //            id: alarmRepeat
//                    //            text: qsTr("Repeat")
//                    //            checked: model.repeat
//                    //            visible: root.checked
//                    //            onToggled: model.repeat = checked
//                    //        }
//                    //        Flow {
//                    //            visible: root.checked && model.repeat
//                    //            Layout.fillWidth: true

//                    //            Repeater {
//                    //                id: dayRepeater
//                    //                model: daysToRepeat
//                    //                delegate: RoundButton {
//                    //                    text: Qt.locale().dayName(model.dayOfWeek, Locale.NarrowFormat)
//                    //                    flat: true
//                    //                    checked: model.repeat
//                    //                    checkable: true
//                    //                    Material.background: checked ? Material.accent : "transparent"
//                    //                    onToggled: model.repeat = checked
//                    //                }
//                    //            }
//                    //        }

//                    //                                TextField {
//                    //                                    id: alarmDescriptionTextField
//                    //                                    placeholderText: qsTr("Enter description here")
//                    ////                                    cursorVisible: true
//                    //                                    visible: root.checked
//                    //                                    text: model.label
//                    ////                                    onTextEdited: model.label = text
//                    //                                }
//                    //                                Button {
//                    //                                    id: deleteAlarmButton
//                    //                                    text: qsTr("Delete")
//                    //                                    width: 40
//                    //                                    height: 40
//                    //                                    visible: root.checked
//                    //                                    onClicked: root.ListView.view.model.remove(root.ListView.view.currentIndex, 1)
//                    //                                }
//                }

//            }
//            model: [
//                { text: "Widget test",
//                    detailText: "Some of the widgets available in Felgo AppSDK",
//                    icon: IconType.tablet },
//                { text: "Shown are:",
//                    detailText: "ListPage, NavigationBar with different items, Switch",
//                    icon: IconType.question },
//                { text: "Widget test",
//                    detailText: "Some of the widgets available in Felgo AppSDK",
//                    icon: IconType.tablet },
//                { text: "Shown are:",
//                    detailText: "ListPage, NavigationBar with different items, Switch",
//                    icon: IconType.question },
//                { text: "Widget test",
//                    detailText: "Some of the widgets available in Felgo AppSDK",
//                    icon: IconType.tablet },
//                { text: "Shown are:",
//                    detailText: "ListPage, NavigationBar with different items, Switch",
//                    icon: IconType.question },
//                { text: "Widget test",
//                    detailText: "Some of the widgets available in Felgo AppSDK",
//                    icon: IconType.tablet },
//                { text: "Shown are:",
//                    detailText: "ListPage, NavigationBar with different items, Switch",
//                    icon: IconType.question }
//            ]
//        }

////        Rectangle {
////            id: footer
////            anchors.bottom: parent.bottom
////            width:parent.width
////            height: dp(50)
////            color: "light blue"


////            AppButton {
////                id: checkoutButton
////                text: IconType.plus + " Add Event"
////                minimumWidth: parent.width * 0.9
////                minimumHeight: dp(42)
////                anchors.right: parent.right
////                radius: dp(25)
////                backgroundColor: "#005BAC"
////                textColor : "#FFFFFF"
////                fontCapitalization : Font.Capitalize
////                borderColor : "#005BAC"
////                width: parent.width * 0.9
////                borderWidth: 1
////                anchors.horizontalCenter: parent.horizontalCenter
////                onClicked: {
//////                    navigationStack.push(newEvent)
////                    navigationStack.push(newEvent)

////                }
////            }


////        }

//    }

    AppButton {
        id: checkoutButton
        text: IconType.plus + " Add Event"
        minimumWidth: parent.width * 0.9
        minimumHeight: dp(42)
//        anchors.right: parent.right
        anchors.bottom: parent.bottom
        radius: dp(25)
        backgroundColor: "#005BAC"
        textColor : "#FFFFFF"
        fontCapitalization : Font.Capitalize
        borderColor : "#005BAC"
        width: parent.width * 0.9
        borderWidth: 1
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
//                    navigationStack.push(newEvent)
            navigationStack.push(newEvent)

        }
    }

    Component {
        id: newEvent
        NewEventPage { }
    }


}

