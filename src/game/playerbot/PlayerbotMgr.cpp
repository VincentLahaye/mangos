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
#include "../Player.h"
#include "PlayerbotAI.h"
#include "PlayerbotMgr.h"
#include "WorldPacket.h"
#include "../Chat.h"
#include "../ObjectMgr.h"
#include "../GuildMgr.h"
#include "../GossipDef.h"
#include "../Chat.h"
#include "../Language.h"
#include "../Guild.h"
#include "../ArenaTeam.h"

class LoginQueryHolder;
class CharacterHandler;

PlayerbotMgr::PlayerbotMgr(){}

PlayerbotMgr::~PlayerbotMgr(){}

void PlayerbotMgr::UpdateAI(const uint32 p_time) {}

void PlayerbotMgr::HandleMasterOutgoingPacket(const WorldPacket& packet){}

void PlayerbotMgr::LogoutPlayerBot(ObjectGuid guid)
{
    Player* bot = GetPlayerBot(guid);
    if (bot)
    {
        for (uint8 i = 0; i < MAX_ARENA_SLOT; ++i)
        {
            uint32 a_id = bot->GetArenaTeamId(i);
            if (a_id==0)
                continue;
        }

        WorldSession * botWorldSessionPtr = bot->GetSession();
        botWorldSessionPtr->LogoutPlayer(true); // this will delete the bot Player object and PlayerbotAI object
        delete botWorldSessionPtr;  // finally delete the bot's WorldSession
    }
}

Player* PlayerbotMgr::GetPlayerBot(ObjectGuid playerGuid) const
{
    HashMapHolder < Player > ::MapType& m = sObjectAccessor.GetPlayers();
    for (HashMapHolder < Player > ::MapType::const_iterator itr = m.begin(); itr != m.end(); ++itr)
    {
        Player* const bot = itr->second;
        if (bot && bot->GetObjectGuid() == playerGuid)
            return bot;
    }
    return NULL;
}

void PlayerbotMgr::OnBotLogin(Player * const bot)
{
    PlayerbotAI* ai = bot->GetPlayerbotAI();
    if (!ai)
    {
        PlayerbotAI* ai = new PlayerbotAI(this, bot);
        if (ai)
            bot->SetPlayerbotAI(ai);
    }
    ai = bot->GetPlayerbotAI();
}
