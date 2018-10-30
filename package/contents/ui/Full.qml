/***************************************************************************
 *   Copyright (C) 2013 by Aleix Pol Gonzalez <aleixpol@blue-systems.com>  *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0
import org.kde.discovernotifier 1.0

import "./lib"

Item {
    Layout.preferredWidth: 384 * units.devicePixelRatio
    Layout.preferredHeight: 330 * units.devicePixelRatio

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true

            PlasmaExtras.Heading {
                id: header
                Layout.fillWidth: true
                
                level: 3
                wrapMode: Text.WordWrap
                text: DiscoverNotifier.message
            }


            Button {
                Layout.preferredWidth: minimumWidth
                iconName: "view-history"
                text: i18n("History")
                tooltip: i18n("Open /var/log/apt/history.log")
                onClicked: root.action_openAptHistoryLog()
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.centerIn: parent
                visible: !DiscoverNotifier.isSystemUpToDate

                Label {
                    wrapMode: Text.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: DiscoverNotifier.extendedMessage
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: i18nd("plasma_applet_org.kde.discovernotifier", "Update")
                    tooltip: i18nd("plasma_applet_org.kde.discovernotifier", "Launches the software to perform the update")
                    onClicked: root.action_update()
                }
            }

            Button {
                visible: DiscoverNotifier.isSystemUpToDate
                anchors.centerIn: parent
                text: i18n("Check For Updates")
                onClicked: root.action_checkForUpdates()
            }
        }
        LinkLabel {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap

            property var ubuntuReleases: [
                { version: '16.04', name: 'xenial', lts: true },
                { version: '16.10', name: 'yakkety', lts: false },
                { version: '17.04', name: 'zesty', lts: false },
                { version: '17.10', name: 'artful', lts: false },
                { version: '18.04', name: 'bionic', lts: true },
                { version: '18.10', name: 'cosmic', lts: false },
                { version: '19.04', name: 'disco', lts: false },
                { version: '19.10', name: '', lts: false },
                { version: '20.04', name: '', lts: true },
                { version: '20.10', name: '', lts: false },
                { version: '21.04', name: '', lts: false },
                { version: '21.10', name: '', lts: false },
                { version: '22.04', name: '', lts: true },
            ]

            function getUbuntuRelease(version) {
                for (var i = 0; i < ubuntuReleases.length; i++) {
                    var ubuntuRelease = ubuntuReleases[i]
                    if (ubuntuRelease.version == version) {
                        return ubuntuRelease
                    }
                }
                return null
            }

            // https://stackoverflow.com/questions/2332811/capitalize-words-in-string
            function capitalize(str) {
                return str.replace(/\b\w/g, function(l){ return l.toUpperCase() })
            }

            function getLabelForRelease(ubuntuRelease) {
                var label = ''
                if (ubuntuRelease.name) {
                    label += capitalize(ubuntuRelease.name) + ' '
                }
                label += ubuntuRelease.version + (ubuntuRelease.lts ? ' LTS' : '')
                return label
            }

            text: {
                // var ubuntuRelease = getUbuntuRelease('16.10')
                // var ubuntuRelease = getUbuntuRelease('20.04')
                var ubuntuRelease = getUbuntuRelease(distro.release)
                if (!ubuntuRelease) {
                    return ''
                }

                // ubuntu-16.04-lts / ubuntu-16.10
                var usnId = 'ubuntu-' + ubuntuRelease.version + (ubuntuRelease.lts ? '-lts' : '')

                // Xenial 16.04 LTS / Yakkety 16.10
                var label = getLabelForRelease(ubuntuRelease)

                return i18n("<b>Ubuntu Security Notices:</b> <a href=\"https://usn.ubuntu.com/releases/%1/\">%2</a>", usnId, label)
            }
            visible: text

            Component.onCompleted: distro.update()
        }
        LinkLabel {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: i18n("<b>KDE Security Advisories:</b> <a href=\"https://www.kde.org/info/security/\">Link</a>")
        }
    }
}
