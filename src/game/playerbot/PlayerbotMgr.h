/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _PLAYERBOTMGR_H
#define _PLAYERBOTMGR_H

#include "Common.h"

class WorldPacket;
class Player;
class Unit;
class Object;
class Item;

class MANGOS_DLL_SPEC PlayerbotMgr
{
public:
    PlayerbotMgr();
    virtual ~PlayerbotMgr();

    // This is called from Unit.cpp and is called every second (I think)
    void UpdateAI(const uint32 p_time);

    void HandleMasterOutgoingPacket(const WorldPacket& packet);

    static void AddAllBots();

    void LogoutPlayerBot(ObjectGuid guid);
    Player* GetPlayerBot (ObjectGuid guid) const;

    void LogoutAllBots();
    void OnBotLogin(Player * const bot);
};

#endif
