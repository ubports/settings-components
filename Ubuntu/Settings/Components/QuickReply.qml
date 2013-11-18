/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Renato Araujo Oliveira Filho <renato@canonical.com>
 *      Olivier Tilloy <olivier.tilloy@canonical.com>
 */

import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Item {
    id: quickReply
    property alias buttonText: actionTextField.buttonText
    property real expandedHeight: childrenRect.height
    property alias messages : messagelistRepeater.model
    property alias replyEnabled: actionTextField.activateEnabled

    signal replied(var value)

    Item {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: units.gu(4)

        Row {
            anchors {
                fill: parent
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
                topMargin: units.gu(1)
                bottomMargin: units.gu(1)
            }
            spacing: units.gu(1)

            Image {
                width: units.gu(2)
                height: width
                fillMode: Image.PreserveAspectFit
                source: "artwork/message_sms01_54px.png"
            }

            Label {
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                fontSize: "small"
                text: "Quick reply with:"
            }
        }

        ListItem.ThinDivider {
            anchors.bottom: parent.bottom
        }
    }

    Column {
        id: messagelist
        anchors {
            left: parent.left
            right: parent.right
            top: header.bottom
        }
        height: childrenRect.height

        Repeater {
            id: messagelistRepeater

            height: childrenRect.height

            Item {
                objectName: "replyMessage" + index
                width: messagelist.width
                height: units.gu(5)

                Label {
                    id: __label

                    anchors {
                        fill: parent
                        leftMargin: units.gu(2)
                        rightMargin: units.gu(2)
                    }
                    verticalAlignment: Text.AlignVCenter
                    fontSize: "medium"
                    text: modelData
                }

                ListItem.ThinDivider {
                    anchors.top: parent.top
                }
                ListItem.ThinDivider {
                    anchors.bottom: parent.bottom
                }

                MouseArea {
                    id: __mouseArea

                    anchors.fill: parent
                    onClicked: {
                        actionTextField.text = modelData;
                    }
                }

                Rectangle {
                    id: __mask

                    anchors.fill: parent
                    color: "black"
                    opacity: __mouseArea.pressed ? 0.3 : 0.0
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 200
                            easing.type: Easing.OutQuad
                        }
                    }
                }
            }

        }
    }

    Item {
        anchors.top: messagelist.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: units.gu(6)

        ActionTextField {
            id: actionTextField

            anchors.fill: parent
            anchors.margins: units.gu(1)
            activateEnabled: replyEnabled

            onActivated: {
                quickReply.replied(value)
            }
        }

        ListItem.ThinDivider {
            anchors.top: parent.top
        }
    }
}