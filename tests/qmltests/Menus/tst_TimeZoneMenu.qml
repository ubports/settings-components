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
 * Authored by Andrea Cimitan <andrea.cimitan@canonical.com>
 */

import QtQuick 2.4
import QtTest 1.0
import Ubuntu.Test 0.1
import Ubuntu.Settings.Menus 0.1

Item {
    width: units.gu(42)
    height: units.gu(75)

    Flickable {
        id: flickable

        anchors.fill: parent
        contentWidth: column.width
        contentHeight: column.height

        Item {
            id: column

            width: flickable.width
            height: childrenRect.height

            TimeZoneMenu {
                id: timeZoneMenu
                city: "San Francisco, USA"
                time: "10:00am"
            }
            TimeZoneMenu {
                id: timeZoneMenu2
                city: "London, UK"
                time: "6:00pm"
                anchors.top: timeZoneMenu.bottom
            }
        }
    }

    UbuntuTestCase {
        name: "TimeZoneMenu"
        when: windowShown

        function test_city() {
            timeZoneMenu.city = "London, UK"
            compare(timeZoneMenu.city, "London, UK", "Cannot set city")
        }

        function test_time() {
            timeZoneMenu.time = "12:00am"
            var timeLabel = findChild(timeZoneMenu, "timeLabel")
            compare(timeLabel.text, "12:00am", "Cannot set time")
        }
    }
}
