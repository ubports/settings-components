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

#ifndef LOMIRISETTINGSFINGERPRINT_H
#define LOMIRISETTINGSFINGERPRINT_H

#include <QObject>

class LomiriSettingsFingerprint : public QObject
{
    Q_OBJECT
public:
    explicit LomiriSettingsFingerprint(QObject* parent = 0);

    Q_PROPERTY(qlonglong uid READ uid CONSTANT)
    Q_PROPERTY(bool debug READ debug CONSTANT)

    qlonglong uid() const;
    bool debug() const;
};

#endif // LOMIRISETTINGSFINGERPRINT_H
