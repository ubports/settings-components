/*
 * Copyright (C) 2016 Canonical, Ltd.
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
 * Authored by Jonas G. Drange <jonas.drange@canonical.com>
 */
#include <unistd.h>
#include <sys/types.h>
#include <QProcessEnvironment>

#include "lomirisettingsfingerprint.h"

LomiriSettingsFingerprint::LomiriSettingsFingerprint(QObject* parent)
    : QObject(parent)
{
}

qlonglong LomiriSettingsFingerprint::uid() const
{
    return qlonglong(getuid());
}

bool LomiriSettingsFingerprint::debug() const
{
    return QProcessEnvironment::systemEnvironment().contains(
        QLatin1String("USC_FINGERPRINT_DEBUG")
    );
}
