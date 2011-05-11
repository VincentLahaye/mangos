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

#include "PlayerbotPriestAI.h"

class PlayerbotAI;

PlayerbotPriestAI::PlayerbotPriestAI(Player* const bot, PlayerbotAI* const ai): PlayerbotClassAI(bot, ai)
{
    InitSpells(ai);
}

void PlayerbotPriestAI::InitSpells(PlayerbotAI* const ai)
{
    RENEW                         = ai->initSpell(RENEW_1);
    HEAL                          = ai->initSpell(HEAL_1);
    LESSER_HEAL                   = ai->initSpell(LESSER_HEAL_1);
    GREATER_HEAL                  = ai->initSpell(GREATER_HEAL_1);
    FLASH_HEAL                    = ai->initSpell(FLASH_HEAL_1);
    RESURRECTION                  = ai->initSpell(RESURRECTION_1);
    SMITE                         = ai->initSpell(SMITE_1);
    MANA_BURN                     = ai->initSpell(MANA_BURN_1);
    HOLY_NOVA                     = ai->initSpell(HOLY_NOVA_1);
    HOLY_FIRE                     = ai->initSpell(HOLY_FIRE_1);
    DESPERATE_PRAYER              = ai->initSpell(DESPERATE_PRAYER_1);
    PRAYER_OF_HEALING             = ai->initSpell(PRAYER_OF_HEALING_1);
    CIRCLE_OF_HEALING             = ai->initSpell(CIRCLE_OF_HEALING_1);
    BINDING_HEAL                  = ai->initSpell(BINDING_HEAL_1);
    PRAYER_OF_MENDING             = ai->initSpell(PRAYER_OF_MENDING_1);

    // SHADOW
    FADE                          = ai->initSpell(FADE_1);
    SHADOW_WORD_PAIN              = ai->initSpell(SHADOW_WORD_PAIN_1);
    MIND_BLAST                    = ai->initSpell(MIND_BLAST_1);
    SCREAM                        = ai->initSpell(PSYCHIC_SCREAM_1);
    MIND_FLAY                     = ai->initSpell(MIND_FLAY_1);
    DEVOURING_PLAGUE              = ai->initSpell(DEVOURING_PLAGUE_1);
    SHADOW_PROTECTION             = ai->initSpell(SHADOW_PROTECTION_1);
    VAMPIRIC_TOUCH                = ai->initSpell(VAMPIRIC_TOUCH_1);
    PRAYER_OF_SHADOW_PROTECTION   = ai->initSpell(PRAYER_OF_SHADOW_PROTECTION_1);
    SHADOWFIEND                   = ai->initSpell(SHADOWFIEND_1);
    MIND_SEAR                     = ai->initSpell(MIND_SEAR_1);
    SHADOWFORM                    = ai->initSpell(SHADOWFORM_1);
    VAMPIRIC_EMBRACE              = ai->initSpell(VAMPIRIC_EMBRACE_1);
    SHADOW_WORD_DEATH             = ai->initSpell(SHADOW_WORD_DEATH_1);

    // DISCIPLINE
    PENANCE                       = ai->initSpell(PENANCE_1);
    INNER_FIRE                    = ai->initSpell(INNER_FIRE_1);
    POWER_WORD_SHIELD             = ai->initSpell(POWER_WORD_SHIELD_1);
    POWER_WORD_FORTITUDE          = ai->initSpell(POWER_WORD_FORTITUDE_1);
    PRAYER_OF_FORTITUDE           = ai->initSpell(PRAYER_OF_FORTITUDE_1);
    FEAR_WARD                     = ai->initSpell(FEAR_WARD_1);
    DIVINE_SPIRIT                 = ai->initSpell(DIVINE_SPIRIT_1);
    PRAYER_OF_SPIRIT              = ai->initSpell(PRAYER_OF_SPIRIT_1);
    MASS_DISPEL                   = ai->initSpell(MASS_DISPEL_1);
    POWER_INFUSION                = ai->initSpell(POWER_INFUSION_1);
    INNER_FOCUS                   = ai->initSpell(INNER_FOCUS_1);

    RECENTLY_BANDAGED  = 11196; // first aid check

    // racial
    ARCANE_TORRENT                = ai->initSpell(ARCANE_TORRENT_MANA_CLASSES);
    GIFT_OF_THE_NAARU             = ai->initSpell(GIFT_OF_THE_NAARU_PRIEST); // draenei
    STONEFORM                     = ai->initSpell(STONEFORM_ALL); // dwarf
    EVERY_MAN_FOR_HIMSELF         = ai->initSpell(EVERY_MAN_FOR_HIMSELF_ALL); // human
    SHADOWMELD                    = ai->initSpell(SHADOWMELD_ALL);
    BERSERKING                    = ai->initSpell(BERSERKING_ALL); // troll
    WILL_OF_THE_FORSAKEN          = ai->initSpell(WILL_OF_THE_FORSAKEN_ALL); // undead
}

PlayerbotPriestAI::~PlayerbotPriestAI() {}

bool PlayerbotPriestAI::HealTarget(Unit* target)
{
    PlayerbotAI* ai = GetAI();
    Player *m_bot = GetPlayerBot();
    uint8 hp = target->GetHealth() * 100 / target->GetMaxHealth();

    if (target->isInCombat() && hp < 80 && !target->HasAura(WEAKENED_SOUL, EFFECT_INDEX_0) && !target->HasAura(POWER_WORD_SHIELD, EFFECT_INDEX_0) && ai->CastSpell(POWER_WORD_SHIELD, target))
        return true;
    
    if (hp < 15 && ai->CastSpell(CIRCLE_OF_HEALING, target))
        return true;
    else if (hp < 30 && ai->CastSpell(FLASH_HEAL, target))
        return true;
    else if (hp < 35 && ai->CastSpell(BINDING_HEAL, target))
        return true;
    else if (hp < 40 && ai->CastSpell(PRAYER_OF_HEALING, target))
        return true;
    else if (hp < 50 && ai->CastSpell(CIRCLE_OF_HEALING, target))
        return true;
    else if (hp < 60 && ai->CastSpell(GREATER_HEAL, target))
        return true;
    else if (hp < 80 && !target->HasAuraFromUnit(RENEW, m_bot) && ai->CastSpell(RENEW, target))
        return true;
    else
        return false;
} // end HealTarget

void PlayerbotPriestAI::DoNextCombatManeuver(Unit *pTarget)
{
    Unit* pVictim = pTarget->getVictim();
    PlayerbotAI* ai = GetAI();
    if (!ai)
        return;

    Player* m_master = ai->GetLeader();
    if (!m_master)
        return;

    Player *m_bot = GetPlayerBot();
    Group *m_group = m_bot->GetGroup();

    ai->SetInFront(pTarget);

    switch (m_bot->getRole())
    {
    case PriestHoly:
        if (m_group)
        {
            Group::MemberSlotList const& groupSlot = m_group->GetMemberSlots();
            for (Group::member_citerator itr = groupSlot.begin(); itr != groupSlot.end(); itr++)
            {
                Player *m_groupMember = sObjectMgr.GetPlayer(itr->guid);
                if (!m_groupMember || !m_groupMember->isAlive())
                    continue;

                uint32 memberHP = m_groupMember->GetHealth() * 100 / m_groupMember->GetMaxHealth();
                if (memberHP < 80 && HealTarget(m_groupMember))
                    return;
            }
        }
        break;

    case PriestDiscipline:
    case PriestShadow:
        static const uint32 SpellShadow[] = {SHADOW_WORD_PAIN, DEVOURING_PLAGUE, VAMPIRIC_TOUCH, MIND_BLAST, MIND_FLAY};
        static const uint32 elt = sizeof(SpellShadow)/sizeof(uint32); 
        char *SpellFirstTarget = "11110";
        char *SpellAllTargets = "10100";
        char *SpellLastTarget = "00001";
        uint32 numberTargets = 0;
        uint32 numberTargetsWithin5f = 0;

        for (Group::member_citerator itr = m_group->GetMemberSlots().begin(); itr != m_group->GetMemberSlots().end(); itr++)
        {
            for (Unit::AttackerSet::const_iterator itrt = sObjectMgr.GetPlayer(itr->guid)->getAttackers().begin(); itrt != sObjectMgr.GetPlayer(itr->guid)->getAttackers().end(); itrt++)
            {
                if ((*itrt)->IsWithinDist(m_bot, 36.0f))
                {
                    numberTargets++;
                    if ((*itrt)->GetHealthPercent() <= 35 && ai->CastSpell(SHADOW_WORD_DEATH, (*itrt)))
                        return;
                }
                if ((*itrt)->IsWithinDist(m_bot, 5.0f))
                    numberTargetsWithin5f++;
            }
        }

        for (uint32 i = 0; i < elt; ++i)
        {
            if (numberTargetsWithin5f >= 5 && !MIND_SEAR)
            {
                if (m_bot->HasAura(SHADOWFORM))
                    m_bot->RemoveAurasDueToSpell(SHADOWFORM);
                if (ai->CastSpell(HOLY_NOVA))
                    return;
            }

            if (!m_bot->HasAura(SHADOWFORM) && ai->SelfBuff(SHADOWFORM))
                return;

            /*if (numberTargets >= 5 && !pTarget->HasAuraFromUnit(MIND_SEAR, m_bot) && ai->CastSpell(MIND_SEAR, pTarget))
                return;*/ // Will Replace Loop when Mind Sear debug : stackable by different players
            if (numberTargets >= 5)
            {
                for (Group::member_citerator itr = m_group->GetMemberSlots().begin(); itr != m_group->GetMemberSlots().end(); itr++)
                {
                    for (Unit::AttackerSet::const_iterator itrt = sObjectMgr.GetPlayer(itr->guid)->getAttackers().begin(); itrt != sObjectMgr.GetPlayer(itr->guid)->getAttackers().end(); itrt++)
                    {  
                        if (!(*itrt)->HasAura(MIND_SEAR) && ai->CastSpell(MIND_SEAR, (*itrt)))
                            return;
                    }
                }
            }// This condition and Loops will be replaced when Mind Sear debug : stackable by differents players

            if (SpellFirstTarget[i] == '1' && !pTarget->HasAuraFromUnit(SpellShadow[i], m_bot) && ai->CastSpell(SpellShadow[i], pTarget))
                return;

            if (SpellAllTargets[i] == '1' && numberTargets > 1)
            {
                for (Group::member_citerator itr = m_group->GetMemberSlots().begin(); itr != m_group->GetMemberSlots().end(); itr++)
                {
                    for (Unit::AttackerSet::const_iterator itrt = sObjectMgr.GetPlayer(itr->guid)->getAttackers().begin(); itrt != sObjectMgr.GetPlayer(itr->guid)->getAttackers().end(); itrt++)
                    {  
                        if (!(*itrt)->HasAuraFromUnit(SpellShadow[i], m_bot) && ai->CastSpell(SpellShadow[i], (*itrt)))
                            return;
                    }
                }
            }

            if (SpellLastTarget[i] == '1' && !pTarget->HasAuraFromUnit(SpellShadow[i], m_bot) && ai->CastSpell(SpellShadow[i], pTarget)) // HasAuraFromUnit when Mind Flay debug : stackable by different players
                return;
        }
        break;
    }
} // end DoNextCombatManeuver

void PlayerbotPriestAI::DoNonCombatActions()
{
    PlayerbotAI *ai = GetAI();
    if (!ai)
        return;

    Player * m_bot = GetPlayerBot();
    if (!m_bot)
        return;

    Player* m_master = ai->GetLeader();
    if (!m_master)
        return;

    if (m_bot->getRole() != PriestHoly)
    {
        if (!m_bot->HasAura(SHADOWFORM) && ai->SelfBuff(SHADOWFORM))
            return;
        if (!m_bot->HasAura(VAMPIRIC_EMBRACE) && ai->SelfBuff(VAMPIRIC_EMBRACE))
            return;
    }

    static const uint32 MinorGlyphs[] = {58009, 58015, 58228};           // power word fortitude - shadow protection - ombrefiel
    static const uint32 ShadowMajorGlyphs[] = {55681, 55682, 55687};     // shadow word pain - shadow word death - mind flay
    static const uint32 HolyMajorGlyphs[] = {55674, 55672, 55680};       // renew - power word shield - prayer of healing

    for (uint32 i = 0; i < 3; i++)
    {
        if (!m_bot->HasSpell(MinorGlyphs[i]))
            m_bot->learnSpell(MinorGlyphs[i], true);

        if (m_bot->HasSpell(ShadowMajorGlyphs[i]) && m_bot->getRole() == PriestHoly)
            m_bot->removeSpell(ShadowMajorGlyphs[i]);

        if (m_bot->HasSpell(HolyMajorGlyphs[i]) && m_bot->getRole() != PriestHoly)
            m_bot->removeSpell(HolyMajorGlyphs[i]);

        if (!m_bot->HasSpell(ShadowMajorGlyphs[i]) && m_bot->getRole() != PriestHoly)
            m_bot->learnSpell(ShadowMajorGlyphs[i], true);

        if (!m_bot->HasSpell(HolyMajorGlyphs[i]) && m_bot->getRole() == PriestHoly)
            m_bot->learnSpell(HolyMajorGlyphs[i], true);
    }

    // selfbuff goes first
    if (ai->SelfBuff(INNER_FIRE))
        return;

    // mana check
    if (m_bot->getStandState() != UNIT_STAND_STATE_STAND)
        m_bot->SetStandState(UNIT_STAND_STATE_STAND);

    Item* pItem = ai->FindDrink();
    Item* fItem = ai->FindBandage();

    if (pItem != NULL && ai->GetManaPercent() < 30)
    {
        ai->UseItem(pItem);
        return;
    }

    // hp check
    if (m_bot->getStandState() != UNIT_STAND_STATE_STAND)
        m_bot->SetStandState(UNIT_STAND_STATE_STAND);

    pItem = ai->FindFood();

    if (pItem != NULL && ai->GetHealthPercent() < 30)
    {
        ai->UseItem(pItem);
        return;
    }
    else if (pItem == NULL && fItem != NULL && !m_bot->HasAura(RECENTLY_BANDAGED, EFFECT_INDEX_0) && ai->GetHealthPercent() < 70)
    {
        ai->UseItem(fItem);
        return;
    }

    // buff and heal master's group
    if (m_master->GetGroup())
    {
        // Buff master with group buffs
        if (m_master->isAlive())
        {
            if (PRAYER_OF_FORTITUDE && ai->HasSpellReagents(PRAYER_OF_FORTITUDE) && ai->Buff(PRAYER_OF_FORTITUDE, m_master))
                return;

            if (PRAYER_OF_SPIRIT && ai->HasSpellReagents(PRAYER_OF_SPIRIT) && ai->Buff(PRAYER_OF_SPIRIT, m_master))
                return;
        }

        Group::MemberSlotList const& groupSlot = m_master->GetGroup()->GetMemberSlots();
        for (Group::member_citerator itr = groupSlot.begin(); itr != groupSlot.end(); itr++)
        {
            Player *tPlayer = sObjectMgr.GetPlayer(itr->guid);
            if (!tPlayer || tPlayer == m_bot)
                continue;

            // first rezz em
            if (!tPlayer->isAlive())
            {
                if (ai->CastSpell(RESURRECTION, tPlayer))
                {
                    std::string msg = "Resurrecting ";
                    msg += tPlayer->GetName();
                    m_bot->Say(msg, LANG_UNIVERSAL);
                    return;
                }
                else
                    continue;
            }
            else
            {
                // buff and heal
                if (BuffPlayer(tPlayer))
                    return;

                if (HealTarget(tPlayer))
                    return;
            }
        }
    }
    else
    {
        if (m_master->isAlive())
        {
            if (BuffPlayer(m_master))
                return;
            if (HealTarget(m_master))
                return;
        }
        else
            ai->CastSpell(RESURRECTION, m_master);
    }

    BuffPlayer(m_bot);
} // end DoNonCombatActions

bool PlayerbotPriestAI::BuffPlayer(Player* target)
{
    PlayerbotAI * ai = GetAI();
    Pet * pet = target->GetPet();

    if (pet && pet->isAlive() && ai->Buff(POWER_WORD_FORTITUDE, pet))
        return true;

    if (target->isAlive() && ai->Buff(POWER_WORD_FORTITUDE, target))
        return true;

    if ((target->getClass() == CLASS_DRUID || target->getPowerType() == POWER_MANA) && target->isAlive() && ai->Buff(DIVINE_SPIRIT, target))
        return true;

    return false;
}
