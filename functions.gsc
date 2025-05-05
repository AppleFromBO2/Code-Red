spawnBots()
{
	if(!level.botsHaveBeenSpawned)
	{
		for (i = 0; i <= level.amountOfBotsToSpawn; i++) {
			spawnBot();
		}
		level.botsHaveBeenSpawned = true;
	}
}

spawnBot()
{
	maps/mp/bots/_bot::spawn_bot("autoassign");
}

drawValue(value, font, fontScale, x, y, color, alpha, glowColor, glowAlpha, sort, allclients)
{
	if (!isDefined(allclients))
		allclients = false;
	
	if (!allclients)
		hud = self createFontString(font, fontScale);
	else
		hud = level createServerFontString(font, fontScale);
    hud setValue(value);
    hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
	hud.glowColor = glowColor;
	hud.glowAlpha = glowAlpha;
    hud.sort = sort;
	hud.alpha = alpha;
	return hud;
}

drawText(text, font, fontScale, x, y, color, alpha, glowColor, glowAlpha, sort, allclients)
{
	if (!isDefined(allclients))
		allclients = false;
	
	if (!allclients)
		hud = self createFontString(font, fontScale);
	else
		hud = level createServerFontString(font, fontScale);
    hud setText(text);
    hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
	hud.glowColor = glowColor;
	hud.glowAlpha = glowAlpha;
	hud.sort = sort;
	hud.alpha = alpha;
    return hud;
}

drawShader(shader, x, y, width, height, color, alpha, sort, allclients)
{
	if (!isDefined(allclients))
		allclients = false;
	
	if (!allclients)
		hud = newClientHudElem(self);
	else
		hud = newHudElem();
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud.x = x;
    hud.y = y;
    return hud;
}

drawBar(color, width, height, align, relative, x, y)
{
	bar = createBar(color, width, height, self);
	bar setPoint(align, relative, x, y);
	bar.hideWhenInMenu = true;
	return bar;
}

welcomeMessage()
{
	notifyData = spawnstruct();
	notifyData.titleText = "Welcome " + self.name + " To ^1Zombieland";
	notifyData.notifyText = "Made By ^5Shark ^7Edited by ^5iAmCrystal";
	notifyData.glowColor = (0.3, 0.6, 0.3); 
	notifyData.duration = 8; 
	notifyData.font = "objective"; 
	notifyData.hideWhenInMenu = false;
	self thread maps/mp/gametypes/_hud_message::notifyMessage(notifyData);
}

SendError(errortype)
{
	if (errortype == "MoreMoney")
		self iPrintln("^1Error: ^7You Do Not Have Enough Money For This Item");
	if (errortype == "InvalidWeaponAttachment")
		self iPrintln("^1Error: ^7You Cannot Put This Attachment On This Weapon");
	if (errortype == "InvalidWeapon")
		self iPrintln("^1Error: ^7You Are Holding An Invalid Weapon");
	if (errortype == "AlreadyHasWeapon")
		self iPrintln("^1Error: ^7You Already Own This Weapon");
	if (errortype == "AlreadyHasAttachment")
		self iPrintln("^1Error: ^7You Already Have This Attachment");
	if (errortype == "MaxAmmo")
		self iPrintln("^1Error: ^7You Already Maximum Ammo For This Weapon");
	if (errortype == "AlreadyHasUAV")
		self iPrintln("^1Error: ^7You Already Have A UAV");
	if (errortype == "MaxTurrets")
		self iPrintln("^1Error: ^7Max Number of Turrets Reached!");
	if (errortype == "AlreadyHaveEquipment")
		self iPrintln("^1Error: ^7You Already Have This Equipment");
	if (errortype == "HasPerk")
		self iPrintln("^1Error: ^7You Already Have This Perk");
	if (errortype == "AlreadyInvisible")
		self iPrintln("^1Error: ^7You Are Already Invisible");
	if (errortype == "AlreadySlowedHumans")
		self iPrintln("^1Error: ^7Humans Have Already Been Slowed");
	if (errortype == "AlreadyHasInfrared")
		self iPrintln("^1Error: ^7You Already Have Infrared Vision");
	if (errortype == "AlreadyHasInfiniteAmmo")
		self iPrintln("^1Error: ^7You Already Have Infinite Ammo");
}

givePlayerWeapon(weapon)
{		
	self GiveWeapon(weapon);
	ammo = weaponClipSize(weapon);
	self GiveStartAmmo(weapon);
	self setWeaponAmmoClip(weapon, ammo);
	self SwitchToWeapon(weapon); 
}

locationSelector()
{
	self endon("disconnect");
	self endon("death");

	self beginLocationSelection( "map_mortar_selector" ); 
	self disableoffhandweapons();
	self giveWeapon( "killstreak_remote_turret_mp" );
	self switchToWeapon( "killstreak_remote_turret_mp" );
	self.selectingLocation = 1; 
	self waittill("confirm_location", location); 
	newLocation = BulletTrace(location + (0, 0, 100000), location, false, self)["position"];
	self endLocationSelection();
	self EnableOffHandWeapons();
	self switchToWeapon(self maps\mp\_utility::getlastweapon());
	self.selectingLocation = undefined;
	return newLocation;
}

itemPriceSetup()
{
	level.itemPrice["Human"]["General"]["UAV"] = 250;
	level.itemPrice["Human"]["General"]["Health"] = 150;
	level.itemPrice["Human"]["General"]["Infrared"] = 10;
	level.itemPrice["Human"]["General"]["RandomCamo"] = 100;
	level.itemPrice["Human"]["General"]["RandomDLCCamo"] = 100;
	level.itemPrice["Human"]["General"]["Jericho"] = 500;
    level.itemPrice["Human"]["General"]["Slots"] = 100;
    level.itemPrice["Human"]["General"]["Teleport"] = 1500;
    level.itemPrice["Human"]["General"]["SSJ2"] = 3500;
    level.itemPrice["Human"]["General"]["ESP"] = 5000;
	
	level.itemPrice["Zombie"]["General"]["UAV"] = 500;
	level.itemPrice["Zombie"]["General"]["Health"] = 150;
	level.itemPrice["Zombie"]["General"]["Invisible"] = 450;
	level.itemPrice["Zombie"]["General"]["SlowHumans"] = 500;
	level.itemPrice["Zombie"]["General"]["Infrared"] = 10;
	level.itemPrice["Zombie"]["General"]["2XSPD"] = 500;
	level.itemPrice["Zombie"]["General"]["ZombieBomber"] = 1000;
	level.itemPrice["Zombie"]["General"]["ZombieEMP"] = 500 ;
	level.itemPrice["Zombie"]["General"]["RiotZombie"] = 400;
	level.itemPrice["Zombie"]["General"]["riotman"] = 1000;
	level.itemPrice["Zombie"]["General"]["Devil"] = 2500;
	level.itemPrice["Zombie"]["General"]["ZKing"] = 1500;
	level.itemPrice["Zombie"]["General"]["Fat"] = 1500;
	
	level.itemPrice["Human"]["Equipment"]["claymore_mp"] = 60;
	level.itemPrice["Human"]["Equipment"]["sticky_grenade_mp"] = 50;
	level.itemPrice["Human"]["Equipment"]["frag_grenade_mp"] = 50;
	level.itemPrice["Human"]["Equipment"]["satchel_charge_mp"] = 90;
	level.itemPrice["Human"]["Equipment"]["proximity_grenade_mp"] = 30;
	level.itemPrice["Human"]["Equipment"]["concussion_grenade_mp"] = 40;
	level.itemPrice["Human"]["Equipment"]["claymore_mp"] = 60;
	level.itemPrice["Human"]["Equipment"]["mw3ims"] = 2500;
	
	level.itemPrice["Zombie"]["Equipment"]["hatchet_mp"] = 70;
	level.itemPrice["Zombie"]["Equipment"]["emp_grenade_mp"] = 120;
    level.itemPrice["Zombie"]["Equipment"]["Nova"] = 1000;
	
	level.itemPrice["Human"]["Perks"]["specialty_fallheight"] = 20;
	level.itemPrice["Human"]["Perks"]["specialty_fastads"] = 10;
	level.itemPrice["Human"]["Perks"]["specialty_unlimitedsprint"] = 20;
	level.itemPrice["Human"]["Perks"]["specialty_fastweaponswitch"] = 30;
	level.itemPrice["Human"]["Perks"]["specialty_loudenemies"] = 10;
	level.itemPrice["Human"]["Perks"]["specialty_fastmantle"] = 20;
	level.itemPrice["Human"]["Perks"]["specialty_movefaster"] = 30;
	level.itemPrice["Human"]["Perks"]["specialty_fastreload"] = 30;
	level.itemPrice["Human"]["Perks"]["allperks"] = 350;
	
    level.itemPrice["Human"]["Weapons"]["Ammo"] = 50;
	level.itemPrice["Human"]["Weapons"]["unlimitedammowithreload"] = 600;
	level.itemPrice["Human"]["Weapons"]["unlimitedammonoreload"] = 1500;
	level.itemPrice["Human"]["Weapons"]["Submachine"] = 200;
	level.itemPrice["Human"]["Weapons"]["Assault"] = 400;
	level.itemPrice["Human"]["Weapons"]["Shotguns"] = 350;
	level.itemPrice["Human"]["Weapons"]["Lightmachine"] = 400;
	level.itemPrice["Human"]["Weapons"]["Snipers"] = 260;
	level.itemPrice["Human"]["Weapons"]["Pistols"] = 270;
	level.itemPrice["Human"]["Weapons"]["Launchers"] = 350;
	level.itemPrice["Human"]["Weapons"]["Specials"] = 400;
	level.itemPrice["Human"]["Weapons"]["SuperSpecials"] = 800;
    level.itemPrice["Human"]["Weapons"]["AlienGuns"] = 10000;
	level.itemPrice["Human"]["Weapons"]["Equipment"] = 1000;
	
	level.itemPrice["Human"]["Attachments"]["fmj"] = 120; //FMJ
	level.itemPrice["Human"]["Attachments"]["dw"] = 120; //Dual Wield (_dw_mp)
	level.itemPrice["Human"]["Attachments"]["silencer"] = 100; //Suppressor
	level.itemPrice["Human"]["Attachments"]["dualclip"] = 80; //Fast Mag
	level.itemPrice["Human"]["Attachments"]["extclip"] = 90; //Extended Clip
	level.itemPrice["Human"]["Attachments"]["extbarrel"] = 90; //Long Barrel
	level.itemPrice["Human"]["Attachments"]["reflex"] = 30; //Reflex Sight
	level.itemPrice["Human"]["Attachments"]["ir"] = 50; //Dual Band
	level.itemPrice["Human"]["Attachments"]["rf"] = 120; //Rapid Fire
	level.itemPrice["Human"]["Attachments"]["rangefinder"] = 90; //Target Finder
	level.itemPrice["Human"]["Attachments"]["acog"] = 30; //ACOG Sight
		
	level.itemPrice["Human"]["Super"]["GodMode"] = 2500;
	level.itemPrice["Human"]["Super"]["humantorch"] = 5000;
	level.itemPrice["Human"]["Super"]["aimbotfair"] = 7500;
    level.itemPrice["Human"]["Super"]["aimbotunfair"] = 10000;
    level.itemPrice["Human"]["Super"]["PaP"] = 10000;
    level.itemPrice["Human"]["Super"]["JetPack"] = 2500;
    level.itemPrice["Human"]["Super"]["MW2Nuke"] = 25000;
    level.itemPrice["Human"]["Super"]["ECV2"] = 5000;
    level.itemPrice["Human"]["Super"]["ss"] = 5000;
}

invisible(time)
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["Invisible"])
	{
		if (!isDefined(self.isInvisible))
		{
			self endon("disconnect");
			self endon("endInvisible");
			
			self.invisibleTime = time;
			self.money -= level.itemPrice["Zombie"]["General"]["Invisible"];
			self iPrintln("You Are Now ^2Invisible ^7For " + time + " Seconds");
			for (;;)
			{
				if (self.invisibleTime != 0)
				{
					self.isInvisible = true;
					self hide();
					wait 1;
					self.invisibleTime -= 1;
				}
				else
				{
					self show();
					self iPrintln("You Are ^1No Longer ^7Invisible");
					self.isInvisible = undefined;
					self notify("endInvisible");
				}
				wait 0.01;
			}
		}
		else
			self SendError("AlreadyInvisible");
	}
	else
		self SendError("MoreMoney");
}

getPlayerName(player)
{
	playerName = getSubStr(player.name, 0, player.name.size);
	for(i=0; i < playerName.size; i++)
	{
		if(playerName[i] == "]")
			break;
	}
	if(playerName.size != i)
		playerName = getSubStr(playerName, i + 1, playerName.size);
	return playerName;
}

ReturnAttachmentArray(category)
{
	level.AttachmentArray["Submachine"][0] = "reflex"; //Reflex Sight
	level.AttachmentArray["Submachine"][1] = "steadyaim"; //Laser
	level.AttachmentArray["Submachine"][2] = "silencer"; //Suppressor
	level.AttachmentArray["Submachine"][3] = "dualclip"; //Fast Mag
	level.AttachmentArray["Submachine"][4] = "holo"; //EOTech
	level.AttachmentArray["Submachine"][5] = "grip"; //Fore Grip
	level.AttachmentArray["Submachine"][6] = "fastads"; //Quickdraw
	level.AttachmentArray["Submachine"][7] = "fmj"; //FMJ
	level.AttachmentArray["Submachine"][8] = "extbarrel"; //Long Barrel
	level.AttachmentArray["Submachine"][9] = "rangefinder"; //Target Finder
	level.AttachmentArray["Submachine"][10] = "stalker"; //Stock
	level.AttachmentArray["Submachine"][11] = "extclip"; //Extended Clip
	level.AttachmentArray["Submachine"][12] = "sf"; //Select Fire
	level.AttachmentArray["Submachine"][13] = "rf"; //Rapid Fire
	level.AttachmentArray["Submachine"][14] = "mms"; //MMS
	
	level.AttachmentArray["Assault"][0] = "reflex"; //Reflex Sight
	level.AttachmentArray["Assault"][1] = "fastads"; //Laser
	level.AttachmentArray["Assault"][2] = "dualclip"; //Fast Mag
	level.AttachmentArray["Assault"][3] = "acog"; //ACOG
	level.AttachmentArray["Assault"][4] = "grip"; //Grip
	level.AttachmentArray["Assault"][5] = "stalker"; //Stock
	level.AttachmentArray["Assault"][6] = "rangefinder"; //Target Finder
	level.AttachmentArray["Assault"][7] = "steadyaim"; //Laser
	level.AttachmentArray["Assault"][8] = "sf"; //Select Fire
	level.AttachmentArray["Assault"][9] = "holo"; //EOTech
	level.AttachmentArray["Assault"][10] = "silencer"; //Suppressor
	level.AttachmentArray["Assault"][11] = "fmj"; //FMJ
	level.AttachmentArray["Assault"][12] = "dualoptic"; //Hybrid Optic
	level.AttachmentArray["Assault"][13] = "extclip"; //Extended Clip
	level.AttachmentArray["Assault"][14] = "gl"; //Grenade Launcher
	level.AttachmentArray["Assault"][15] = "mms"; //MMS
	
	level.AttachmentArray["Shotguns"][0] = "reflex"; //Reflex Sight
	level.AttachmentArray["Shotguns"][1] = "extbarrel"; //Long Barrel
	level.AttachmentArray["Shotguns"][2] = "dualclip"; //Fast Mag
	level.AttachmentArray["Shotguns"][3] = "steadyaim"; //Laser
	level.AttachmentArray["Shotguns"][4] = "stalker"; //Stock
	level.AttachmentArray["Shotguns"][5] = "silencer"; //Suppressor
	level.AttachmentArray["Shotguns"][6] = "extclip"; //Extended Clip
	level.AttachmentArray["Shotguns"][7] = "fastads"; //Quickdraw
	level.AttachmentArray["Shotguns"][8] = "mms"; //MMS
	
	level.AttachmentArray["Lightmachine"][0] = "holo"; //EOTech
	level.AttachmentArray["Lightmachine"][1] = "grip"; //Fore Grip
	level.AttachmentArray["Lightmachine"][2] = "fmj"; //FMJ
	level.AttachmentArray["Lightmachine"][3] = "reflex"; //Reflex Sight
	level.AttachmentArray["Lightmachine"][4] = "fastads"; //Quickdraw
	level.AttachmentArray["Lightmachine"][5] = "rangefinder"; //Target Finder
	level.AttachmentArray["Lightmachine"][6] = "stalker"; //Stock
	level.AttachmentArray["Lightmachine"][7] = "acog"; //ACOG
	level.AttachmentArray["Lightmachine"][8] = "steadyaim"; //Laser
	level.AttachmentArray["Lightmachine"][9] = "silencer"; //Suppressor
	level.AttachmentArray["Lightmachine"][10] = "vzoom"; //Variable Zoom
	level.AttachmentArray["Lightmachine"][11] = "extclip"; //Extended Clip
	level.AttachmentArray["Lightmachine"][12] = "dualoptic"; //Hybrid Optic
	level.AttachmentArray["Lightmachine"][13] = "rf"; //Rapid Fire
	level.AttachmentArray["Lightmachine"][14] = "ir"; //Dual Band
	
	level.AttachmentArray["Snipers"][0] = "silencer"; //Suppressor
	level.AttachmentArray["Snipers"][1] = "swayreduc"; //Ballistics CPU
	level.AttachmentArray["Snipers"][2] = "vzoom"; //Variable Zoom
	level.AttachmentArray["Snipers"][3] = "dualclip"; //Fast Mag
	level.AttachmentArray["Snipers"][4] = "fmj"; //FMJ
	level.AttachmentArray["Snipers"][5] = "acog"; //ACOG
	level.AttachmentArray["Snipers"][6] = "extclip"; //Extended Clip
	level.AttachmentArray["Snipers"][7] = "steadyaim"; //Laser
	level.AttachmentArray["Snipers"][8] = "ir"; //Dual Band
	
	level.AttachmentArray["Pistols"][0] = "reflex"; //Reflex
	level.AttachmentArray["Pistols"][1] = "extclip"; //Extended Clip
	level.AttachmentArray["Pistols"][2] = "steadyaim"; //Laser
	level.AttachmentArray["Pistols"][3] = "extbarrel"; //Long Barrel
	level.AttachmentArray["Pistols"][4] = "fmj"; //FMJ
	level.AttachmentArray["Pistols"][5] = "dualclip"; //Fast Mag
	level.AttachmentArray["Pistols"][6] = "silencer"; //Suppressor
	level.AttachmentArray["Pistols"][7] = "tacknife"; //Tactical Knife
	level.AttachmentArray["Pistols"][8] = "dw"; //Dual Wield (_dw_mp)
	
	level.AttachmentArray["Specials"][0] = "reflex"; //Reflex Sight
	level.AttachmentArray["Specials"][1] = "acog"; //ACOG
	level.AttachmentArray["Specials"][2] = "ir"; //Dual Band
	level.AttachmentArray["Specials"][3] = "vzoom"; //Variable Zoom
	level.AttachmentArray["Specials"][4] = "stackfire"; //Tri-Bolt
	
	level.AttachmentArray["All"][0] = "acog"; //ACOG
	level.AttachmentArray["All"][1] = "defaultattachment"; //Nothing
	level.AttachmentArray["All"][2] = "dualclip"; //Fast Mag
	level.AttachmentArray["All"][3] = "dualoptic"; //Hybrid Optic
	level.AttachmentArray["All"][4] = "dw"; //Dual Wierd (_dw_mp)
	level.AttachmentArray["All"][5] = "extbarrel"; //Long Barrel
	level.AttachmentArray["All"][6] = "extclip"; //Extended Clip
	level.AttachmentArray["All"][7] = "fastads"; //Quickdraw
	level.AttachmentArray["All"][8] = "fmj"; //FMJ
	level.AttachmentArray["All"][9] = "gl"; //Grenade Launcher
	level.AttachmentArray["All"][10] = "grip"; //Fore Grip
	level.AttachmentArray["All"][11] = "holo"; //EOTech
	level.AttachmentArray["All"][12] = "ir"; //Dual Band
	level.AttachmentArray["All"][13] = "is"; //?
	level.AttachmentArray["All"][14] = "mms"; //MMS
	level.AttachmentArray["All"][15] = "rangefinder"; //Target Finder
	level.AttachmentArray["All"][16] = "reflex"; //Reflex Sight
	level.AttachmentArray["All"][17] = "rf"; //Rapid Fire
	level.AttachmentArray["All"][18] = "sf"; //Select Fire
	level.AttachmentArray["All"][19] = "silencer"; //Suppressor
	level.AttachmentArray["All"][20] = "stackfire"; //Tri-Bolt
	level.AttachmentArray["All"][21] = "stalker"; //Stock
	level.AttachmentArray["All"][22] = "steadyaim"; //Laser
	level.AttachmentArray["All"][23] = "swayreduc"; //Ballistics CPU
	level.AttachmentArray["All"][24] = "tacknife"; //Tactical Knife
	level.AttachmentArray["All"][25] = "vzoom"; //Variable Zoom
	
	if (category == "Submachine")
		return level.AttachmentArray["Submachine"];
	if (category == "Assault")
		return level.AttachmentArray["Assault"];
	if (category == "Shotguns")
		return level.AttachmentArray["Shotguns"];
	if (category == "Lightmachine")
		return level.AttachmentArray["Lightmachine"];
	if (category == "Snipers")
		return level.AttachmentArray["Snipers"];
	if (category == "Pistols")
		return level.AttachmentArray["Pistols"];
	if (category == "Specials")
		return level.AttachmentArray["Specials"];
	if (category == "All")
		return level.AttachmentArray["All"];
}

ReturnWeaponArray(category)
{
	level.WeaponArray["Submachine"][0] = "mp7_mp";
	level.WeaponArray["Submachine"][1] = "pdw57_mp";
	level.WeaponArray["Submachine"][2] = "vector_mp";
	level.WeaponArray["Submachine"][3] = "insas_mp";
	level.WeaponArray["Submachine"][4] = "qcw05_mp";
	level.WeaponArray["Submachine"][5] = "evoskorpion_mp";
	level.WeaponArray["Submachine"][6] = "peacekeeper_mp";
	
	level.WeaponArray["Assault"][0] = "tar21_mp";
	level.WeaponArray["Assault"][1] = "type95_mp";
	level.WeaponArray["Assault"][2] = "sig556_mp";
	level.WeaponArray["Assault"][3] = "sa58_mp";
	level.WeaponArray["Assault"][4] = "hk416_mp";
	level.WeaponArray["Assault"][5] = "scar_mp";
	level.WeaponArray["Assault"][6] = "saritch_mp";
	level.WeaponArray["Assault"][7] = "xm8_mp";
	level.WeaponArray["Assault"][8] = "an94_mp";
	
	level.WeaponArray["Shotguns"][0] = "870mcs_mp";
	level.WeaponArray["Shotguns"][1] = "saiga12_mp";
	level.WeaponArray["Shotguns"][2] = "ksg_mp";
	level.WeaponArray["Shotguns"][3] = "srm1216_mp";
	
	level.WeaponArray["Lightmachine"][0] = "mk48_mp";
	level.WeaponArray["Lightmachine"][1] = "qbb95_mp";
	level.WeaponArray["Lightmachine"][2] = "lsat_mp";
	level.WeaponArray["Lightmachine"][3] = "hamr_mp";
	
	level.WeaponArray["Snipers"][0] = "svu_mp";
	level.WeaponArray["Snipers"][1] = "dsr50_mp";
	level.WeaponArray["Snipers"][2] = "ballista_mp";
	level.WeaponArray["Snipers"][3] = "as50_mp";
	
	level.WeaponArray["Pistols"][0] = "fiveseven_mp";
	level.WeaponArray["Pistols"][1] = "fnp45_mp";
	level.WeaponArray["Pistols"][2] = "beretta93r_mp";
	level.WeaponArray["Pistols"][3] = "judge_mp";
	level.WeaponArray["Pistols"][4] = "kard_mp";
	
	level.WeaponArray["Launchers"][0] = "smaw_mp";
	level.WeaponArray["Launchers"][1] = "usrpg_mp";
	level.WeaponArray["Launchers"][2] = "fhj18_mp";
	
	level.WeaponArray["SuperSpecials"][0] = "minigun_wager_mp";
	level.WeaponArray["SuperSpecials"][1] = "m32_wager_mp";
	
	level.WeaponArray["AlienGuns"][0] = "::initRaygun";
	level.WeaponArray["AlienGuns"][1] = "::initRaygunM2";
    level.WeaponArray["AlienGuns"][2] = "::toggle_lightGun";
	level.WeaponArray["AlienGuns"][3] = "::ToggleMustangGun";
	level.WeaponArray["AlienGuns"][4] = "::ToggleZVX1337";
	level.WeaponArray["AlienGuns"][5] = "::hatchetExecutioner";
	level.WeaponArray["AlienGuns"][6] = "::ThunGun";
	level.WeaponArray["AlienGuns"][7] = "::ToggleDragonGun";
	level.WeaponArray["AlienGuns"][8] = "::dosupermagnum";
	level.WeaponArray["AlienGuns"][9] = "::doSwarmMiniGun";
	level.WeaponArray["AlienGuns"][10] = "::doDF";
	level.WeaponArray["AlienGuns"][11] = "::doBloodGun";
	level.WeaponArray["AlienGuns"][12] = "::doM3";
	level.WeaponArray["AlienGuns"][13] = "::doM4";
	level.WeaponArray["AlienGuns"][14] = "::doRM";
	level.WeaponArray["AlienGuns"][15] = "::doBK";
	level.WeaponArray["AlienGuns"][16] = "::doRambo";
	
	level.WeaponArray["Specials"][2] = "riotshield_mp";
	level.WeaponArray["Specials"][3] = "crossbow_mp";
	level.WeaponArray["Specials"][4] = "minigun_mp";
	level.WeaponArray["Specials"][5] = "knife_ballistic_mp";
	
	level.WeaponArray["Lethals"][0] = "frag_grenade_mp";
	level.WeaponArray["Lethals"][1] = "sticky_grenade_mp";
	level.WeaponArray["Lethals"][2] = "hatchet_mp";
	level.WeaponArray["Lethals"][3] = "bouncingbetty_mp";
	level.WeaponArray["Lethals"][4] = "satchet_charge_mp";
	level.WeaponArray["Lethals"][5] = "claymore_mp";
	
	level.WeaponArray["Tacticals"][0] = "concussion_grenade_mp";
	level.WeaponArray["Tacticals"][1] = "willy_pete_mp";
	level.WeaponArray["Tacticals"][2] = "sensor_grenade_mp";
	level.WeaponArray["Tacticals"][3] = "emp_grenade_mp";
	level.WeaponArray["Tacticals"][4] = "proximity_grenade_mp";
	level.WeaponArray["Tacticals"][5] = "pda_hack_mp";
	level.WeaponArray["Tacticals"][6] = "flash_grenade_mp";
	level.WeaponArray["Tacticals"][7] = "trophy_system_mp";
	level.WeaponArray["Tacticals"][8] = "tactical_insertion_mp";
	
	level.WeaponArray["All"][0] = "mp7_mp";
	level.WeaponArray["All"][1] = "pdw57_mp";
	level.WeaponArray["All"][2] = "vector_mp";
	level.WeaponArray["All"][3] = "insas_mp";
	level.WeaponArray["All"][4] = "qcw05_mp";
	level.WeaponArray["All"][5] = "evoskorpion_mp";
	level.WeaponArray["All"][6] = "peacekeeper_mp";
	level.WeaponArray["All"][7] = "tar21_mp";
	level.WeaponArray["All"][8] = "type95_mp";
	level.WeaponArray["All"][9] = "sig556_mp";
	level.WeaponArray["All"][10] = "sa58_mp";
	level.WeaponArray["All"][11] = "hk416_mp";
	level.WeaponArray["All"][12] = "scar_mp";
	level.WeaponArray["All"][13] = "saritch_mp";
	level.WeaponArray["All"][14] = "xm8_mp";
	level.WeaponArray["All"][15] = "an94_mp";
	level.WeaponArray["All"][16] = "870mcs_mp";
	level.WeaponArray["All"][17] = "saiga12_mp";
	level.WeaponArray["All"][18] = "ksg_mp";
	level.WeaponArray["All"][19] = "srm1216_mp";
	level.WeaponArray["All"][20] = "mk48_mp";
	level.WeaponArray["All"][21] = "qbb95_mp";
	level.WeaponArray["All"][22] = "lsat_mp";
	level.WeaponArray["All"][23] = "hamr_mp";
	level.WeaponArray["All"][24] = "svu_mp";
	level.WeaponArray["All"][25] = "dsr50_mp";
	level.WeaponArray["All"][26] = "ballista_mp";
	level.WeaponArray["All"][27] = "as50_mp";
	level.WeaponArray["All"][28] = "fiveseven_mp";
	level.WeaponArray["All"][29] = "fnp45_mp";
	level.WeaponArray["All"][30] = "beretta93r_mp";
	level.WeaponArray["All"][31] = "judge_mp";
	level.WeaponArray["All"][32] = "kard_mp";
	level.WeaponArray["All"][33] = "smaw_mp";
	level.WeaponArray["All"][34] = "usrpg_mp";
	level.WeaponArray["All"][35] = "fhj18_mp";
	level.WeaponArray["All"][36] = "minigun_wager_mp";
	level.WeaponArray["All"][37] = "m32_wager_mp";
	level.WeaponArray["All"][38] = "riotshield_mp";
	level.WeaponArray["All"][39] = "crossbow_mp";
	level.WeaponArray["All"][40] = "knife_ballistic_mp";
	level.WeaponArray["All"][41] = "knife_held_mp";
	level.WeaponArray["All"][42] = "::initRaygun";
	level.WeaponArray["All"][43] = "::initRaygunM2";
    level.WeaponArray["All"][44] = "::toggle_lightGun";
	level.WeaponArray["All"][45] = "::ToggleMustangGun";
	level.WeaponArray["All"][46] = "::ToggleZVX1337";
	level.WeaponArray["All"][47] = "::hatchetExecutioner";
	level.WeaponArray["All"][48] = "ThunGun";
	level.WeaponArray["All"][49] = "ToggleDragonGun";
	level.WeaponArray["All"][50] = "dosupermagnum";
	level.WeaponArray["All"][51] = "doSwarmMiniGun";
	level.WeaponArray["All"][52] = "doDF";
	level.WeaponArray["All"][53] = "doBloodGun";
	level.WeaponArray["All"][54] = "doM3";
	level.WeaponArray["All"][55] = "doM4";
	level.WeaponArray["All"][56] = "doRM";
	level.WeaponArray["All"][57] = "doBK";
	level.WeaponArray["All"][58] = "doRambo";
		
    if (category == "Submachine")
		return level.WeaponArray["Submachine"];
	if (category == "Assault")
		return level.WeaponArray["Assault"];
	if (category == "Shotguns")
		return level.WeaponArray["Shotguns"];
	if (category == "Lightmachine")
		return level.WeaponArray["Lightmachine"];
	if (category == "Snipers")
		return level.WeaponArray["Snipers"];
	if (category == "Pistols")
		return level.WeaponArray["Pistols"];
	if (category == "Launchers")
		return level.WeaponArray["Launchers"];
	if (category == "Specials")
		return level.WeaponArray["Specials"];
	if (category == "SuperSpecials")
		return level.WeaponArray["SuperSpecials"];
    if (category == "AlienGuns")
        return level.WeaponArray["AlienGuns"];
	if (category == "Lethals")
		return level.WeaponArray["Lethals"];
	if (category == "Tacticals")
		return level.WeaponArray["Tacticals"];
	if (category == "All")
		return level.WeaponArray["All"];
}

giveSpawnWeapons(status)
{
	self ClearPerks();
	self takeAllWeapons();
	
	self SetActionSlot(1, "");
	self SetActionSlot(2, "");
	self SetActionSlot(3, "");
	self SetActionSlot(4, "");
	
	level.playerspawnweapon = "fiveseven_mp";
	
	if (status == "human")
	{
		self.spawnWeapons[0] = level.playerspawnweapon; //Primary
		self.spawnWeapons[1] = "knife_held_mp"; //Secondary
		self.spawnWeapons[2] = ""; //Lethal
		self.spawnWeapons[3] = ""; //Tacitcal
		self.spawnWeapons[4] = "knife_mp"; //Extra
		
		self.primaryWeapon = self.spawnWeapons[0];
		self.secondaryWeapon = self.spawnWeapons[1];
	}
	if (status == "zombie")
    {
		self.spawnWeapons[0] = "knife_held_mp"; //Primary
		self.spawnWeapons[1] = ""; //Secondary
		self.spawnWeapons[2] = ""; //Lethal
		self.spawnWeapons[3] = "tactical_insertion_mp"; //Tactical
		
	    self setPerk("specialty_fastmantle");
   		self setPerk("specialty_fastmeleerecovery");
	    self setPerk("specialty_fastladderclimb");
	    self setPerk("specialty_fallheight");
	    self setPerk("specialty_fastequipmentuse");
	    self setPerk("specialty_fasttoss");
	    self setPerk("specialty_movefaster");
		self setPerk("specialty_unlimitedsprint");
	    self setPerk("specialty_quieter");
	}
	
	for (i = 0; i < 5; i++)
	{
		if (isDefined(self.spawnWeapons[i]))
		{
			self GiveWeapon(self.spawnWeapons[i]);
			self setWeaponAmmoClip(self.spawnWeapons[i], weaponClipSize(self.spawnWeapons[i]));
			self GiveStartAmmo(self.spawnWeapons[i]);
			self SwitchToWeapon(self.spawnWeapons[0]); 
		}
		wait 0.05;
	}
}

isValidWeapon(WeaponRef)
{
	if (StrTok(WeaponRef, "_")[1] != "dw")
		WeaponRef = StrTok(WeaponRef, "+")[0];
	else
		WeaponRef = StrTok(WeaponRef, "_")[0] + "_mp";
	self.validReturn = WeaponRef;
		
	self.TempWeaponArray = ReturnWeaponArray("All");
	for (i = 0; i < self.TempWeaponArray.size; i++)
	{
		if (self.TempWeaponArray[i] == WeaponRef)
		{	
			return true;
		}
	}
	return false;
}

isValidAttachment(WeaponRef, AttachmentRef)
{
	if (StrTok(WeaponRef, "_")[1] != "dw")
		WeaponRef = StrTok(WeaponRef, "+")[0];
	else
		WeaponRef = StrTok(WeaponRef, "_")[0] + "_mp";
	self.validReturn = WeaponRef;

	self.SubmachineGuns = ReturnWeaponArray("Submachine");
	self.AssaultGuns = ReturnWeaponArray("Assault");
	self.Shotguns = ReturnWeaponArray("Shotguns");
	self.LightmachineGuns = ReturnWeaponArray("Lightmachine");
	self.Snipers = ReturnWeaponArray("Snipers");
	self.Pistols = ReturnWeaponArray("Pistols");
	self.WeaponCategory = undefined;
	self.AttachmentList = undefined;
	
	for (a = 0; a < self.SubmachineGuns.size; a++)
	{
		if (self.SubmachineGuns[a] == WeaponRef)
		{	
			self.WeaponCategory = "Submachine";
		}
	}
	for (b = 0; b < self.AssaultGuns.size; b++)
	{
		if (self.AssaultGuns[b] == WeaponRef)
		{	
			self.WeaponCategory = "Assault";
		}
	}
	for (c = 0; c < self.Shotguns.size; c++)
	{
		if (self.Shotguns[c] == WeaponRef)
		{	
			self.WeaponCategory = "Shotguns";
		}
	}
	for (d = 0; d < self.LightmachineGuns.size; d++)
	{
		if (self.LightmachineGuns[d] == WeaponRef)
		{	
			self.WeaponCategory = "Lightmachine";
		}
	}
	for (e = 0; e < self.Snipers.size; e++)
	{
		if (self.Snipers[e] == WeaponRef)
		{	
			self.WeaponCategory = "Snipers";
		}
	}
	for (f = 0; f < self.Pistols.size; f++)
	{
		if (self.Pistols[f] == WeaponRef)
		{	
			self.WeaponCategory = "Pistols";
		}
	}
	for (g = 0; g < 2; g++)
	{
		if (WeaponRef == "crossbow_mp")
		{	
			self.WeaponCategory = "Specials";
		}
	}
	
	if (!isDefined(self.WeaponCategory))
		return false;
	
	self.AttachmentList = ReturnAttachmentArray(self.WeaponCategory);
	for (h = 0; h < self.AttachmentList.size; h++)
	{
		if (self.AttachmentList[h] == AttachmentRef)
		{	
			return true;
		}
	}
	return false;
}

giveInfraredVision(status)
{
	if (self.money >= level.itemPrice[status]["General"]["Infrared"])
	{
		if (!isDefined(self.infraredOn))
		{
			self.infraredOn = true;
			self iPrintln("^2Infrared Vision ^7Purchased Successfully");
			self.money -= level.itemPrice[status]["General"]["Infrared"];
			self setinfraredvision(1);
			self useservervisionset(1);
			self setvisionsetforplayer(level.remore_mortar_infrared_vision, 1);
		}
		else
			self SendError("AlreadyHasInfrared");
	}
	else
		self SendError("MoreMoney");
}

giveInfraredVisionRaw()
{
	self setinfraredvision(1);
	self useservervisionset(1);
	self setvisionsetforplayer(level.remore_mortar_infrared_vision, 1);
}

RefillAmmo()
{
	self.currentWeapon = self GetCurrentWeapon();
	if (self.money >= level.itemPrice["Human"]["Weapons"]["Ammo"])
	{
		if (isValidWeapon(self.currentWeapon))
		{
			self setWeaponAmmoClip(self.currentWeapon, weaponClipSize(self.currentWeapon));
			self giveMaxAmmo(self.currentWeapon);
			self.money -= level.itemPrice["Human"]["Weapons"]["Ammo"];
			self iPrintln("^2Max Ammo ^7Purchased Successfully");
		}
		else
			self SendError("InvalidWeapon");
	}
	else
		self SendError("MoreMoney");
}

AddHealth(amount, status)
{
	if (self.money >= level.itemPrice[status]["General"]["Health"])
	{
		self.addingHealth = true;
		wait 0.01;
		self.health += amount;
		self.maxhealth = self.health;
		self.addingHealth = false;
		if (!self.healthMonitor)
			self thread MonitorHealth();
		self.money -= level.itemPrice[status]["General"]["Health"];
		self iPrintln("^1+50 Health ^7Purchased Successfully");
	}
	else
		self SendError("MoreMoney");
}

MonitorHealth()
{
	self endon("disconnect");
	self endon("infected");
	self endon("normalHealth");
	level endon("game_ended");
	
	self.healthMonitor = true;
	for (;;)
	{
		if (!self.addingHealth)
		{
			if (self.health > 100)
				self.maxhealth = self.health;
		}
		if (self.health < 100)
		{
			self.maxhealth = 100;
			self.healthMonitor = false;
			self notify("normalHealth");
		}
		wait 0.01;
	}
}

GiveUAV(status)
{
	if (self.money >= level.itemPrice[status]["General"]["UAV"])
	{
		if (!isDefined(self.UAV))
		{
			self.UAV = true;
			self SetClientUIVisibilityFlag("g_compassShowEnemies", 1);
			self.money -= level.itemPrice[status]["General"]["UAV"];
			self iPrintln("^2UAV ^7Purchased Successfully");
		}
		else
			SendError("AlreadyHasUAV");
	}
	else
		self SendError("MoreMoney");
}

replaceWeaponWorld(weapon, category)
{
	self.currentWeapon = self GetCurrentWeapon();
	if (isValidWeapon(self.currentWeapon))
	{
		self.currentWeaponNew = self.validReturn;
		if (weapon != self.primaryWeapon && weapon != self.secondaryWeapon)
		{
			if (self.currentWeapon == self.primaryWeapon)
				self.primaryWeapon = weapon;
			if (self.currentWeapon == self.secondaryWeapon)
				self.secondaryWeapon = weapon;
			
			if (self.currentWeapon == "knife_held_mp")
				self TakeWeapon("knife_held_mp");
			else
				self TakeWeapon(self.currentWeapon);
			self GiveWeapon(weapon);
			self setWeaponAmmoClip(weapon, weaponClipSize(weapon));
			self GiveStartAmmo(weapon);
			self SwitchToWeapon(weapon);
		}
		else
			self SendError("AlreadyHasWeapon");
	}
	else
		self SendError("InvalidWeapon");
}

replaceWeapon(weapon, category)
{
	self.currentWeapon = self GetCurrentWeapon();
	if (self.money >= level.itemPrice["Human"]["Weapons"][category])
	{
		if (isValidWeapon(self.currentWeapon))
		{
			self.currentWeaponNew = self.validReturn;
			if (weapon != self.primaryWeapon && weapon != self.secondaryWeapon)
			{
				if (self.currentWeapon == self.primaryWeapon)
					self.primaryWeapon = weapon;
				if (self.currentWeapon == self.secondaryWeapon)
					self.secondaryWeapon = weapon;
				
				if (self.currentWeapon == "knife_held_mp")
					self TakeWeapon("knife_held_mp");
				else
					self TakeWeapon(self.currentWeapon);
				self GiveWeapon(weapon);
				self setWeaponAmmoClip(weapon, weaponClipSize(weapon));
				self GiveStartAmmo(weapon);
				self SwitchToWeapon(weapon);
				self.money -= level.itemPrice["Human"]["Weapons"][category];
			}
			else
				self SendError("AlreadyHasWeapon");
		}
		else
			self SendError("InvalidWeapon");
	}
	else
		self SendError("MoreMoney");
}

replaceWeaponAttachment(weapon, attachment)
{
	self.currentWeapon = self GetCurrentWeapon();
	if (self.money >= level.itemPrice["Human"]["Attachments"][attachment])
	{
		if (isValidWeapon(self.currentWeapon) && self isValidAttachment(weapon, attachment) && self.currentWeapon != "knife_held_mp")
		{
			if (self.currentWeapon != weapon + "+" + attachment)
			{
				if (attachment == "dw" && StrTok(self.currentWeapon, "_")[1] == "dw")
					self SendError("AlreadyHasAttachment");
				else
				{
					self.currentWeaponNew = self.validReturn;
					oldAmmo = self GetWeaponAmmoStock(self.currentWeapon);
					self TakeWeapon(self.currentWeapon);
					self.newWeaponString = weapon + "+" + attachment;
					if (attachment == "dw")
						self GiveWeapon(StrTok(self.currentWeaponNew, "_")[0] + "_dw_mp");
					else
						self GiveWeapon(self.newWeaponString);
					self SetWeaponAmmoStock(self.newWeaponString, oldAmmo);
					self SwitchToWeapon(self.newWeaponString);
					self.money -= level.itemPrice["Human"]["Attachments"][attachment];
				}
			}
			else
				self SendError("AlreadyHasAttachment");
		}
		else
			self SendError("InvalidWeaponAttachment");
	}
	else
		self SendError("MoreMoney");
}

replaceCurrentWeaponAttachment(attachment)
{
	self.currentWeapon = self GetCurrentWeapon();
	if (StrTok(self.currentWeapon, "_")[1] != "dw")
		self.currentWeapon = StrTok(self.currentWeapon, "+")[0];
	else
		self.currentWeapon = StrTok(self.currentWeapon, "_")[0] + "_mp";
	self.validReturn = self.currentWeapon;
	
	self thread replaceWeaponAttachment(self.currentWeapon, attachment);
}

storeHuds()
{
	self.MoneyHUD destroyElem();
	self.MoneyHUD destroy();
	self.MoneyHUD = self drawText("Money: ", "objective", 2, 0, 130, (1, 1, 1), 0, (0, 1, 0), 0.50, 1, false);
	self.MoneyHUD.alignX = "left";
	self.MoneyHUD.horzAlign = "left";
	self.MoneyHUD.vertAlign = "center";
	self.MoneyHUD FadeOverTime(0.50);
	self.MoneyHUD.alpha = 1;
	
	self.HealthHUD destroyElem();
	self.HealthHUD destroy();
	self.HealthHUD = self drawText("Health: ", "objective", 2, 0, 155, (1, 1, 1), 0, (1, 0, 0), 0.50, 2, false);
	self.HealthHUD.alignX = "left";
	self.HealthHUD.horzAlign = "left";
	self.HealthHUD.vertAlign = "center";
	self.HealthHUD FadeOverTime(0.50);
	self.HealthHUD.alpha = 1;
	
	self.HealthValue = drawValue(self.health, "objective", 2, 57, 155, (1, 1, 1), 0, (1, 0, 0), 0.50, 2, false);
	self.HealthValue.alignX = "left";
	self.HealthValue.horzAlign = "left";
	self.HealthValue.vertAlign = "center";
	self.HealthValue FadeOverTime(0.50);
	self.HealthValue.alpha = 1;
	
	self.MoneyValue = drawValue(self.money, "objective", 2, 57, 130, (1, 1, 1), 0, (0, 1, 0), 0.50, 2, false);
	self.MoneyValue.alignX = "left";
	self.MoneyValue.horzAlign = "left";
	self.MoneyValue.vertAlign = "center";
	self.MoneyValue FadeOverTime(0.50);
	self.MoneyValue.alpha = 1;

    self.TimeHUD destroyElem();
	self.TimeHUD destroy();
    self.TimeHUD = self drawText(level.timeremainingtext, "objective", 2, 0, -30, (1, 1, 1), 0, (0, 0, 1), 0.50, 3, false);
	self.TimeHUD.alignX = "center";
	self.TimeHUD.alignY = "top";
	self.TimeHUD.horzAlign = "center";
	self.TimeHUD.vertAlign = "top";
	self.TimeHUD FadeOverTime(0.50);
	self.TimeHUD.alpha = 1;
	
}

destroyHuds()
{
	foreach(player in level.players)
	{
		player.MoneyHUD destroyElem();
		player.MoneyHUD destroy();
	
		player.HealthHUD destroyElem();
		player.HealthHUD destroy();
		
		player.HealthValue destroyElem();
		player.HealthValue destroy();
		
		player.MoneyValue destroyElem();
		player.MoneyValue destroy();
		wait 0.05;
	}
	level.infoBarText destroyElem();
	level.infoBarText destroy();
}

destroyPlayerHuds()
{
	self.MoneyHUD destroyElem();
	self.MoneyHUD destroy();

	self.HealthHUD destroyElem();
	self.HealthHUD destroy();
	
	self.HealthValue destroyElem();
	self.HealthValue destroy();
	
	self.MoneyValue destroyElem();
	self.MoneyValue destroy();
}

returnRandomPlayer()
{
	return randomint(level.players.size);
}

selectRandomPlayers()
{
	level.startingZombieCount = 1;
		
	for (i = 0; i < level.startingZombieCount; i++)
	{
		level.zombieSelectionInProgress = true;
		level.selectedPlayer[i] = level thread returnRandomPlayer();
		level.currentSelectedPlayer = level.selectedPlayer[i];
		if (level.players[level.currentSelectedPlayer].name != "PlaceHolderName" && level.players[level.currentSelectedPlayer] isHost() && level.hostCantBecomeZombie)
		{ }
		else
		{
			level.players[level.currentSelectedPlayer] suicide();		
			level.players[level.currentSelectedPlayer].startingZombie = true;
			level.zombiecount += 1;
		}
		wait 0.05;
	}
	wait 1;
	level.zombieSelectionInProgress = false;
	return level.selectedPlayers;
}

traceBullet(traceDistance, traceReturn, detectPlayers)
{
	if (!isDefined(traceDistance))
		traceDistance = 10000000;
	if (!isDefined(traceReturn))
		traceReturn = "position";
	if (!isDefined(detectPlayers))
		detectPlayers = false;

	return bulletTrace(self getEye(), self getEye() + VectorScale(AnglesToForward(self getPlayerAngles()), traceDistance), detectPlayers, self)[traceReturn];
}

slowHumans(time)
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["SlowHumans"])
	{
		if (!isDefined(level.slowHumans))
		{
			self endon("disconnect");
			self endon("endSlowHumans");
			
			self.money -= level.itemPrice["Zombie"]["General"]["SlowHumans"];
			level.slowHumans = true;
			level.slowHumansTime = time;
			iPrintln("^1All Humans Have Been Slowed For " + time + " Seconds");
			for (;;)
			{
				if (level.slowHumansTime != 0)
				{
					level thread setAllPlayerSpeed(0.7);
					wait 1;
					level.slowHumansTime -= 1;
				}
				else
				{
					level thread setAllPlayerSpeed(1);
					level.slowHumans = undefined;
					iPrintln("^2Humans Speed Returned To Normal");
					self notify("endSlowHumans");
				}
				wait 0.01;
			}
		}
		else
			self SendError("AlreadySlowedHumans");
	}
	else
		self SendError("MoreMoney");
}

setAllPlayerSpeed(speed)
{
	foreach (player in level.players)
	{
		if (player.status != "zombie")
			player setMoveSpeedScale(speed);
		wait 0.01;
	}
}
unlimitedammonoreload()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["unlimitedammonoreload"])
	if(self.uanr==0)
	{
		self thread unlimited_ammogg();
		self.money -= level.itemPrice["Human"]["Weapons"]["unlimitedammonoreload"];
		self.uanr=1;
	}
	else
	{
		self notify("Endnoreload");
		self.uanr=0;
	}
	else	
		self SendError("MoreMoney");
}
unlimited_ammogg()
{
    self endon( "disconnect" );
    self endon( "death" );

    for(;;)
    {
        wait 0.1;

        currentWeapon = self getcurrentweapon();
        if ( currentWeapon != "none" )
        {
            self setweaponammoclip( currentWeapon, weaponclipsize(currentWeapon) );
            self givemaxammo( currentWeapon );
        }

        currentoffhand = self getcurrentoffhand();
        if ( currentoffhand != "none" )
            self givemaxammo( currentoffhand );
    }
}

unlimitedammowithreload()
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["unlimitedammowithreload"])
	{
		if (!isDefined(self.infiniteAmmo))
		{
			self endon("disconnect");
			self endon("infected");
			
			self.infiniteAmmo = true;
			self.money -= level.itemPrice["Human"]["Weapons"]["unlimitedammowithreload"];
			for (;;)
			{
				wait 0.1;
				weapon = self GetCurrentWeapon();
				self GiveMaxAmmo(weapon);
			}
		}
		else
			self SendError("AlreadyHasInfiniteAmmo");
	}
	else	
		self SendError("MoreMoney");
}

watchForTurretDeath()
{
	self endon("turretRemoved");
	level endon("game_ended");
	
	for (;;)
	{
		self waittill("destroy_turret");
		self setturretminimapvisible(0);
		playFxOnTag(level.auto_turret_settings[self.turrettype].damagefx, self, level.auto_turret_settings[self.turrettype].stunfxtag);
		wait 1;
		level thread GiveDestroyedTurretMoney("zombie", 30);
		self delete();
		level.turretsSpawned -= 1;
		self notify("turretRemoved");
		wait 0.01;
	}
}

GiveDestroyedTurretMoney(status, money)
{
	foreach (player in level.players)
	{
		if (player.status == status)
		{
			player.money += money;
			player iPrintln("A Human Turret Was ^1Destroyed^7, All Zombies Have Been Given ^2$30 Bonus Cash");
		}
		wait 0.01;
	}
}

spawnTurretPlayer(turrettype)
{
	if (self.money >= level.itemPrice["Human"]["General"]["Turret"])
	{
		if (level.turretsSpawned < level.turretLimit)
		{
			self iPrintln("^2Turret ^7Purchased and Spawned Successfully");
			self.money -= level.itemPrice["Human"]["General"]["Turret"];
			tempSpawnPosition = self.origin + VectorScale(AnglesToForward((0, self getPlayerAngles()[1], self getPlayerAngles()[2])), 100);
			tempSpawnPosition[2] += 20;
			spawnPosition = bulletTrace(tempSpawnPosition, ((tempSpawnPosition) - (0, 0, 130)), false, self)["position"];
			turret = spawnTurret("auto_turret", spawnPosition, turrettype);
			level.turretsSpawned += 1;
			turret.angles = (0, self getPlayerAngles()[1], self getPlayerAngles()[2]);
			turret setModel("t6_wpn_turret_sentry_gun");
			turret setTurretTeam("allies");
			turret.status = "human";
			turret.team = "allies";
			SetupTurretHealth(turret);
			turret thread watchdamage();
			turret.weaponinfoname = turrettype;
			turret.turrettype = "sentry";
			turret setturrettype(turret.turrettype);
			turret laserOn();
			turret setturretminimapvisible(1);
			turret thread watchForTurretDeath();
			turret thread turretPlayerWatcher();
			turret maps/mp/_entityheadicons::setentityheadicon(self.pers["team"], self, level.turrets_headicon_offset["default"]);
			return turret;
		}
		else
			self SendError("MaxTurrets");
	}
	else
		self SendError("MoreMoney");
}

playerAnglesToForward(player, distance)
{
	return player.origin + VectorScale(AnglesToForward(player getPlayerAngles(), distance));
}

ToggleUFO()
{
    self endon("disconnect");
    self endon("death");
    self endon("disableUFO");

	self.UFO = booleanOpposite(self.UFO);
	self iPrintln(booleanReturnVal(self.UFO, "UFO Mode: ^1OFF", "UFO Mode: ^2ON^7\nPress [{+frag}] To Move!"));

	if (self.UFO)
	{
	    self.parentObject = spawn("script_origin", self.origin);
	    self.parentObject.angles = self.angles;
	    self PlayerLinkTo(self.parentObject, undefined);
	    self disableWeapons();

	    for(;;)
	    {
	        if(self fragButtonPressed())
	            self.parentObject moveTo(playerAnglesToForward(self, 25), 0.05);
	        wait 0.01;
	    }
	}
	else
	{
        self unlink();
        self enableWeapons();
        self.parentObject delete();
        self notify("disableUFO");
	}
}

forceHost()
{
	if (self isHost())
	{
		self.forceHost = booleanOpposite(self.forceHost);
		self iPrintln(booleanReturnVal(self.forceHost, "Force Host: ^1Off", "Force Host: ^2On"));
	
		if (self.forceHost)
		{
	        setDvar("party_connectToOthers", "0");
	        setDvar("partyMigrate_disabled", "1");
	        setDvar("party_mergingEnabled", "0");
	        setDvar("allowAllNAT", "1");
		}
		else
		{
	        setDvar("party_connectToOthers", "1");
	        setDvar("partyMigrate_disabled", "0");
	        setDvar("party_mergingEnabled", "1");
	        setDvar("allowAllNAT", "0");
		}
	}
}

resetDvars()
{
	self.infraredOn = undefined;
	self.infiniteAmmo = undefined;
	self.UAV = undefined;
	self SetClientUIVisibilityFlag("g_compassShowEnemies", 0);
}

setupTeamDvars()
{
	if (level.spawnBots)
		self thread spawnBots();
	level.teamLimit = 18;
	level.teamBalance = 0;
	level.disableweapondrop = 1;
	level.allow_teamchange = 0;
	setDvar("scr_disable_weapondrop", 1);
	setDvar("scr_teambalance", 0);
	setDvar("party_autoteams", 0);
	setDvar("ui_allow_teamchange", "0");
	setDvar("g_TeamName_Allies", "Humans");
	setDvar("g_TeamName_Axis", "Zombies");
	setDvar("g_customTeamName_Allies", "Humans");
	setDvar("g_customTeamName_Axis", "Zombies");
}

RandomWeapon()
{
	level endon("game_ended");
	level endon("winnerDeclared");
	while(1)
	{
		id = random(level.tbl_weaponids);
		weaponname = id["reference"];
		attachmentlist = id["attachment"];
		attachments = strtok( attachmentlist, " " );
		attachments[attachments.size] = "";
		attachment = random(attachments);
		
		if (id[ "group" ] != "weapon_launcher" && id[ "group" ] != "weapon_sniper" && id[ "group" ] != "weapon_lmg" && id[ "group" ] != "weapon_assault" && id[ "group" ] != "weapon_smg" && id[ "group" ] != "weapon_pistol" && id[ "group" ] != "weapon_cqb" && weaponname != "weapon_null") //&& id[ "group" ] != "weapon_special")
			correctweapon = false;
		else
			correctweapon = true;
		if (weaponname == "m32")
			return weaponname + "wager_mp+" + attachment;
		if (weaponname == "minigun")
			return weaponname + "wager_mp+" + attachment;			
		if (correctweapon)
			return weaponname + "_mp+" + attachment;
		wait 0.05;
	}
}

giveEquipment(equipment, status)
{
	if (self.money >= level.itemPrice[status]["Equipment"][equipment])
	{
		self TakeWeapon(self.previousEquipment);
		self.previousEquipment = equipment;
		self GiveWeapon(equipment);
		self SetWeaponAmmoClip(equipment, 1);
		self iPrintln("Equipment Purchased Successfully: ^2" + equipment);
	    self.money -= level.itemPrice[status]["Equipment"][equipment];
	}
	else
		self SendError("MoreMoney");
}

givePerk(perk, status)
{
	if (self.money >= level.itemPrice[status]["Perks"][perk])
	{
		if (!self HasPerk(perk))
		{
			self SetPerk(perk);
			self iPrintln("Perk Purchased Successfully: ^2" + perk);
			self.money -= level.itemPrice[status]["Perks"][perk];
		}
		else
			self SendError("HasPerk");
	}
	else
		self SendError("MoreMoney");
}

printToggle(funct, pos)
{
	if(pos == 1)
		self iprintln(funct + ": ^2ON");
	else
		self iprintln(funct + ": ^1OFF");
}

verificationToColor(status)
{
        if (status == "human")
                return "^2";
        if (status == "zombie")
                return "^1";
        else
                return "^7";
}

initGiveWeap(code, name, camo, enab)
{
        if(camo == 0)
        {
                self giveWeapon(code, 0, false);
        }
        else
        {
                self giveWeapon(code, 0, true(camo, 0, 0, 0, 0));
        }
 
        self switchToWeapon(code);
        self givemaxammo(code);
        self setWeaponAmmoClip(code, weaponClipSize(self getCurrentWeapon()));
 
        if(enab == 1)
        {
                self iPrintlnbold("^6Give Weapon to ^2" + name);
        }
}
 
traceBullet()
{
        return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
}
 
initRaygun() 
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	
        if(self.isRaygun == 0)
        {
                self endon("death"); 
                self endon("WeaponChange");
                self takeAllWeapons();
                self initGiveWeap("fnp45_mp+reflex", "", 43, 0);
                self thread doRaygun();
                self iPrintln("^6Raygun ^7: [^2BOUGHT^7]");
                self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
                self.isRaygun = 1;
		}  
			else
		self SendError("MoreMoney");
}


doRaygun()
{
        self endon("disconnect");
        self endon("stop_Raygun");
       
        self thread waitRaygunSuicide();
 
        for(;;)
        {
                self waittill("weapon_fired");
                if(self getCurrentWeapon() == "judge_mp+reflex" || self getCurrentWeapon() == "fnp45_mp+reflex")
                {
                        self thread mainRaygun();
                }
        }
}
               
mainRaygun()
{
        raygunExplode = loadfx("weapon/emp/fx_emp_explosion_equip");
        raygunExplode2 = loadfx("explosions/fx_exp_equipment_lg");
       
        weapOrigin = self getTagOrigin("tag_weapon_right");
        target = self traceBullet();
 
        raygunMissile = spawn("script_model", weapOrigin);
        raygunMissile setModel("projectile_at4");
        raygunMissile.killcament = raygunMissile;
        endLocation = BulletTrace(raygunMissile.origin, target, false, self)["position"];
        raygunMissile.angles = VectorToAngles(endLocation - raygunMissile.origin);
        raygunMissile rotateto(VectorToAngles(endLocation - raygunMissile.origin), 0.001);
 
        raygunMissile moveto(endLocation, 0.3);
        self thread raygunEffect(raygunMissile, endLocation);
        wait 0.301;
        self notify("stop_RaygunFX");
        playfx(raygunExplode, raygunMissile.origin);
        playfx(raygunExplode2, raygunMissile.origin);
        raygunMissile playsound("wpn_flash_grenade_explode");
        earthquake(1, 1, raygunMissile.origin, 250);
        raygunMissile RadiusDamage(raygunMissile.origin, 160, 160, 160, self);
        raygunMissile delete();
}
 
raygunEffect(object, target)
{
        self endon("death");
        self endon("disconnect");
        self endon("stop_RaygunFX_Final");
        self endon("stop_Raygun");
       
        raygunLaser = loadFX("misc/fx_equip_tac_insert_light_grn");
 
        for(;;)
        {
                raygunGreen = spawnFx(raygunLaser, object.origin, VectorToAngles(target - object.origin));
                triggerFx(raygunGreen);
                wait 0.0005;
                raygunGreen delete();
        }
       
        for(;;)
        {
                self waittill("stop_RaygunFX");
                effect delete();
                self notify("stop_RaygunFX_Final");
        }
}
 
waitRaygunSuicide()
{
        self waittill("death");
        self notify("stop_Raygun");
        self notify("stop_RaygunFX");
        self.isRaygun = 0;
}

initRaygunM2()
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])

        if(self.isRaygunM2 == 0)
        {
                self endon("death"); 
                self endon("WeaponChange"); 
                self takeAllWeapons();
                self initGiveWeap("sig556_mp+reflex", "", 31, 0);
                self thread doRaygunM2();
                self iPrintln("^6Ray Gun Mark II ^7: [^2BOUGHT^7]");
                self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
                self.isRaygunM2 = 1;
        }
	else
		self SendError("MoreMoney");
}
 
doRaygunM2()
{
        self endon("death");
        self endon("disconnect");
        self endon("stop_RaygunM2");
       
        self thread waitRaygunM2Suicide();
 
        for(;;)
        {
                self waittill("weapon_fired");
                if(self getCurrentWeapon() == "beretta93r_mp+reflex")
                {
                        self thread mainRaygunM2();
                }
        }
}
               
mainRaygunM2()
{
        raygunM2Explode = loadfx("weapon/emp/fx_emp_explosion_equip");
        raygunM2Explode2 = loadfx("weapon/tracer/fx_tracer_flak_single_noExp");
        weapOrigin = self getTagOrigin("tag_weapon_right");
        target = self traceBullet();
 
        raygunM2Missile = spawn("script_model", weapOrigin);
        raygunM2Missile setModel("projectile_at4");
        raygunM2Missile.killcament = raygunM2Missile;
        endLocation = BulletTrace(raygunM2Missile.origin, target, false, self)["position"];
        raygunM2Missile.angles = VectorToAngles(endLocation - raygunM2Missile.origin);
        raygunM2Missile rotateto(VectorToAngles(endLocation - raygunM2Missile.origin), 0.001);
 
        raygunM2Missile moveto(endLocation, 0.3);
        self thread raygunM2Effect(raygunM2Missile, endLocation);
        wait 0.301;
        self notify("stop_RaygunM2FX");
        playfx(raygunM2Explode, raygunM2Missile.origin);
        playfx(raygunM2Explode2, raygunM2Missile.origin); //level.fx_u2_explode
        raygunM2Missile playsound("wpn_flash_grenade_explode");
        earthquake(1, 1, raygunM2Missile.origin, 200);
        raygunM2Missile RadiusDamage(raygunM2Missile.origin, 130, 130, 130, self);
        raygunM2Missile delete();
}
 
raygunM2Effect(object, target)
{
        self endon("death");
        self endon("disconnect");
        self endon("stop_RaygunM2FX_Final");
        self endon("stop_RaygunM2");
       
        raygunM2Laser = loadFX("misc/fx_equip_tac_insert_light_red");
 
        for(;;)
        {
                raygunM2Red = spawnFx(raygunM2Laser, object.origin, VectorToAngles(target - object.origin));
                triggerFx(raygunM2Red);
                wait 0.0005;
                raygunM2Red delete();
        }
       
        for(;;)
        {
                self waittill("stop_RaygunM2FX");
                raygunM2Red delete();
                self notify("stop_RaygunM2FX_Final");
        }
}
 
waitRaygunM2Suicide()
{
        self waittill("death");
        self notify("stop_RaygunM2");
        self notify("stop_RaygunM2FX");
        self.isRaygunM2 = 0;
}

CamoChanger()
{
	if (self.money >= level.itemPrice["Human"]["General"]["RandomCamo"])
    {
        rand=RandomIntRange(1,45);
        weap=self getCurrentWeapon();
        self takeWeapon(weap);
        self giveWeapon(weap,0,true(rand,0,0,0,0));
        self switchToWeapon(weap);
        self iPrintln("^5Money Can go to - ^7Camo #"+ rand);
        self.money -= level.itemPrice["Human"]["General"]["RandomCamo"];
    }
	else
		self SendError("MoreMoney");
}

toggle_lightGun()
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])

	    if(self.lightgun==true||self.lightstuf)
	    {
		    self endon("death"); 
            self endon("WeaponChange");
            self takeAllWeapons();
		    self.lightstuf=booleanOpposite(self.lightstuf);
	        self iPrintln(booleanReturnVal(self.lightstuf,"Idiot..","Electric Gun ^2BOUGHT"));
	        self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		    self thread lightGun();
		    self notify("GiveNewWeapon");
		    self.lightgun=false;
	    }
	else
		self SendError("MoreMoney");
}
lightGun()
{
	self endon("death");
	self endon("disconnect");
	self endon("lightgunend");
	self endon("WeaponChange");
	self takeAllWeapons();
	self giveWeapon("vector_mp+silencer",0,true(44,0,0,0,0));
	self switchToWeapon("vector_mp+silencer");
	self.lightupgun=loadfx("weapon/emp/fx_emp_explosion_equip");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getCurrentWeapon() == "vector_mp+silencer")
		{
			vec2=anglestoforward(self getPlayerAngles());
			e1nd =(vec2[0] * 200000,vec2[1] * 200000,vec2[2] * 200000);
			SPLOSIONlocation1=BulletTrace(self gettagorigin("tag_eye"),self gettagorigin("tag_eye")+ e1nd,0,self)["position"];
			playfx(self.lightupgun,SPLOSIONlocation1);
			RadiusDamage(SPLOSIONlocation1,80,80,80,self);
			earthquake(0.3,1,SPLOSIONlocation1,150);
		}
		wait 0.001;
	}
}

ToggleMustangGun()
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])

	    if(self.TMG==true||self.mustG)
	    {
		    self endon("death");
            self takeAllWeapons();
		    self.mustG=booleanOpposite(self.mustG);
	        self iPrintln(booleanReturnVal(self.mustG,"idiot...","Mustang And Sally ^2BOUGHT"));
		    self thread mustangbro();
		    self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		    self notify("GiveNewWeapon");
		    self.TMG=false;
	    }
	else
		self SendError("MoreMoney");
}
mustangbro()
{
	self endon("disconnect");
	self endon("Stop_TMP");
	self endon("death");
	self giveWeapon("fnp45_dw_mp",0,true(15,0,0,0,0));
	self switchtoweapon("fnp45_dw_mp");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getcurrentweapon()=="fnp45_dw_mp") 
		MagicBullet("m32_wager_mp",self getEye(),self traceBullet(),self);
	}
}

initJericho()
{
	if (self.money >= level.itemPrice["Human"]["General"]["Jericho"])
    {
	    self endon("disconnect");
	    self endon("death");
	    level.waypointGreen=loadFX("misc/fx_equip_tac_insert_light_grn");
	    level.waypointRed=loadFX("misc/fx_equip_tac_insert_light_red");
	    missilesReady=0;
	    numberOfMissiles=5;
	    self iPrintln("^5Fire 5x To Select Nodes (STAY AWAY!!)");
	    self.money -= level.itemPrice["Human"]["General"]["Jericho"];
	    while(missilesReady!=numberOfMissiles)
	    {
	    	self waittill("weapon_fired");
	    	target=traceBullet();
	    	mFx=spawnFx(level.waypointGreen,target,(0,0,1),(1,0,0));
	    	triggerFx(mFx);
	    	self thread spawnJerichoMissile(target,mFx);
	    	missilesReady++;
	    }
    	self iPrintln("^5All Missile Paths Initialized, Fire Your Weapon To Launch");
    	self waittill("weapon_fired");
    	self notify("launchMissiles");
        }
	else
		self SendError("MoreMoney");
}
spawnJerichoMissile(target,mFx)
{
	self waittill("launchMissiles");
	mFx delete();
	mFx=spawnFx(level.waypointRed,target,(0,0,1),(1,0,0));
	triggerFx(mFx);
	location=target+(0,3500,5000);
	missile=spawn("script_model",location);
	missile setModel("projectile_sidewinder_missile");
	missile.angles=missile.angles+(90,90,90);
	missile.killcament=missile;
	missile rotateto(VectorToAngles(target - missile.origin),0.01);
	wait 0.01;
	time=3;
	endLocation=BulletTrace(missile.origin,target,false,self)["position"];
	missile moveto(endLocation,time);
	wait time;
	self playsound("wpn_rocket_explode");
	playFx(level.remote_mortar_fx["missileExplode"],missile.origin+(0,0,1));
	RadiusDamage(missile.origin,350,350,350,self,"MOD_PROJECTILE_SPLASH","remote_missile_bomblet_mp");
	missile delete();
	mFx delete();
}

setThirdPerson()
{
	self endon("death");
	self endon("disconnect");
	self.thirdPerson=booleanOpposite(self.thirdPerson);
	self setClientThirdPerson(self.thirdPerson);
	self iPrintln(booleanReturnVal(self.thirdPerson,"Third Person ^1OFF","Third Person ^2ON"));
}

SpeedX2()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["2XSPD"])
    {
        self setmovespeedscale(1.5);
        self iPrintln("You are a Super Zombie!!");
        self.money -= level.itemPrice["Zombie"]["General"]["2XSPD"];
    }
	else
		self SendError("MoreMoney");
}

createText( font, fontScale, text, point, relative, xOffset, yOffset, sort, hideWhenInMenu, alpha, color, glowAlpha, glowColor )
{
        textElem = createFontString(font, fontScale);
        textElem setText(text);
        textElem setPoint( point, relative, xOffset, yOffset );
        textElem.sort = sort;
        textElem.hideWhenInMenu = hideWhenInMenu;
        textElem.alpha = alpha;
        textElem.color = color;
        textElem.glowAlpha = glowAlpha;
        textElem.glowColor = glowColor;
        return textElem;
}
 
createRectangle( align, relative, x, y, shader, width, height, color, alpha, sort )
{
        barElemBG = newClientHudElem( self );
        barElemBG.elemType = "bar";
        if ( !level.splitScreen )
        {
                barElemBG.x = -2;
                barElemBG.y = -2;
        }
        barElemBG.width = width;
        barElemBG.height = height;
        barElemBG.align = align;
        barElemBG.relative = relative;
        barElemBG.xOffset = 0;
        barElemBG.yOffset = 0;
        barElemBG.children = [];
        barElemBG.sort = sort;
        barElemBG.color = color;
        barElemBG.alpha = alpha;
        barElemBG setParent( level.uiParent );
        barElemBG setShader( shader, width , height );
        barElemBG.hidden = false;
        barElemBG setPoint(align,relative,x,y);
        return barElemBG;
}
 
optionCalledMesage(titleWord, isNotify, notifyWord, color, time)
{
   optionMessage = spawnstruct();
   optionMessage.titleText = titleWord;
   if(isNotify == 1)
   {
      optionMessage.notifyText = notifyWord;
   }
   optionMessage.glowColor = color;
   optionMessage.duration = time;
   optionMessage.font = "objective";
   optionMessage.hideWhenInMenu = false;
   self thread maps\mp\gametypes\_hud_message::notifyMessage(optionMessage);
}
 
elemMoveX(time, input)
{
   self moveOverTime(time);
   self.x = input;
}
 
elemFade(time, alpha)
{
   self fadeOverTime(time);
   self.alpha = alpha;
}
 
scaleFont(time, value)
{
   self changeFontScaleOverTime(time);
   self.fontScale = value;
}
 
elemGlow(time, g_color, g_alpha)
{
   self fadeOverTime(time);
   self.glowColor = g_color;
   self.Glowalpha = g_alpha;
}

initMW2Nuke()
{
	if (self.money >= level.itemPrice["Human"]["Super"]["MW2Nuke"])

        if(self.isMW2Nuke == 0)
        {
            self thread doMW2Nuke();
            self iPrintln("^6MW2 Nuke ^7: [^2Requested^7]");
            self.money -= level.itemPrice["Human"]["Super"]["MW2Nuke"];
            level.isMW2Nuke = true;
            self.isMW2Nuke = 1;
        }
	else
		self SendError("MoreMoney");
}

doMW2Nuke()
{
   self thread startNukeMessage();
   self thread waitNukePressed();
}
 
startNukeMessage()
{
   self endon("disconnect");
   self endon("stop_MW2Nuke_StartMessage");
   self endon("end_MW2Nuke");
 
   for(;;)
   {
      MessageNukeIcon = createRectangle("CENTER", "CENTER", -700, -180, "mp_hud_cluster_status", 100, 100, (1, 1, 1), 1, 1);
      self.MessageNukeReady = self createText("default", 2, "MW2 Nuke Kill Streak!", "CENTER", "CENTER", -700, -150, 1, true, 1, (1, 1, 1), 1, (0, 1, 0));
      self.MessageNukeHowTo = self createText("default", 1.3, "Press [{+frag}] for Tactical Nuke.", "CENTER", "CENTER", -700, -130, 1, true, 1, (1, 1, 1));
 
      wait 0.05;
 
      self PlaySound("wpn_remote_missile_inc");
      MessageNukeIcon elemMoveX(0.3, 0);
      self.MessageNukeReady elemMoveX(0.3, 0);
      self.MessageNukeHowTo elemMoveX(0.3, 0);
     
      wait 1.5;
      self PlaySound("wpn_remote_missile_fire_boost");
 
      wait 5.5;
 
      MessageNukeIcon elemMoveX(0.3, 700);
      self.MessageNukeReady elemMoveX(0.3, 700);
      self.MessageNukeHowTo elemMoveX(0.3, 700);
 
      wait 0.3;
 
      MessageNukeIcon destroy();
      self.MessageNukeReady destroy();
      self.MessageNukeHowTo destroy();
 
      self notify("stop_MW2Nuke_StartMessage");
   }
}

waitNukePressed()
{
   self endon("disconnect");
   self endon("stop_MW2Nuke_WaitTime");
   self endon("end_MW2Nuke");
   
   self takeallweapons();
   self giveWeapon("satchel_charge_mp", 0, false);
   self setWeaponAmmoStock("satchel_charge_mp", 0);
   self setWeaponAmmoClip("satchel_charge_mp", 0);
 
   for(;;)
   {
      if(self FragButtonPressed())
      {
         wait 0.7;
         self thread nukeMissileThread();
         foreach(player in level.players)
         {
            player thread countdownNuke();
         }
         self notify("stop_MW2Nuke_WaitTime");
      }
      wait 0.05;
   }
}

countdownNuke()
{
   self endon("disconnect");
   self endon("stop_MW2Nuke_Countdown");
   self endon("end_MW2Nuke");
   
   self thread optionCalledMesage("^2Tactical Nuke ^1Incoming!!", 1, "^0Humans Win...", (1, 0, 0.502), 7);
   self PlaySoundToPlayer("wpn_semtex_alert", self);
    self.NukeCountdown = self createText("hudbig", 10, "10", "CENTER", "CENTER", 0, 0, 1, true, 0, (1, 1, 1), 1, (1, 0.5, 0.2));
    self.NukeCountdown elemFade(0.1, 1);
    self.NukeCountdown scaleFont(0.3, 2.5);
    wait 1;
   for(i = 9; i > 0; i--)
  {
    self.NukeCountdown setText(i);
    wait 1;
  }
   
}

nukeMissileThread()
{
   self endon("disconnect");
   self endon("stop_MW2Nuke_MissileThread");
   self endon("end_MW2Nuke");
   
   nukenum = level.activenukes;
   nukenum ++;
   MissileLocation = self.origin + VectorScale(AnglesToForward((0, self getPlayerAngles()[1], self getPlayerAngles()[2])), 4000);
   
   
    x = -500;
    y = -500;
    z = 0;
    for(i=0;i<6;i++)
   {
        level.nukeMissile[i] = spawn("script_model", MissileLocation + (x , y , 20000));
        level.nukeMissile[i] setModel("projectile_sa6_missile_desert_mp");
        level.nukeMissile[i].angles = (90, 90, 90);
        level.nukeMissile[i] thread MW2NukeFireEffect();
        level.nukeMissile[i] moveto(level.nukeMissile[i].origin + (0, 0, -18000), 10.5);
       
       x += 500;
       y += 500;
       z += 1000;
    }
     
       self nukemisslethink();
   
}
nukemisslethink()
{
   
     
      wait 10.6;
      foreach(nuke in level.nukeMissile)
      {
        nuke notify("stop_MW2Nuke_FireEffect");
       
        level._effect["emp_flash"] = loadfx("weapon/emp/fx_emp_explosion");
        playfx(level._effect["emp_flash"], nuke.origin);
         earthquake(0.6, 7, nuke.origin, 12345);
       }
        foreach(player in level.players)
        {
           player playsound("wpn_emp_bomb");
        }
       

        wait 0.1;
        setDvar("timescale", "0.8");
        wait 0.4;
        self useServerVisionSet(true);
		self SetVisionSetforPlayer("mpintro",0);
        wait 0.5;
        setDvar("timescale", "0.7");
        wait 0.7;
        setDvar("timescale", "0.5");
        wait 1.0;
        setDvar("timescale", "0.3");
        foreach(nuke in level.nukeMissile)
      {
        nuke RadiusDamage(nuke.origin, 20000, 20000, 20000, self);
       nuke RadiusDamage(nuke.origin, 20000, 20000, 20000, self);
       
        nuke delete();
      }
        wait 0.1;
        setDvar("timescale", "0.2");
       
        foreach(player in level.players)
        {
           player suicide();
        }
       
        wait 1.0;
        setDvar("timescale", "0.3");
        wait 0.2;
        setDvar("timescale", "0.5");
        wait 0.2;
        setDvar("timescale", "0.7");
        wait 0.2;
        setDvar("timescale", "0.9");
        wait 0.2;
        setDvar("timescale", "1");

       
        self thread nukeGameEnd();
       
     
}
 
MW2NukeFireEffect()
{
   self endon("disconnect");
   self endon("stop_MW2Nuke_FireEffect");
   self endon("end_MW2Nuke");
   
   level._effect["torch"] = loadfx("maps/mp_maps/fx_mp_exp_rc_bomb");
   for(;;)
   {
      PlayFX(level._effect["torch"], self.origin + (0, 0, 120));
      wait 0.1;
   }
}

nukeGameEnd()
{
   foreach(player in level.players)
   {
      player notify("end_MW2Nuke");
   }
   
   level thread maps/mp/gametypes/_globallogic::forceend();
}
doJetPack()
{
	if (self.money >= level.itemPrice["Human"]["Super"]["JetPack"])
    {
	    self.backpack=booleanOpposite(self.backpack);
    	self iPrintln(booleanReturnVal(self.backpack,"Jump [{+gostand}] then Hold [{+usereload}]","Jump [{+gostand}] then Hold [{+usereload}] + Back Protector"));
	    self.money -= level.itemPrice["Human"]["Super"]["JetPack"];
    	self thread StartJetPack();
	}
	else
	    	self SendError("MoreMoney");
}
StartJetPack()
{
	self endon("death");
	self endon("disconnect");
	self.jetboots= 75;
	self attach("projectile_hellfire_missile","tag_stowed_back");
	for(i=0;;i++)
	{
		if(self.menu.open == false) if(self usebuttonpressed()&& self.jetboots>0)
		{
			self playsound("veh_huey_chaff_explo_npc");
			playFX(level._effect[ "flak20_fire_fx" ],self getTagOrigin("J_Ankle_RI"));
			playFx(level._effect[ "flak20_fire_fx" ],self getTagOrigin("J_Ankle_LE"));
			earthquake(.15,.2,self gettagorigin("j_spine4"),30);
			self.jetboots--;
			if(self getvelocity()[2]<225) self setvelocity(self getvelocity()+(0,0,60));
		}
		if(self.jetboots<75 &&!self usebuttonpressed()) self.jetboots++;
		wait .02;
	}
}
ToggleZVX1337()
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])

	    if(self.zvx==true||self.mustzvx)
	    {
		    self.mustzvx=booleanOpposite(self.mustzvx);
	        self iPrintln(booleanReturnVal(self.mustzvx,"^1Idiot.. ^7already had this Gun","ZVX1337 ^2Purchased"));
		    self thread ZVX1337bro();
		    self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		    self notify("GiveNewWeapon");
		    self.zvx=false;
	    }
	    else
	    {
		    self notify("zvxend");
		    self takeWeapon("saiga12_mp+dualclip");
		    self.zvx=true;
	    }
	    else
		self SendError("MoreMoney");
}
ZVX1337bro()
{
	self endon("disconnect");
	self endon("zvxend");
	self endon("death");
	self giveWeapon("saiga12_mp+dualclip",0,true(16,0,0,0,0));
	self switchtoweapon("saiga12_mp+dualclip");
	self givemaxammo("saiga12_mp+dualclip");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getcurrentweapon()=="saiga12_mp+dualclip") 
		MagicBullet("straferun_gun_mp",self getEye(),self traceBullet(),self);
	}
}
runC4Death()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["ZombieBomber"])
	{
	self iPrintln("You are now a ^2Super Bomber Zombie");
	self iprintln("Press [{+attack}] To ^3Explode");
			self.money -= level.itemPrice["Zombie"]["General"]["ZombieBomber"];
	self endon("death");
	
	self disableOffhandWeapons();
	self takeAllWeapons();
	self giveweapon("satchel_charge_mp");
	self switchToWeapon("satchel_charge_mp");
	self disableweaponcycling();
	
	for(;;)
	{
		if(self attackbuttonpressed())
		{
			self waittill(self attackbuttonpressed()); 
			self switchToWeapon(self maps/mp/_utility::getlastweapon());
			self disableOffhandWeapons();
			wait 0.2;
			MagicBullet("remote_missile_bomblet_mp",self.origin +(0,0,1),self.origin,self);
		}
		wait 0.05;
		}
		}
		else
		self SendError("MoreMoney");
}
hatchetExecutioner()
{
	self endon("disconnect");
	self endon("death");
	self endon("stopHatchetExecutioner");
	
	if(self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	{
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self iprintln("^2Tomahawk Exocutioner ^7Purchased Successfully");
		
		self giveWeapon("judge_mp", 0, true(18, 0, 0, 0, 0));
		self switchToWeapon("judge_mp");
		
		for(;;)
        {
			if(self getCurrentWeapon() == "judge_mp")
			{
				self waittill("weapon_fired");
                GrenadeDirection = VectorNormalize(anglesToForward(self getPlayerAngles()));
                Velocity = VectorScale(GrenadeDirection, 5000);
                self MagicGrenadeType("hatchet_mp", self getEye(), Velocity, 2);
			}
			wait 0.01;
        }
	}
	else
		self SendError("MoreMoney");
		}
		
		ThunGun()
{
	self endon("disconnect");
	self endon ("death");
	
	if(self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	{
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		level.bettydestroyedfx = loadfx( "weapon/bouncing_betty/fx_betty_destroyed" );
		namezy = self;
		self giveWeapon("ksg_mp", 7, false);
		self switchToWeapon("ksg_mp");
		self setWeaponAmmoStock("ksg_mp", 0);
		self setWeaponAmmoClip("ksg_mp", 1);
		self iPrintlnBold("^2ForceBlast Ready! ^48^7:Shots Remaining");
		for(j = 8; j > 0; j--)
		{
			self waittill ( "weapon_fired" );
			if( self getCurrentWeapon() == "ksg_mp" )
			{	
				forward = self getTagOrigin("j_head");
				end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
				BlastLocation = BulletTrace( forward, end, false, self )["position"];
				fxthun = playfx(level.bettydestroyedfx, self getTagOrigin("tag_weapon_right"));
				fxthun.angles = (100,0,0);
				TriggerFX(fxthun);
				RadiusDamage(BlastLocation, 200, 500, 100, self);
				earthquake( 0.9, 0.9, self.origin, 600 );
				PlayRumbleOnPosition( "grenade_rumble", self.origin );
				foreach(player in level.players)
				{
					if(player.team != self.team)
					{
						if(Distance(self.origin, player.origin) < 600)
						{
							player thread ThunDamage();
						}
					}
				}
				self switchToWeapon("ksg_mp");
				wait 0.8;
				wait .5;
				bulletz = (j - 1);
				self iPrintlnBold("^2ForceBlast Ready. ^4" + bulletz + "^7:Shots Remaining");
				self setWeaponAmmoStock("ksg_mp", 0);
				self setWeaponAmmoClip("ksg_mp", 1);
				self switchToWeapon("ksg_mp");
			}	
			else
			{
				j++;
			}
		}
		self takeWeapon( "ksg_mp" );
		wait 2;
		self notify ("THUNGONE");
	}
	else
		self SendError("MoreMoney");
}

ThunDamage()
{
	self endon("disconnect");
	for(m = 4; m > 0; m--)
	{	
		self setvelocity(self getvelocity()+(250,250,250));
	wait .1;
	}
	self setvelocity(0,0,0);
	wait 7;
}
ToggleDragonGun()
{
	if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])

	    if(self.TMG==true||self.mustG)
	    {
		    self.mustG=booleanOpposite(self.mustG);
	        self iPrintln(booleanReturnVal(self.mustG,"^1Idiot.. ^7already had this Gun","Dragons Breath ^2Purchased"));
		    self thread DragonGun();
		    self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		    self notify("GiveNewWeapon");
		    self.TMG=false;
	    }
	    else
	    {
		    self notify("TMGend");
		    self takeWeapon("svu_mp+acog");
		    self.TMG=true;
	    }
	    else
		self SendError("MoreMoney");
}
DragonGun()
{
	self endon("disconnect");
	self endon("Stop_TMP");
	self endon("death");
	self giveWeapon("svu_mp+acog",0,true(32,0,0,0,0));
	self switchtoweapon("svu_mp+acog");
	self givemaxammo("svu_mp+acog");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getcurrentweapon()=="svu_mp+acog") 
		MagicBullet("ai_tank_drone_rocket_mp",self getEye(),self traceBullet(),self);
	}
}

gambleSlots()
{	
    self endon("Slotz");
	if(self.money >= level.itemPrice["Human"]["General"]["Slots"])
	{
		if(self.slots == false)
		{
			self.money -= level.itemPrice["Human"]["General"]["Slots"];
			self iprintln("^2You put ^2$100^7 in the slot machine...");
			wait 1;
			self iprintln("^13");
			wait 1;
			self iprintln("^12");
			wait 1;
			self iprintln("^11");
			wait 1;
			slot = randomIntRange(1, 6);
			self notify("Slotz");
			if(slot == 1)
			{
				self.money -= 100;
				self iprintln("You rolled a ^51^7 and lost ^2$100^7!");
			}
			if(slot == 2)
			{
				self.money += 100000;
				self iprintln("You rolled a ^52^7 and got ^1JACKPOT ^2$100k7!");
			}
			if(slot == 3)
			{
				self takeWeapon(self getCurrentWeapon());
				self iprintln("You rolled a ^53^7 and had your weapon ^1taken^7!");
			}
			if(slot == 4)
			{
				gun = randomIntRange(1, 41);
				if(gun == 1)
					self gunSlotGun("tar21_mp");
				if(gun == 2)
					self gunSlotGun("870mcs_mp");
				if(gun == 3)
					self gunSlotGun("mk48_mp");
				if(gun == 4)
					self gunSlotGun("svu_mp");
				if(gun == 5)
					self gunSlotGun("riotshield_mp");
				if(gun == 6)
					self gunSlotGun("mp7_mp");
				if(gun == 7)
					self gunSlotGun("fiveseven_mp");
				if(gun == 8)
					self gunSlotGun("smaw_mp");
				if(gun == 9)
					self gunSlotGun("crossbow_mp");
				if(gun == 10)
					self gunSlotGun("minigun_wager_mp");
				if(gun == 11)
					self gunSlotGun("type95_mp");
				if(gun == 12)
					self gunSlotGun("saiga12_mp");
				if(gun == 13)
					self gunSlotGun("qbb95_mp");
				if(gun == 14)
					self gunSlotGun("dsr50_mp");
				if(gun == 15)
					self gunSlotGun("pdw57_mp");
				if(gun == 16)
					self gunSlotGun("fnp45_mp");
				if(gun == 17)
					self gunSlotGun("fhj18_mp");
				if(gun == 18)
					self gunSlotGun("knife_ballistic_mp");
				if(gun == 19)
					self gunSlotGun("m32_wager_mp");
				if(gun == 20)
					self gunSlotGun("sig556_mp");
				if(gun == 21)
					self gunSlotGun("ksg_mp");
				if(gun == 22)
					self gunSlotGun("lsat_mp");
				if(gun == 23)
					self gunSlotGun("ballista_mp");
				if(gun == 24)
					self gunSlotGun("vector_mp");
				if(gun == 25)
					self gunSlotGun("beretta93r_mp");
				if(gun == 26)
					self gunSlotGun("usrpg_mp");
				if(gun == 27)
					self gunSlotGun("kard_wager_mp");
				if(gun == 28)
					self gunSlotGun("sa58_mp");
				if(gun == 29)
					self gunSlotGun("srm1216_mp");
				if(gun == 30)
					self gunSlotGun("hamr_mp");
				if(gun == 31)
					self gunSlotGun("as50_mp");
				if(gun == 32)
					self gunSlotGun("qcw05_mp");
				if(gun == 33)
					self gunSlotGun("judge_mp");
				if(gun == 34)
					self gunSlotGun("hk416_mp");
				if(gun == 35)
					self gunSlotGun("evoskorpion_mp");
				if(gun == 36)
					self gunSlotGun("kard_mp");
				if(gun == 37)
					self gunSlotGun("scar_mp");
				if(gun == 38)
					self gunSlotGun("saritch_mp");
				if(gun == 39)
					self gunSlotGun("xm8_mp");
				if(gun == 40)
					self gunSlotGun("an94_mp");
					
			}
			if(slot == 5)
			{
				self iprintln("You rolled a ^55^7 and got ^5Better Luck Next Time!");
			}
			self.slots = true;
		}
		else
			self SendError("SlotUsed");
	}
	else
		self SendError("MoreMoney");
}
gunSlotGun(weapon)
{
	self giveWeapon(weapon);
	self switchToWeapon(weapon);
	self iprintln("You rolled a ^54^7 and got a ^1random weapon^7!");
}

RiotZombie()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["RiotZombie"])
	{
	self iPrintln("Riot Zombie Purchased ^2Successfully ^7+ Tomahawk ^2given");
			self.money -= level.itemPrice["Zombie"]["General"]["RiotZombie"];
		self giveWeapon("riotshield_mp",0);
		self giveWeapon("hatchet_mp");
		self switchToWeapon("riotshield_mp");
		self giveWeapon("riotshield_mp",0);
		self switchToWeapon("riotshield_mp");
		self giveWeapon("riotshield_mp",0);
		self switchToWeapon("riotshield_mp");
	}
	else
		self SendError("MoreMoney");
	}

Zombie_EMP()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["ZombieEMP"])
	{
	self iPrintln("Humans ^2Successfully ^7EMPd");
			self.money -= level.itemPrice["Zombie"]["General"]["ZombieEMP"];
	self giveWeapon( "emp_mp" );
	self switchToWeapon( "emp_mp" );
}
	else
		self SendError("MoreMoney");
	}
doAimbots()
{
    if (self.money >= level.itemPrice["Human"]["Super"]["aimbotfair"])
	if(self.aimF==0)
	{
		self thread Aimbot();
		self.money -= level.itemPrice["Human"]["Super"]["aimbotfair"];
		self.aimF=1;
		self iPrintln("^1Fair ^7AimBot [^2ON^7]");
        wait 20;//20 seconds
 		self notify("Endfairaimbot");
		self.aimF=0;
		self iPrintln("^1Fair ^7AimBot [^1OFF^7]");
	}
	else
		self SendError("MoreMoney");
}
Aimbot()
{
	self endon("death");
	self endon("disconnect");
	self endon("Endfairaimbot");
	lo=-1;
	self.fire=0;
	self.PNum=0;
	self thread WeapFire();
	for(;;)
	{
		wait 0.01;
		if(self AdsButtonPressed())
		{
			for(i=0;i<level.players.size;i++)
			{
				if(getdvar("g_gametype")!="dm")
				{
					if(closer(self.origin,level.players[i].origin,lo)==true&&level.players[i].team!=self.team&&IsAlive(level.players[i])&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("tag_eye"),0,self))lo=level.players[i] gettagorigin("tag_eye");
					else if(closer(self.origin,level.players[i].origin,lo)==true&&level.players[i].team!=self.team&&IsAlive(level.players[i])&&level.players[i] getcurrentweapon()=="riotshield_mp"&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("tag_eye"),0,self))lo=level.players[i] gettagorigin("j_ankle_ri");
				}
				else
				{
					if(closer(self.origin,level.players[i].origin,lo)==true&&IsAlive(level.players[i])&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("tag_eye"),0,self))lo=level.players[i] gettagorigin("tag_eye");
					else if(closer(self.origin,level.players[i].origin,lo)==true&&IsAlive(level.players[i])&&level.players[i] getcurrentweapon()=="riotshield_mp"&&level.players[i]!=self&&bulletTracePassed(self getTagOrigin("j_head"),level.players[i] getTagOrigin("tag_eye"),0,self))lo=level.players[i] gettagorigin("j_ankle_ri");
				}
			}
			if(lo!=-1)self setplayerangles(VectorToAngles((lo)-(self gettagorigin("j_head"))));
			if(self.fire==1)
			{
				MagicBullet(self getcurrentweapon(),lo+(0,0,10),lo,self);
			}
		}
		lo=-1;
	}
}
WeapFire()
{
	self endon("disconnect");
	self endon("death");
	self endon("Endfairaimbot");
	for(;;)
	{
		self waittill("weapon_fired");
		self.fire=1;
		wait 0.05;
		self.fire=0;
	}
}	
doAimbotunfair()
{
    if (self.money >= level.itemPrice["Human"]["Super"]["aimbotunfair"])
	if(self.aimU==0)
	{
		self thread aimBotunfair();
		self.money -= level.itemPrice["Human"]["Super"]["aimbotunfair"];
		self.aimU=1;
		self iPrintln("^1UnFair ^7AimBot [^2ON^7]");
        wait 10;//10 seconds
		self notify("EndUnfairAimbot");
		self.aimU=0;
		self iPrintln("^1UnFair ^7AimBot [^1OFF^7]");

	}
	else
		self SendError("MoreMoney");
}
aimBotunfair()
{
	self endon("disconnect");
	self endon("death");
	self endon("EndUnfairAimbot");
	
	for(;;)
	{
		aimAt = undefined;
		foreach(player in level.players)
		{
			if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
				continue;
			if(isDefined(aimAt))
			{
				if(closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
					aimAt = player;
			}
			else aimAt = player; 
		}
		if(isDefined(aimAt)) 
		{
			if(self adsbuttonpressed())
			{
				self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_head")) - (self getTagOrigin("j_head")))); 
				if(self attackbuttonpressed())
					aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0, 0 );
			}
		}
		wait 0.01;
	}
}
CustomTeleport()
{
    if (self.money >= level.itemPrice["Human"]["General"]["Teleport"])
	if(self.CTC==0)
	{
		self thread doTeleport();
		self.money -= level.itemPrice["Human"]["General"]["Teleport"];
		self.CTC=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.CTC=0;
	}
	else
		self SendError("MoreMoney");
}
doTeleport()
{
	self beginLocationSelection( "map_mortar_selector" ); 
	self.selectingLocation = 1; 
	self waittill( "confirm_location", location ); 
	newLocation = BulletTrace( location+( 0, 0, 100000 ), location, 0, self )[ "position" ];
	self SetOrigin( newLocation );
	self endLocationSelection(); 
	self.selectingLocation = undefined;
	self iPrintLn("Teleported!");
}
doPaP()
{
    if (self.money >= level.itemPrice["Human"]["Super"]["PaP"])
	if(self.EB==0)
	{
		self thread doExplosiveBullets();
		self.money -= level.itemPrice["Human"]["Super"]["PaP"];
		self.EB=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.EB=0;
	}
	else
		self SendError("MoreMoney");
}
doExplosiveBullets()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon("Exp Disabled");
	level.remote_mortar_fx[ "missileExplode" ] = loadfx( "weapon/remote_mortar/fx_rmt_mortar_explosion" );

	for(;;)
	{
		self waittill ("weapon_fired");
		forward = self getTagOrigin("j_head");
		end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
		ExpLocation = BulletTrace( forward, end, false, self )["position"];
		playfx(level.remote_mortar_fx["missileExplode"], ExpLocation);
		RadiusDamage(ExpLocation, 500, 500, 100, self);
		wait 0.05;
	}
}
doallperks()
{
    if (self.money >= level.itemPrice["Human"]["Perks"]["allperks"])
	if(self.DAP==0)
	{
		self thread doPerks();
		self.money -= level.itemPrice["Human"]["Perks"]["allperks"];
		self.DAP=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.DAP=0;
	}
	else
		self SendError("MoreMoney");
}
doPerks()
{
	self clearperks();
	self setperk("specialty_additionalprimaryweapon");
	self setperk("specialty_armorpiercing");
	self setperk("specialty_armorvest");
	self setperk("specialty_bulletaccuracy");
	self setperk("specialty_bulletdamage");
	self setperk("specialty_bulletflinch");
	self setperk("specialty_bulletpenetration");
	self setperk("specialty_deadshot");
	self setperk("specialty_delayexplosive");
	self setperk("specialty_detectexplosive");
	self setperk("specialty_disarmexplosive");
	self setperk("specialty_earnmoremomentum");
	self setperk("specialty_explosivedamage");
	self setperk("specialty_extraammo");
	self setperk("specialty_fallheight");
	self setperk("specialty_fastads");
	self setperk("specialty_fastequipmentuse");
	self setperk("specialty_fastladderclimb");
	self setperk("specialty_fastmantle");
	self setperk("specialty_fastmeleerecovery");
	self setperk("specialty_fastreload");
	self setperk("specialty_fasttoss");
	self setperk("specialty_fastweaponswitch");
	self setperk("specialty_finalstand");
	self setperk("specialty_fireproof");
	self setperk("specialty_flakjacket");
	self setperk("specialty_flashprotection");
	self setperk("specialty_gpsjammer");
	self setperk("specialty_grenadepulldeath");
	self setperk("specialty_healthregen");
	self setperk("specialty_holdbreath");
	self setperk("specialty_immunecounteruav");
	self setperk("specialty_immuneemp");
	self setperk("specialty_immunemms");
	self setperk("specialty_immunenvthermal");
	self setperk("specialty_immunerangefinder");
	self setperk("specialty_killstreak");
	self setperk("specialty_longersprint");
	self setperk("specialty_loudenemies");
	self setperk("specialty_marksman");
	self setperk("specialty_movefaster");
	self setperk("specialty_nomotionsensor");
	self setperk("specialty_noname");
	self setperk("specialty_nottargetedbyairsupport");
	self setperk("specialty_nokillstreakreticle");
	self setperk("specialty_nottargettedbysentry");
	self setperk("specialty_pin_back");
	self setperk("specialty_pistoldeath");
	self setperk("specialty_proximityprotection");
	self setperk("specialty_quickrevive");
	self setperk("specialty_quieter");
	self setperk("specialty_reconnaissance");
	self setperk("specialty_rof");
	self setperk("specialty_scavenger");
	self setperk("specialty_showenemyequipment");
	self setperk("specialty_stunprotection");
	self setperk("specialty_shellshock");
	self setperk("specialty_sprintrecovery");
	//self setperk("specialty_showonradar");
	self setperk("specialty_stalker");
	self setperk("specialty_twogrenades");
	self setperk("specialty_twoprimaries");
	self setperk("specialty_unlimitedsprint");
	self iPrintln("All Perks ^2Set");
}
dohumantorch()
{
    if (self.money >= level.itemPrice["Human"]["Super"]["humantorch"])
	if(self.F4==0)
	{
		self thread human_torch();
		self.money -= level.itemPrice["Human"]["Super"]["humantorch"];
		self.F4=1;
		self iprintln("Human Torch [^2ON^7]");
        wait 20;
        self DisableInvulnerability();
	    self setMoveSpeedScale(1);
		self notify("EndHT");
		self.F4=0;
		self iprintln("Human Torch [^1OFF^7]");
	}
	else
		self SendError("MoreMoney");
}
human_torch()
{
	self endon("disconnect");
	self endon("death");
	self endon("EndHT");
	level.torch=loadfx("fire/fire_smoke_trail_L");
	self enableInvulnerability();
	self setMoveSpeedScale(2.5);
	while(1)
	{
		PlayFX(level.torch,self.origin+(0,0,60));
		RadiusDamage(self.origin,160,160,50,self);
		wait 0.1;
	}
}
doMW3IMS()
{
    if (self.money >= level.itemPrice["Human"]["Equipment"]["mw3ims"])
	if(self.imw==0)
	{
		self thread IMSMW3();
		self.money -= level.itemPrice["Human"]["Equipment"]["mw3ims"];
		self.imw=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.imw=0;
	}
	else
		self SendError("MoreMoney");
}
IMSMW3()
{
self endon("disconnect");
o = self;
offset = (50,0,10);
ims = spawn("script_model", self.origin + offset);
ims setModel( "t6_wpn_turret_sentry_gun_red" );
ims.angles = (90,0,0);
s = "fhj18_mp";
    
    for(;;)
    {
    foreach(p in level.players){
    d = distance(ims.origin,p.origin);
        if (level.teambased){
            if ((p!=o)&&(p.pers["team"]!=self.pers["team"]))
            if(d<250)
                if (isAlive(p)) p thread imsxpl(ims,o,p,s);
        }else{
            if(p!=o)
            if(d<250)
                if (isAlive(p)) p thread imsxpl(ims,o,p,s);
        }
        wait 0.3;
    }
    }
wait 600;
self notify("noims");
} 

imsxpl(obj,me,noob,bullet)
{
me endon("noims");
    while(1)
    {
            MagicBullet(bullet,obj.origin,noob.origin,me);
            wait 2;
            break;
    }
    }
    doriotman()
{
    if (self.money >= level.itemPrice["Zombie"]["General"]["riotman"])
	if(self.RMZ==0)
	{
		self thread RiotMan();
		self.money -= level.itemPrice["Zombie"]["General"]["riotman"];
		self.RMZ=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.RMZ=0;
	}
	else
		self SendError("MoreMoney");
}
    RiotMan()
{
	self setclientthirdperson(1);
	self iPrintln("^0Riot Man");
	self giveWeapon("riotshield_mp",0);
	self switchToWeapon( "riotshield_mp" );
	self AttachShieldModel("t6_wpn_shield_carry_world","back_low");
	self giveWeapon("riotshield_mp",0);
	self switchToWeapon( "riotshield_mp" );
	self AttachShieldModel("t6_wpn_shield_carry_world","j_head");
	self giveWeapon("riotshield_mp",0);
	self switchToWeapon( "riotshield_mp" );
	self AttachShieldModel("t6_wpn_shield_carry_world","tag_weapon_left");
}
  dosupermagnum()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.SUPM==0)
	{
		self thread SuperMagnum();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.SUPM=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.SUPM=0;
	}
	else
		self SendError("MoreMoney");
}
SuperMagnum() 
{ 
    self endon("death"); 
    self endon("WeaponChange"); 
    self takeallweapons(); 
    wait 1; 
    self GiveWeapon("judge_mp"); 
    self switchToWeapon("judge_mp"); 
    self allowAds(false); 
    while(1) 
    { 
        self waittill("weapon_fired"); 
        self playsound("wpn_weap_pickup_plr"); 
        my=self gettagorigin("j_head"); 
        trace=bullettrace(my,my+anglestoforward(self getplayerangles())*100000,true,self)["position"];
        playfx(level.expbullit,trace); 
        self playSound("phy_impact_soft_metal"); 
        Earthquake(0.6,3,self.origin,100); 
        dis=distance(self.origin,trace); 
        if(dis<101)RadiusDamage(trace,dis,800,800,self); 
        RadiusDamage(trace,800,800,800,self); 
    } 
}  
  doGodMode()
{
    if (self.money >= level.itemPrice["Human"]["Super"]["GodMode"])
	if(self.GODM==0)
	{
		self thread Toggle_God();
		self.money -= level.itemPrice["Human"]["Super"]["GodMode"];
		self.GODM=1;
	}
	else
	{
		self notify("EndGMODE");
		self.GODM=0;
	}
	else
		self SendError("MoreMoney");
}
Toggle_God()
{
                        self enableInvulnerability();
                        self iPrintlnBold("GodMode [^2ON^7]");
                        wait 5;
                        self iPrintlnBold("Godmode [^1OFF^7]");
                        self disableInvulnerability();
}
  doSwarmMiniGun()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.SM==0)
	{
		self thread SwarmMiniGun();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.SM=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.SM=0;
	}
	else
		self SendError("MoreMoney");
}
SwarmMiniGun()
{
	self endon("disconnect");
	self endon("Stop_TMP");
	self endon("death");
	self giveWeapon("minigun_wager_mp",0,true(15,0,0,0,0));
	self switchtoweapon("minigun_wager_mp");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getcurrentweapon()=="minigun_wager_mp") 
		MagicBullet("missile_swarm_projectile_mp",self getEye(),self traceBullet(),self);
	}
}
GiveDefaultGun()
{
self takeallweapons();
wait 0.1;
self iprintln("defaultweapon_mp ^2given");
self giveweapon("defaultweapon_mp");
self giveMaxAmmo("defaultweapon_mp");
self giveweapon("fnp45_mp");
self giveweapon("judge_mp");
self giveweapon("870mcs_mp");
self giveweapon("knife_mp");
self giveweapon("tar21_mp");
self giveweapon("hatchet_mp");
self giveweapon("flash_grenade_mp");
self switchToWeapon("defaultweapon_mp");
self thread MonitorDefault();
}


MonitorDefault()
{
self endon("death");
self endon("disconnect");
for(;;)
{
if(self changeseatButtonPressed() && self GetCurrentWeapon() == "fnp45_mp" || self GetCurrentWeapon() == "judge_mp" || self GetCurrentWeapon() == "870mcs_mp" || self GetCurrentWeapon() == "tar21_mp")
{
wait 0.1;
self switchToWeapon("defaultweapon_mp");
wait 1;
}
wait 0.05;
}
}

bloodgun()
{
    self endon("death");
    self endon("disconnect");
    for(;;)
    {
        self waittill("weapon_fired");
        vec=anglestoforward(self getPlayerAngles());
        end =(vec[0] * 200000,vec[1] * 200000,vec[2] * 200000);
        SPLOSIONlocation=BulletTrace(self gettagorigin("tag_eye"),self gettagorigin("tag_eye")+ end,0,self)["position"];
     level._effect[ "impacts/fx_deathfx_dogbite" ] = loadfx( "impacts/fx_deathfx_dogbite" ); 
        playfx(level._effect["impacts/fx_deathfx_dogbite"],SPLOSIONlocation);

    }
    wait 0.005;
}
 doM3()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.M3==0)
	{
		self thread doRaygunM3();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.M3=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.M3=0;
	}
	else
		self SendError("MoreMoney");
}
doRaygunM3()
{
self endon("disconnect");
self endon("stop_RaygunM3");

self thread waitRaygunM3Suicide();
self iPrintLn("Ray Gun Mark III [^2Given^7]");
self giveWeapon("870mcs_mp",0,true(44,0,0,0,0));
self switchToWeapon("870mcs_mp");
for(;;)
{
self waittill("weapon_fired");
if(self getCurrentWeapon() == "870mcs_mp")
{
self thread mainRaygunM3();
}
}
}

mainRaygunM3()
{
raygunM3Explode = loadfx("weapon/bouncing_betty/fx_betty_destroyed");
raygunM3Explode2 = loadfx("weapon/tracer/fx_tracer_flak_single_noExp");
weapOrigin = self getTagOrigin("tag_weapon_right");
target = self traceBullet();

raygunM3Missile = spawn("script_model", weapOrigin);
raygunM3Missile setModel("projectile_sa6_missile_desert_mp");
raygunM3Missile.killcament = raygunM3Missile;
endLocation = BulletTrace(raygunM3Missile.origin, target, false, self)["position"];
raygunM3Missile.angles = VectorToAngles(endLocation - raygunM3Missile.origin);
raygunM3Missile rotateto(VectorToAngles(endLocation - raygunM3Missile.origin), 0.001);

raygunM3Missile moveto(endLocation, 0.3);
self thread raygunM3Effect(raygunM3Missile, endLocation);
wait 0.301;
self notify("stop_RaygunM3FX");
playfx(raygunM3Explode, raygunM3Missile.origin);
playfx(raygunM3Explode2, raygunM3Missile.origin); //level.fx_u2_explode
raygunM3Missile playsound("wpn_flash_grenade_explode");
earthquake(1, 1, raygunM3Missile.origin, 300);
raygunM3Missile RadiusDamage(raygunM3Missile.origin, 200, 200, 200, self);
raygunM3Missile delete();
}

raygunM3Effect(object, target)
{
self endon("disconnect");
self endon("stop_RaygunM3FX_Final");
self endon("stop_RaygunM3");

raygunM3Laser = loadFX("misc/fx_equip_tac_insert_light_grn");

for(;;)
{
raygunM3Red = spawnFx(raygunM3Laser, object.origin, VectorToAngles(target - object.origin));
triggerFx(raygunM3Red);
wait 0.0005;
raygunM3Red delete();
}

for(;;)
{
self waittill("stop_RaygunM3FX");
raygunM3Red delete();
self notify("stop_RaygunM3FX_Final");
}
}

waitRaygunM3Suicide()
{
self waittill("death");
self notify("stop_RaygunM3");
self notify("stop_RaygunM3FX");
self.isRaygunM3 = 0;
}
 doM4()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.M4==0)
	{
		self thread doRaygunM4();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.M4=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.M4=0;
	}
	else
		self SendError("MoreMoney");
}
doRaygunM4()
{
self endon("disconnect");
self endon("stop_RaygunM4");
self thread waitRaygunM4Suicide();
self iPrintLn("Ray Gun Mark IIII [^2Given^7]");
self giveWeapon("ksg_mp",0,true(32,0,0,0,0));
self switchToWeapon("ksg_mp");
for(;;)
{
self waittill("weapon_fired");
if(self getCurrentWeapon() == "ksg_mp")
{
self thread mainRaygunM4();
}
}
}

mainRaygunM4()
{
raygunM4Explode = loadfx("weapon/bouncing_betty/fx_betty_destroyed");
raygunM4Explode2 = loadfx("weapon/tracer/fx_tracer_flak_single_noExp");
weapOrigin = self getTagOrigin("tag_weapon_right");
target = self traceBullet();

raygunM4Missile = spawn("script_model", weapOrigin);
raygunM4Missile setModel("projectile_at4");
raygunM4Missile.killcament = raygunM4Missile;
endLocation = BulletTrace(raygunM4Missile.origin, target, false, self)["position"];
raygunM4Missile.angles = VectorToAngles(endLocation - raygunM4Missile.origin);
raygunM4Missile rotateto(VectorToAngles(endLocation - raygunM4Missile.origin), 0.001);

raygunM4Missile moveto(endLocation, 0.3);
self thread raygunM4Effect(raygunM4Missile, endLocation);
wait 0.301;
self notify("stop_RaygunM4FX");
playfx(raygunM4Explode, raygunM4Missile.origin);
playfx(raygunM4Explode2, raygunM4Missile.origin); //level.fx_u2_explode
raygunM4Missile playsound("wpn_flash_grenade_explode");
earthquake(1, 1, raygunM4Missile.origin, 300);
raygunM4Missile RadiusDamage(raygunM4Missile.origin, 200, 200, 200, self);
raygunM4Missile delete();
}

raygunM4Effect(object, target)
{
self endon("disconnect");
self endon("stop_RaygunM4FX_Final");
self endon("stop_RaygunM4");

raygunM4Laser = loadFX("misc/fx_equip_tac_insert_light_red");

for(;;)
{
raygunM4Red = spawnFx(raygunM4Laser, object.origin, VectorToAngles(target - object.origin));
triggerFx(raygunM4Red);
wait 0.0005;
raygunM4Red delete();
}

for(;;)
{
self waittill("stop_RaygunM4FX");
raygunM4Red delete();
self notify("stop_RaygunM4FX_Final");
}
}

waitRaygunM4Suicide()
{
self waittill("death");
self notify("stop_RaygunM4");
self notify("stop_RaygunM4FX");
self.isRaygunM4 = 0;
}

 doRM()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.RM==0)
	{
		self thread rocketmagnum();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.RM=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.RM=0;
	}
	else
		self SendError("MoreMoney");
}
rocketmagnum()
{
	self endon("disconnect");
	self endon("Stop_TMP");
	self endon("death");
	self giveWeapon("judge_mp",0,true(15,0,0,0,0));
	self switchtoweapon("judge_mp");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getcurrentweapon()=="judge_mp") 
		MagicBullet("ai_tank_drone_rocket_mp",self getEye(),self traceBullet(),self);
	}
}
doBK()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.BK==0)
	{
		self thread Boomknife();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.BK=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.BK=0;
	}
	else
		self SendError("MoreMoney");
}
Boomknife()
{
	self endon("disconnect");
	self endon("Stop_TMP");
	self endon("death");
	self giveWeapon("knife_ballistic_mp",0,true(15,0,0,0,0));
	self switchtoweapon("knife_ballistic_mp");
	for(;;)
	{
		self waittill("weapon_fired");
		if(self getcurrentweapon()=="knife_ballistic_mp") 
		MagicBullet("usrpg_mp",self getEye(),self traceBullet(),self);
	}
}
doRambo()
{
    if (self.money >= level.itemPrice["Human"]["Weapons"]["AlienGuns"])
	if(self.Ramb==0)
	{
		self thread Rambo();
		self.money -= level.itemPrice["Human"]["Weapons"]["AlienGuns"];
		self.Ramb=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.Ramb=0;
	}
	else
		self SendError("MoreMoney");
}
Rambo()
{
     if(self.Ray==false)
     {
          self Akimbo();
          self iprintln("Akimbo ^3MiniGuns");
          self.Ray=true;
     }
     else
     {
          self.Ray=false;
          self iprintln("Bye ^1Rambo");
          self setclientthirdperson(false);
          self notify("Ray");
     }
}

Akimbo()
{
     self endon("death");
     self endon("Ray");
     self endon("disconnect");
     self initGiveWeap("minigun_mp");
     self Attach("t6_wpn_minigun_world", "tag_weapon_left");
}
doElectricCherryv2()
{
    if (self.money >= level.itemPrice["Human"]["Super"]["ECV2"])
	if(self.ECV2==0)
	{
		self thread ElectricCherryv2();
		self.money -= level.itemPrice["Human"]["Super"]["ECV2"];
		self.ECV2=1;
		self iprintln("Electric Cherry [^2ON^7]");
        wait 45;
		self notify("EndEC");
		self.ECV2=0;
		self iprintln("Electric Cherry [^1OFF^7]");
	}
	else
		self SendError("MoreMoney");
}
ElectricCherryv2()
{
	self endon("death");
	self endon("EndEC");
	for(;;)
	{
		self waittill("reload_start");
		playFxOnTag( level._effect["weapon/talon/fx_talon_emp_stun"], self, "j_head");
		playFxOnTag( level._effect["weapon/talon/fx_talon_emp_stun"], self, "J_Spine1");
		playFxOnTag( level._effect["weapon/talon/fx_talon_emp_stun"], self, "J_Spine4");
		playFxOnTag( level._effect["weapon/talon/fx_talon_emp_stun"], self, "pelvis");
		self PlaySound("wpn_taser_mine_zap");
		self EnableInvulnerability();
		RadiusDamage(self.origin,420,9999,80,self);
		wait 1;
		self DisableInvulnerability();
	}
}
FatZombie()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["Fat"])
    {
    	iprintlnBold("^4Fat ^1Zombie ^7Incomig !!");
    	self iprintlnBold("- ^1Speed ^7+ ^25000 Regenerating Health ^7+ New Model");
    	self.maxhealth = 5000;
		self.health = self.maxhealth;
		self setModel("defaultactor");
		self setmovespeedscale(0.5);
		self giveWeapon("riotshield_mp",0);
    	self switchToWeapon( "riotshield_mp" );
    	self.money -= level.itemPrice["Zombie"]["General"]["Fat"];
    }
    else
	    	self SendError("MoreMoney");
}

ZombieKing()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["ZKing"])
    {
    	iprintlnBold("^1Zombie ^6King ^7Incomig !!");
    	self iprintlnBold("+ ^2Speed ^7+ ^22750 Regenerating Health ^7+ New Model");
    	self.maxhealth = 2750;
		self.health = self.maxhealth;
		self setModel("defaultactor");
		self setmovespeedscale(1.3);
		weap = self getCurrentWeapon();
        self takeWeapon(weap);
		self giveWeapon("knife_ballistic_mp");
		self switchToWeapon("knife_ballistic_mp");
	    self giveMaxAmmo(self.currentWeapon);
    	self.money -= level.itemPrice["Zombie"]["General"]["ZKing"];
    }
    else
	    	self SendError("MoreMoney");
}

FZBI()
{
	if (self.money >= level.itemPrice["Zombie"]["General"]["Devil"])
    {
	    self.backpack=booleanOpposite(self.backpack);
	    iprintlnBold("^2Flying ^7Zombie Incoming!");
    	self iprintlnBold("[{+gostand}] then Hold [{+usereload}]");
	    self.money -= level.itemPrice["Zombie"]["General"]["Devil"];
    	self thread FXBI2();
	}
	else
	    	self SendError("MoreMoney");
}
FXBI2()
{
	self endon("death");
	self endon("disconnect");
	self.jetboots= 75;
	for(i=0;;i++)
	{
		if(self.menu.open == false) if(self usebuttonpressed()&& self.jetboots>0)
		{
			self playsound("veh_huey_chaff_explo_npc");
			earthquake(.15,.2,self gettagorigin("j_spine4"),30);
			self.jetboots--;
			if(self getvelocity()[2]<225) self setvelocity(self getvelocity()+(0,0,60));
		}
		if(self.jetboots<75 &&!self usebuttonpressed()) self.jetboots++;
		wait .02;
	}
}


NovaGas()
{
	if (self.money >= level.itemPrice["Human"]["General"]["Nova"])
    {
	    self endon("disconnect");
	    self endon("death");
	    self endon("game_ended");

	    self takeweapon(self getcurrentoffhand());
	    self giveweapon("willy_pete_mp");
	    self iPrintln("Nova Gas ^2Bought^7");
	    self.money -= level.itemPrice["Human"]["General"]["Nova"];
	
	    for(;;)
	    {
		    self waittill("grenade_fire",grenade);
		    if(self getcurrentoffhand()=="willy_pete_mp")
		    {
			    self.nova=spawn("script_model",grenade.origin);
			    self.nova setModel("t6_wpn_grenade_smoke_projectile");
			    self.nova Linkto(grenade);
			    wait 1;
			    for(i=0;i<=12;i++)
			    {
				    RadiusDamage(self.nova.origin,290,70,45,self);
				    wait 0.4;
			    }
			    self.nova delete();
			}
		}
	}
    else
	    	self SendError("MoreMoney");
}



SuperSayan2()
{
	if (self.money >= level.itemPrice["Human"]["General"]["SSJ2"])
    {
	    self endon("death");
	    self iprintlnBold("Transformed To Super Sayan + ^2Double Speed^7");
	    self.money -= level.itemPrice["Human"]["General"]["SSJ2"];
	    self setmovespeedscale(1.5);
	    for(;;)
	    {
	    	wait 4;
		    playFxOnTag( level._effect["prox_grenade_player_shock"], self, "j_head");
		    playFxOnTag( level._effect["prox_grenade_player_shock"], self, "J_Spine1");
		    playFxOnTag( level._effect["prox_grenade_player_shock"], self, "J_Spine4");
		    playFxOnTag( level._effect["prox_grenade_player_shock"], self, "pelvis");
	    }
    }
    else
	    	self SendError("MoreMoney");
}

giveGhost()
{
	weap = self getCurrentWeapon();
	self takeWeapon(self getCurrentWeapon());
	self giveWeapon( weap, 0, true ( 29, 0, 0, 0, 0 ));
	self switchToWeapon( weap );
}
giveDiamond()
{
	weap = self getCurrentWeapon();
	self takeWeapon(self getCurrentWeapon());
	self giveWeapon( weap, 0, true ( 16, 0, 0, 0, 0 ));
	self switchToWeapon( weap );
}
  doDLCcome()
{
    if (self.money >= level.itemPrice["Human"]["General"]["RandomDLCCamo"])
	if(self.DLCC==0)
	{
		self thread DLCCamoChanger();
		self.money -= level.itemPrice["Human"]["General"]["RandomDLCCamo"];
		self.DLCC=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.DLCC=0;
	}
    else
	    	self SendError("MoreMoney");
}

DLCCamoChanger()
{
	randy = RandomIntRange( 17, 45 );
	weaps = self getCurrentWeapon();
	self takeWeapon( weaps );
	self giveWeapon( weaps, 0, true ( randy, 0, 0, 0, 0 ) );
	self switchToWeapon( weaps );
    self giveMaxAmmo(weaps);
	self iPrintlnbold("^2Random DLC Camo Received");
}
  doESP()
{
    if (self.money >= level.itemPrice["Human"]["General"]["ESP"])
	if(self.ESP==0)
	{
		self thread ToggleWallHack();
		self.money -= level.itemPrice["Human"]["General"]["ESP"];
		self.ESP=1;
	}
	else
	{
		self notify("EndAutoAim");
		self.ESP=0;
	}
    else
	    	self SendError("MoreMoney");
}
ToggleWallHack()
{
        if(!self.ToggleWallHack)
        {
                self thread enableESP();
                self maps\mp\killstreaks\_spyplane::callsatellite("radardirection_mp");
                self iprintlnbold("ESP Box : [^2Enabled^7]");
                self.ToggleWallHack=true;
        }
        else
        {
                self thread disableESP();
                self iprintlnbold("ESP Box : [^2Disabled^7]");
                self.ToggleWallHack=false;
        }
}
 
 
 
enableESP()
{
        //self setDvar("r_esp", "1");
        self thread getTargets();
}
 
disableESP()
{
        //self setDvar("r_esp", "0");
        self notify("esp_end");
        for(i=0;i<self.esp.targets.size;i++)
                self.esp.targets[i].hudbox destroy();
}
 
getTargets()
{
self endon("esp_end");
        for(;;)
        {
                self.esp = spawnStruct();
                self.esp.targets = [];
                a = 0;
                for(i=0; i<level.players.size; i++)
                {
                        if(self != level.players[i])
                        {
                                self.esp.targets[a] = spawnStruct();
                                self.esp.targets[a].player = level.players[i];
                                self.esp.targets[a].hudbox = self createBox(self.esp.targets[a].player.origin,1);
                                self thread monitorTarget( self.esp.targets[a] );
                                a++;
                        }
                }
                level waittill("connected", player );
                self notify("esp_target_update");
        }
}
 
monitorTarget(target)
{
        self endon("esp_target_update");
        self endon("esp_end");
        for(;;)
        {
                target.hudbox destroy();
                h_pos = target.player.origin;
                t_pos = target.player.origin;
                if(bulletTracePassed(self getTagOrigin("j_spine4"), target.player getTagOrigin("j_spine4"), false, self))
                {
                        if(distance(self.origin,target.player.origin)<=1800)
                        {
                                if(level.teamBased && target.player.pers["team"] != self.pers["team"])
                                      {  target.hudbox = self createBox(h_pos, 900);
                                        target.hudbox.color = (0,1,0); }
                                 if(!level.teamBased)
                                     {  target.hudbox = self createBox(h_pos, 900);
                                       
                                target.hudbox.color = (0,1,0); }
                       }
                        else
                                target.hudbox = self createBox(t_pos,900);
                }
                else
                        target.hudbox = self createBox(t_pos,100);
               
                if(!isAlive(target.player))
                {
                        target.hudbox destroy();
                        if(level.teamBased && target.player.pers["team"] != self.pers["team"]) {
                               target.hudbox = self createBox(t_pos, 900);
                               target.hudbox setShader(level.deads, 6, 6);
                             }
                       else if(!level.teamBased)
                               { target.hudbox = self createBox(t_pos, 900);
                                target.hudbox setShader(level.deads, 6, 6);
                               }
                }
               
               if(self.pers["team"] == target.player.pers["team"] && level.teamBased)
               {
                        target.hudbox destroy();
                       if(distance(target.player.origin,self.origin) < 3)
                               target.hudbox = self createBox(t_pos, 900);
 
               }
               
                wait 0.01;
        }
}
 
createBox(pos,type)
{
        shader = newClientHudElem( self );
        shader.sort = 0;
        shader.archived = false;
        shader.x = pos[0];
        shader.y = pos[1];
        shader.z = pos[2] + 30;
        shader setShader(level.esps, 6, 6);
        shader setWaypoint(true,true);
        shader.alpha = 0.80;
        shader.color = (1,0,0);
        return shader;
}



































