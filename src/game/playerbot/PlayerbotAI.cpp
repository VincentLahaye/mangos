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
#include "../Channel.h"
#include "../ChannelMgr.h"

float rand_float(float low, float high)
{
    return (rand() / (static_cast<float> (RAND_MAX) + 1.0)) * (high - low) + low;
}

class PlayerbotChatHandler : protected ChatHandler
{
    public:
        explicit PlayerbotChatHandler(Player* pMasterPlayer) : ChatHandler(pMasterPlayer) {}
        void sysmessage(const char *str) { SendSysMessage(str); }
        bool dropQuest(char *str) { return HandleQuestRemoveCommand(str); }
		bool setInvisible(char *str) { return HandleGMVisibleCommand(str); }
};

PlayerbotAI::PlayerbotAI(PlayerbotMgr* const mgr, Player* const bot) : m_mgr(mgr), m_bot(bot)
{
    m_botState = BOTSTATE_NORMAL;

	if(m_bot){
		m_bot->GetPosition(orig_x, orig_y, orig_z);
		orig_map = m_bot->GetMapId();

		// Level aléatoire
		int randBotLevel = int((double(rand())/RAND_MAX)*30) + 10;
		InitBotStatsForLevel(randBotLevel);

		// Invibilité
		m_bot->SetBotGMVisible(false);

		// Sélection d'un endroit de TP correspondant au Level
		QueryResult *result = CharacterDatabase.PQuery("SELECT * FROM game_tele WHERE level = '%u' ORDER BY RAND() LIMIT 1", randBotLevel);
		if( result ){
			Field *fields = result->Fetch();

			// Définition : TeleportTo(map, X, Y, Z);
			m_bot->TeleportTo(fields[5].GetUInt32(), fields[1].GetFloat(), fields[2].GetFloat(), fields[3].GetFloat(), fields[4].GetFloat());
		}

		// Ajout du bot dans le chan world
		ChannelMgr* cMgr = channelMgr(m_bot->GetTeam());

		const char* new_channel_name_buf;
		new_channel_name_buf = "world";
		Channel* new_channel = cMgr->GetJoinChannel(new_channel_name_buf,m_bot->GetChannelNumber());

		new_channel->Join(m_bot->GetObjectGuid(),"");          // will output Changed Channel: N. Name
	}
}

PlayerbotAI::~PlayerbotAI(){}

void PlayerbotAI::UpdateAI(const uint32 p_time)
{
	return;
}

