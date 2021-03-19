import QtQuick 2.0
import Felgo 3.0
import "../components"

Page {

    property date startDate:new Date()
    property date endDate: new Date()

    function formatStartDateTime(date) {
        return Qt.formatDateTime(date, "dd/MMM/yyyy hh:mm:ss")
    }


    function formatEndDateTime(date) {
        return Qt.formatDateTime(date, "dd/MMM/yyyy hh:mm:ss")
    }


    title: "Create New Event"

    // add a navigation bar row to the right slot
    rightBarItem: NavigationBarRow {
        // ... and an icon button

        IconButtonBarItem {
            id: saveEvent
            icon: IconType.save
            onClicked: {
                save()
                navigationStack.push(dashboard)
            }
        }
    }

    Column {
        id: contentCol
        width: parent.width

        TextFieldRow {
            id: subject
            label: "Subject"
            placeHolder: "Add a Subject..."
            //                    value:""
        }

        TextFieldRow {
            id: location
            label: "Location"
            placeHolder: "Add a Location for the Event..."
            //        value: worklog ? worklog.comment : ""
        }

        TextFieldRow {
            id:startTime
            label: "Start Time"
            value: "" /*Qt.formatDateTime(new Date())*/
            clickEnabled: true
            onClicked: {
                startTimePickerDialog.open()
                //nativeUtils.displayDatePicker() // alternative, with native UI
            }
        }

        TextFieldRow {
            id:endTime
            label: "End Time"
            value: "" /*dataModel.formatDateTime(startDate)*/
            clickEnabled: true
            onClicked: {
                endTimePickerDialog.open()
                //nativeUtils.displayDatePicker() // alternative, with native UI
            }
        }


        TextFieldRow {
            id: comment
            label: "Details"
            placeHolder: "Add details..."
            //            value: worklog ? worklog.comment : ""
        }

    }


    FloatingActionButton {
        id: saveButton
        icon: IconType.save
        //visible: true // only show on Android by default
        onClicked: {
            save()
            navigationStack.push(dashboard)
            console.log(returnDateTimeNow());
        }

        PropertyAnimation {
            target: saveButton
            property: "anchors.bottomMargin"
            duration: 500
            easing.type: Easing.InQuart
            from: -8*saveButton.anchors.bottomMargin
            to: saveButton.anchors.bottomMargin
            running: true
        }
    }

    DateTimePickerDialog2 {
        id: startTimePickerDialog
        datePicker.datePickerMode: datePicker.dateTimeMode
        datePicker.minuteInterval: 5
        onAccepted: {
            startDate = datePicker.selectedDate
            var showStartDate = formatStartDateTime(startDate)
            startTime.value = showStartDate
        }
    }


    DateTimePickerDialog3 {
        id: endTimePickerDialog
        datePicker1.datePickerMode: datePicker1.dateTimeMode
        datePicker1.minuteInterval: 5
        onAccepted: {
            endDate = datePicker1.selectedDate
            var showEndDate = formatEndDateTime(endDate)
            endTime.value = showEndDate
        }
    }

    function clearInputs(){

        subject.value = ""
        location.value = ""
        startTime.value = ""
        endTime.value = ""
        comment.value = ""


    }

    function returnDateTimeNow(){
        return(Qt.formatDateTime(new Date(), "dd/MMM/yy hh:mm:ss"));

    }



    function save() {
        database.insertIntoEventsTable(subject.value, location.value, startTime.value, endTime.value, comment.value, database.getUserId(loginUsername.text,loginPassword.text), returnDateTimeNow())
        console.log("Subject : " + subject.value,"Location : " + location.value,"Start : " + startTime.value,"End : " + endTime.value,"Comment : " + comment.value, "UserId : " + database.getUserId(loginUsername.text,loginPassword.text), "Created at : " + returnDateTimeNow())
        clearInputs();

        //      if(worklog) {
        //        dataModel.updateWorklog(issue, worklog, startDate, timeSpent.value, comment.value)
        //      } else {
        //        dataModel.addWorklog(issue, startDate, timeSpent.value, comment.value)
        //      }
        //      page.navigationStack.popAllExceptFirst()
        //      navigation.currentIndex = 0 // after adding a new worklog, change to the worklog view
    }
}
