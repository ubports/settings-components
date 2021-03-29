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
import Lomiri.Settings.Test 0.1
import Lomiri.Settings.Menus 0.1

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

            MediaPlayerMenu {
                id: mediaPlayerMenu
            }
        }
    }

    LSTTestCase {
        name: "MediaPlayerMenu"
        when: windowShown

        function test_running() {
            var player = findChild(mediaPlayerMenu, "player");
            var albumArt = findChild(mediaPlayerMenu, "albumArt");

            var showTrack = mediaPlayerMenu.showTrack

            compare(player.visible, !showTrack, "player should be not visible when running");
            compare(albumArt.visible, showTrack, "albumn art should be visible when running");

            showTrack = !showTrack;
            mediaPlayerMenu.showTrack = showTrack;

            compare(player.visible, !showTrack, "player should be not visible when running");
            compare(albumArt.visible, showTrack, "albumn art should be visible when running");
        }
    }
}
