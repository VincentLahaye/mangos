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

#ifndef _PLAYERBOTAI_H
#define _PLAYERBOTAI_H

#include "Common.h"
#include "../QuestDef.h"
#include "../GameEventMgr.h"
#include "../ObjectGuid.h"
#include "../BattleGround.h"

class WorldPacket;
class WorldObject;
class Player;
class Unit;
class Object;
class Item;
class PlayerbotMgr;
class BattleGround;

typedef std::map<ObjectGuid, BattleGroundPlayer> BattleGroundPlayerMap;

#define MAX_RANGE_MOVEMENT            250.0f

class MANGOS_DLL_SPEC PlayerbotAI
{
public:
    enum BotState
    {
        BOTSTATE_NORMAL,
        BOTSTATE_COMBAT,
        BOTSTATE_DEAD,
        BOTSTATE_DEADRELEASED,
        BOTSTATE_LOOTING,
        BOTSTATE_FLYING
    };

    typedef std::map<uint32, uint32> BotNeedItem;
    typedef std::list<Unit*> BotVictimList;
    typedef std::map<uint32, float> SpellRanges;
    typedef std::vector<uint32> BotTaxiNode;

public:
    PlayerbotAI(PlayerbotMgr * const mgr, Player * const bot);
    virtual ~PlayerbotAI();

    void ReinitAI();

    void UpdateAI(const uint32 p_time);

    void HandleBotOutgoingPacket(const WorldPacket& packet);
    void HandleTeleportAck();

    BotState GetState() { return m_botState; };
    void SetState(BotState state);

    void InitBotStatsForLevel(uint32, bool = false);

private:
    PlayerbotMgr* const m_mgr;
    Player* const m_bot;
    
    BotState m_botState;

    BotTaxiNode m_taxiNodes;

    float orig_x, orig_y, orig_z;
    uint32 orig_map;
};

#endif
