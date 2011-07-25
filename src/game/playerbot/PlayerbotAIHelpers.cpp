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

#include "Config/Config.h"
#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "../ItemPrototype.h"
#include "../World.h"
#include "../SpellMgr.h"
#include "PlayerbotAI.h"
#include "PlayerbotMgr.h"
#include "../Player.h"
#include "../ObjectMgr.h"
#include "../Chat.h"
#include "WorldPacket.h"
#include "../Spell.h"
#include "../Unit.h"
#include "../SpellAuras.h"
#include "../SharedDefines.h"
#include "Log.h"
#include "../GossipDef.h"
#include "../ArenaTeam.h"
#include "../MotionMaster.h"
#include "../BattleGroundMgr.h"


void PlayerbotAI::InitBotStatsForLevel(uint32 level, bool forced)
{
    if (forced)
    {
        m_bot->CombatStop();
        m_bot->CombatStopWithPets();
        for (uint32 i = 0; i < CURRENT_MAX_SPELL; ++i)
            m_bot->InterruptSpell(CurrentSpellTypes(i));
        m_bot->RemoveAllAttackers();
    }

    uint16 eDest;
    //if (m_bot->CanEquipNewItem(NULL_SLOT, eDest, 38/*Recruit's Shirt*/, true)!=EQUIP_ERR_OK)
    //    return;

    m_bot->GiveLevel(level);
    //m_bot->SpellUpdate(true);
    //m_bot->StuffUpdate();
    //m_bot->SetHealth(m_bot->GetMaxHealth());
    //m_bot->SetPower(m_bot->getPowerType(), m_bot->GetMaxPower(m_bot->getPowerType()));
    //GetClassAI()->InitSpells(m_bot->GetPlayerbotAI());
}