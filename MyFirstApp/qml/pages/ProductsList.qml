import QtQuick 2.0
import Felgo 3.0

Page {

    property  var model: ({})

    title: "Products"

    ListPage {

        model: ProductModel

        delegate: SwipeOptionsContainer {

            SimpleRow {

                Rectangle {
                    id: background
                    width: parent.height
                    height: parent.height
                    color: "transparent"

                    // add the image
                    Image {
                        id: bgImage
                        source: ImagePath
                        anchors.fill: parent
                        anchors.centerIn: parent
                        anchors.topMargin: dp(5)
                        anchors.bottomMargin: dp(5)
                        anchors.leftMargin: dp(5)
                        anchors.rightMargin: dp(5)
                    }
                }
                autoSizeImage: true
                image.fillMode: Image.PreserveAspectCrop
                imageSource:  ImagePath
                imageMaxSize: dp(40)
                detailTextItem.maximumLineCount: 2
                text: ProductName
                detailText: ProductText
                //          detailText: Cost
                badgeValue: Cost
                onSelected: {
                    //            page.navigationStack.popAllExceptFirstAndPush(worklogDetailPageComponent, {title: "Edit Worklog", issue: dataModel.getIssueForId(model.issueId), worklog: model})
                }
            }

            rightOption: SwipeButton {
                text: "Delete"
                icon: IconType.trash
                backgroundColor: "red"
                onClicked: {
                    dataModel.removeWorklog(model.id)
                }
            }
        }

        //      listView.headerPositioning: ListView.OverlayHeader
        //      listView.header: WorklogsHeader {
        //        onClickedNew: {
        //          page.navigationStack.popAllExceptFirstAndPush(issuesPageComponent)
        //        }
        //      }

        //      Component {
        //        id: issuesPageComponent
        //        IssuesPage {
        //        }
        //      }

        //      Component {
        //        id: worklogDetailPageComponent
        //        WorklogDetailPage {
        //        }
        //      }
    }

    //    ListPage {
    //        anchors.leftMargin: dp(10)
    //        anchors.rightMargin: dp(10)
    //        anchors.topMargin: dp(10)
    //        anchors.bottomMargin: dp(10)
    //        anchors.fill:parent
    //        model: ProductModel


    //        delegate: SimpleRow {

    //            autoSizeImage: true
    //            imageMaxSize: dp(50)
    //            image.fillMode: Image.PreserveAspectCrop

    //            AppImage{
    //                id:imageProduct
    //                anchors.topMargin: dp(10)
    //                anchors.bottomMargin: dp(10)
    //                source: ImagePath
    //                width: dp(50)
    //                height: dp(50)
    //                fillMode: Image.PreserveAspectCrop
    //                autoTransform: true
    //            }

    //            AppText {
    //                id:productName
    //                anchors.left: imageProduct.right
    //                anchors.leftMargin: dp(10)
    //                anchors.top: parent.top
    //                text: ProductName
    //                font.bold: true
    //                font.pixelSize: sp(15)
    //            }

    //            AppText{
    //                id:productText
    //                anchors.left: imageProduct.right
    //                anchors.top: productName.bottom
    //                anchors.leftMargin: dp(10)
    //                text: ProductText
    //                font.pixelSize: sp(10)
    //                color: "#A1A1A1"
    //            }

    //            AppText{
    //                id: productCost
    //                anchors.left: imageProduct.right
    //                anchors.top: productText.bottom
    //                anchors.leftMargin: dp(10)
    //                font.bold: true
    //                color: "#034083"
    //                text: Cost
    //                font.pixelSize: sp(15)
    //            }
    //        }
    //    }




}
