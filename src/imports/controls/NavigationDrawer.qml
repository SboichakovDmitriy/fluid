/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQml 2.2
import Fluid.Core 1.0
import Fluid.Controls 1.0

/*!
    \qmltype NavigationDrawer
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief The navigation drawer slides in from the left and is a common pattern in apps.

    \code
    import QtQuick.Window 2.2
    import Fluid.Controls 2.0 as FluidControls

    Window {
        id: window
        width: 400
        height: 400
        visible: true

        Button {
            text: "Open"
            onClicked: drawer.open()
        }

        FluidControls.NavigationDrawer {
            topContent: [
                Button {
                    text: "Push me"
                    onClicked: console.log("Pushed")
                }
            ]

            actions: [
                Action {
                    text: "Action 1"
                },
                Action {
                    text: "Action 1"
                }
            ]
        }
    }
    \endcode
*/

Drawer {
    id: drawer

    /*!
        \qmlproperty list<Item> topContent

        The items added to this list will be displayed on top of the
        actions list.

        \code
        import QtQuick.Window 2.2
        import Fluid.Controls 2.0 as FluidControls

        Window {
            id: window
            width: 400
            height: 400
            visible: true

            Button {
                text: "Open"
                onClicked: drawer.open()
            }

            FluidControls.NavigationDrawer {
                topContent: [
                    Button {
                        text: "Push me"
                        onClicked: console.log("Pushed")
                    }
                ]
            }
        }
        \endcode
    */
    property alias topContent: topContent.data

    /*!
        \qmlproperty list<QtObject> actions

        List of actions to be displayed by the drawer.

        \code
        import QtQuick.Window 2.2
        import Fluid.Controls 2.0 as FluidControls

        Window {
            id: window
            width: 400
            height: 400
            visible: true

            Button {
                text: "Open"
                onClicked: drawer.open()
            }

            FluidControls.NavigationDrawer {
                actions: [
                    Action {
                        text: "Action 1"
                    },
                    Action {
                        text: "Action 1"
                    }
                ]
            }
        }
        \endcode
    */
    property list<QtObject> actions

    width: {
        switch (Device.formFactor) {
        case Device.Phone:
            return 280
        case Device.Tablet:
            return 320
        default:
            break
        }
        return 56 * 4
    }
    height: ApplicationWindow.height

    padding: 0

    Pane {
        id: pane

        anchors.fill: parent
        padding: 0

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            ColumnLayout {
                id: topContent

                height: childrenRect.height + 2 * drawer.padding

                spacing: 0
                visible: children.length > 0

                Layout.margins: drawer.padding
                Layout.fillWidth: true
            }

            ListView {
                currentIndex: -1
                spacing: 0

                model: drawer.actions

                delegate: ListItem {
                    iconName: modelData.iconName
                    text: modelData.text
                    onClicked: modelData.triggered(drawer)
                }

                visible: count > 0

                Layout.fillWidth: true
                Layout.fillHeight: true

                ScrollBar.vertical: ScrollBar {}
            }
        }
    }
}
