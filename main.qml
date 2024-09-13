import QtQuick
import QtQuick.Window
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style
import Qt5Compat.GraphicalEffects

ApplicationWindow {
    id: root
    width: 1600
    height: 1200
    visible: true
    title: qsTr("Day 2 Challenge")
    color: "#F3F6FF"

    FontLoader {
        id: fontFamily
        source: "qrc:/Merriweather/Merriweather-Regular.ttf"
    }

    function formatMessageCount(count) {
        if (count >= 1000) {
            // Divide the count by 1000 and format to one decimal place if necessary
            let formattedCount = (count / 1000).toFixed(1);

            // Remove unnecessary trailing zero if the number is a whole number like 1.0
            if (formattedCount.endsWith('.0')) {
                formattedCount = formattedCount.slice(0, -2);
            }

            return `${formattedCount}K`;
        } else {
            // Return the count as a simple number
            return count.toString();
        }
    }


    ShadowRectangle {
        anchors.centerIn: parent
        width: 615
        height: 505
        color: Style.white
        radius: 24

        ColumnLayout {
            id: layout
            spacing: 23
            anchors.fill: parent
            anchors.leftMargin: 24
            anchors.rightMargin: 24
            anchors.bottomMargin: 40
            anchors.topMargin: 40

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                text: qsTr("Latest")
                color: "#2A2A2D"
                font.pixelSize: 24
                font.family: fontFamily.name
            }

            ListView {
                id: listview
                clip: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 372 + 15
                spacing: 5
                highlightFollowsCurrentItem: true
                keyNavigationEnabled: true
                Component.onCompleted: listview.forceActiveFocus()
                model: ListModel {
                    ListElement {
                        title: "Run Text Data block from command-line"
                        image: "qrc:/icons/person_1.png"
                        messageCount: 4500
                        colorRect: "#FF417A"
                        subtitle: "Support and Discussion"
                    }
                    ListElement {
                        title: "Pie Manu Editor"
                        image: "qrc:/icons/person_2.png"
                        messageCount: 80
                        colorRect: "#CD41FF"
                        subtitle: "Team Projects"
                    }
                    ListElement {
                        title: "Adding Node Group to All Selected Objects"
                        image: "qrc:/icons/person_3.png"
                        messageCount: 300
                        colorRect: "#4198FF"
                        subtitle: "Modelling"
                    }
                    ListElement {
                        title: "Geometry Nodes"
                        image: "qrc:/icons/person_4.png"
                        messageCount: 1500
                        colorRect: "#FFB341"
                        subtitle: "Support and Discussion"
                    }
                }

                highlight: Rectangle {
                    color: "#ECECEC"
                    radius: 8
                }

                delegate: ItemDelegate {
                    width: layout.width
                    height: 93
                    text: title
                    focus: true
                    activeFocusOnTab: true
                    background: Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        radius: 8
                    }

                    contentItem: RowLayout {
                        spacing: 16
                        Image {
                            Layout.leftMargin: 16
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                            source: image
                        }

                        ColumnLayout {
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                            Text {
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                font.pixelSize: 16
                                color: "#2A2A2D"
                                text: title
                            }
                            RowLayout {
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                Item {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    width: 16
                                    height: 16
                                    RectangularGlow {
                                          id: effect
                                          anchors.fill: rect
                                          glowRadius: 10
                                          spread: 0.2
                                          color: Style.alphaColor(colorRect,0.4)
                                          cornerRadius: rect.radius + glowRadius
                                      }

                                      Rectangle {
                                          id: rect
                                          color: colorRect
                                          anchors.centerIn: parent
                                          width: 16
                                          height: 16
                                          radius: 4
                                      }
                                }

                                Text {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    font.pixelSize: 16
                                    color: "#2A2A2D"
                                    text: subtitle
                                }
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Control {
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                            leftPadding: 6
                            rightPadding: 6
                            Layout.rightMargin: 16
                            contentItem: RowLayout {
                                Image{
                                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                                    source: "qrc:/icons/ic_message.svg"
                                }
                                Text {
                                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                    font.pixelSize: 16
                                    color: "#2A2A2D"
                                    text: formatMessageCount(messageCount)
                                }
                            }

                            background: Rectangle {
                                anchors.fill: parent
                                color: "#ECECEC"
                                radius: 27
                            }
                        }
                    }
                }
            }
        }
    }
}
