godmodeToggle()
{
	if(self.godmodeToggle == false)
	{
		self.godmodeToggle = true;
		self printToggle("Godmode", 1);
		self EnableInvulnerability();
	}
	else
	{
		self.godmodeToggle = false;
		self printToggle("Godmode", 2);
		self DisableInvulnerability();
	}
}

allPerksToggle()
{
	if(self.allPerksToggle == false)
	{
		self.allPerksToggle = true;
		self iprintln("All Perks ^2Given");
		
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
		self setperk("specialty_showonradar");
		self setperk("specialty_stalker");
		self setperk("specialty_twogrenades");
		self setperk("specialty_twoprimaries");
		self setperk("specialty_unlimitedsprint");
	}
	else
	{
		self.allPerksToggle = false;
		self iprintln("All Perks ^1Taken");
		self clearperks();
	}
}

forgeModeToggle()
{
	self endon("disconnect");
	self endon("stopForgeMode");
			
	if(self.forgeModeToggle == false)
	{
		self.forgeModeToggle = true;
		self printToggle("Forge Mode", 1);
		self iprintln("Press [{+speed_throw}] to move objects");
		self iprintln("Press [{+attack}] to spawn carepackages");
				
		for(;;)
		{
			while(self adsbuttonpressed())
			{
				trace=bulletTrace(self GetTagOrigin("j_head"),self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 1000000,true,self);
				while(self adsbuttonpressed())
				{
					trace["entity"] setOrigin(self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 200);
					trace["entity"].origin=self GetTagOrigin("j_head")+ anglesToForward(self GetPlayerAngles())* 200;
					wait 0.05;
				}
			}
			if(self attackbuttonpressed())
			self spawnCarePackage();
			wait 0.05;
		}
	}
	else
	{
		self.forgeModeToggle = false;
		self printToggle("Forge Mode", 2);
					
		self notify("stopForgeMode");
	}
}

hearallplayers()
{
	if (self.hearall==false)
	{
		self printToggle("Hear All", 1);
		setmatchtalkflag( "EveryoneHearsEveryone", 1 );
		self.hearall=true;
	}
	else
	{
		self printToggle("Hear All", 2);
		setmatchtalkflag( "EveryoneHearsEveryone", 0 );
		self.hearall=false;
	}
}

supplyDrop()
{
	self takeAllWeapons();
	self giveWeapon("hk416_mp");
	self dropItem("hk416_mp");
	wait 0.3;
	self giveWeapon("870mcs_mp");
	self dropItem("870mcs_mp");
	wait 0.3;
	self giveWeapon("mk48_mp");
	self dropItem("mk48_mp");
	wait 0.3;
	self giveWeapon("dsr50_mp");
	self dropItem("dsr50_mp");
	wait 0.3;
	self giveWeapon("mp7_mp");
	self dropItem("mp7_mp");
	wait 0.3;
	self giveWeapon("hk416_mp");
	self giveWeapon("fiveseven_mp");
	self giveWeapon("satchel_charge_mp");
	self giveWeapon("knife_mp");
	self switchToWeapon("hk416_mp");
}

ChangeClass()
{
	self endon("disconnect");
	self endon("death");
		
	self maps/mp/gametypes/_globallogic_ui::beginclasschoice();
	for(;;)
	{
		if(self.pers[ "changed_class" ])
			self maps/mp/gametypes/_class::giveloadout( self.team, self.class );
		wait 0.05;
	}
}
BigXP()
{
	self endon("disconnect");
	level endon("game_ended");

	if(level.BigXP==false)
	{
		level.BigXP=true;
		self iPrintln("XP LOBBY++ ^2ON");
		maps\mp\gametypes\_rank::registerScoreInfo("kill",1337);
		maps\mp\gametypes\_rank::registerScoreInfo("suicide",1337);
	}
	else
	{
		level.BigXP=false;
		self iPrintln("XP LOBBY++ ^1OFF");
		maps\mp\gametypes\_rank::registerScoreInfo("kill",100);
		maps\mp\gametypes\_rank::registerScoreInfo("suicide",100);
	}
}

giveAllCash(ammount)
{
	self iprintln("^7You have given ^5All Players ^2$" + ammount);
	foreach(player in level.players)
	{
	    player.money += ammount;
	    player iprintln("^5" + level.hostname + "^7 has given you ^2$" + ammount);
	}
}

giveAllHealth(ammount)
{
	self iprintln("^7You have given ^5All Players ^7" + ammount + " ^1health");
	foreach(player in level.players)
	{
	    player.health += ammount;
	    player.maxhealth = player.health;
	    if (!player.healthMonitor)
		    player thread MonitorHealth();
	    player iprintln("^5" + level.hostname + "^7 has given you ^7 " + ammount + " ^1health");
	}
}

FreezeThePS3(player)
{
    player iPrintLnBold("Learn to Play");
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
	player iprintlnbold("^HO");
	wait 0.01;
}
teletome(player)
{
	if(!player isHost())
	{
		self iPrintln(player.name + " Teleported to you");
		player SetOrigin(self.origin);
	}
}
givePlayerSwat(weapon, player)
{
	player takeAllWeapons();
	player giveWeapon(weapon);
	player giveWeapon("riotshield_mp");
	player giveWeapon("satchel_charge_mp");
	player switchToWeapon(weapon);
	
	player clearperks();
	player setperk("specialty_additionalprimaryweapon");
	player setperk("specialty_armorpiercing");
	player setperk("specialty_armorvest");
	player setperk("specialty_bulletaccuracy");
	player setperk("specialty_bulletdamage");
	player setperk("specialty_bulletflinch");
	player setperk("specialty_bulletpenetration");
	player setperk("specialty_deadshot");
	player setperk("specialty_delayexplosive");
	player setperk("specialty_detectexplosive");
	player setperk("specialty_disarmexplosive");
	player setperk("specialty_earnmoremomentum");
	player setperk("specialty_explosivedamage");
	player setperk("specialty_extraammo");
	player setperk("specialty_fallheight");
	player setperk("specialty_fastads");
	player setperk("specialty_fastequipmentuse");
	player setperk("specialty_fastladderclimb");
	player setperk("specialty_fastmantle");
	player setperk("specialty_fastmeleerecovery");
	player setperk("specialty_fastreload");
	player setperk("specialty_fasttoss");
	player setperk("specialty_fastweaponswitch");
	player setperk("specialty_finalstand");
	player setperk("specialty_fireproof");
	player setperk("specialty_flakjacket");
	player setperk("specialty_flashprotection");
	player setperk("specialty_gpsjammer");
	player setperk("specialty_grenadepulldeath");
	player setperk("specialty_healthregen");
	player setperk("specialty_holdbreath");
	player setperk("specialty_immunecounteruav");
	player setperk("specialty_immuneemp");
	player setperk("specialty_immunemms");
	player setperk("specialty_immunenvthermal");
	player setperk("specialty_immunerangefinder");
	player setperk("specialty_killstreak");
	player setperk("specialty_longersprint");
	player setperk("specialty_loudenemies");
	player setperk("specialty_marksman");
	player setperk("specialty_movefaster");
	player setperk("specialty_nomotionsensor");
	player setperk("specialty_noname");
	player setperk("specialty_nottargetedbyairsupport");
	player setperk("specialty_nokillstreakreticle");
	player setperk("specialty_nottargettedbysentry");
	player setperk("specialty_pin_back");
	player setperk("specialty_pistoldeath");
	player setperk("specialty_proximityprotection");
	player setperk("specialty_quickrevive");
	player setperk("specialty_quieter");
	player setperk("specialty_reconnaissance");
	player setperk("specialty_rof");
	player setperk("specialty_scavenger");
	player setperk("specialty_showenemyequipment");
	player setperk("specialty_stunprotection");
	player setperk("specialty_shellshock");
	player setperk("specialty_sprintrecovery");
	player setperk("specialty_showonradar");
	player setperk("specialty_stalker");
	player setperk("specialty_twogrenades");
	player setperk("specialty_twoprimaries");
	player setperk("specialty_unlimitedsprint");

}
givePlayerCash(ammount, player)
{
	player.money += ammount;
	player iprintln("^5" + self.name + "^7 has given you ^2$" + ammount);
	self iprintln("^2You have given ^5" + player.name + "^2 " + ammount);
}

givePlayerHealth(ammount, player)
{
	player.health += ammount;
	player.maxhealth = player.health;
	if (!player.healthMonitor)
		player thread MonitorHealth();
	player iprintln("^5" + self.name + "^7 has given you ^1 " + ammount + " health");
	self iprintln("^1You have given ^5" + player.name + "^1 " + ammount + " health");
}



killPlayer(player)
{
	if(self isHost())
	{
		if (isAlive(player))
		{
			player suicide();
		}
		self iprintln("^5" + player.name + " has been ^1killed");
	}
}

kickPlayer(player)
{
	if(self isHost())
	{
		kick(player GetEntityNumber());
		wait 0.50;
		self submenu(self.menu.previousmenu[self.menu.currentmenu]);
		self iprintln("^5" + player.name + " has been ^1kicked");
	}
}

doHeart()
{
	level endon("endDH");
	level.SA destroy();
	level.SA=createServerFontString("hudbig",2.1);
	level.SA setPoint( "TOPRIGHT","TOPRIGHT",0,30 + 100 );
	level.result += 1;
	level.SA setText("youtube/iTzCrystal__");
	level notify("textset");
	level.SA.hideWhenInMenu=1;
	level.SA.sort = 2;
	for(;;)
	{
		level.SA ChangeFontScaleOverTime( 0.4 );
		level.SA.fontScale = 2.0;
		level.SA FadeOverTime( 0.3 );
		level.SA.glowAlpha=1;
		level.SA.glowColor =((randomint(255)/255),(randomint(255)/255),(randomint(255)/255));
		level.SA SetPulseFX(40,2000,600);
		wait 0.4;
		level.SA ChangeFontScaleOverTime( 0.4 );
		level.SA.fontScale = 2.3;
		level.SA FadeOverTime( 0.3 );
		level.SA.glowAlpha=1;
		level.SA.glowColor =((randomint(255)/255),(randomint(255)/255),(randomint(255)/255));
		level.SA SetPulseFX(40,2000,600);
		wait 0.4;
	}
}
doheartfix()
{
	if(level.doheart){}
	else
	{
		level notify("endDH");
		self thread doHeart();
	}
}
endGame()
{
	level thread maps/mp/gametypes/_globallogic::forceend();
}
doRestart()
{
	map_restart(false);
}
banplayer(player)
{
    if (!(player isHost()))
    {
        ban(player getentitynumber());
        kick(player GetEntityNumber());
        self iPrintln(player.name + ": ^1Banned");
        //wait .5;
        //enter clients menu
    }
    else
    {
        self iPrintln("^1You Cannot Kick The Host");
    }
}
doAntiQuit()
{
self endon("disconnect");

for(;;)
{
foreach(player in level.players)
player maps/mp/gametypes/_globallogic_ui::closemenus();
wait 0.05;
}
}

setThirdPerson()
{
	self endon("death");
	self endon("disconnect");
	self.thirdPerson=booleanOpposite(self.thirdPerson);
	self setClientThirdPerson(self.thirdPerson);
	self iPrintln(booleanReturnVal(self.thirdPerson,"Third Person ^1OFF","Third Person ^2ON"));
}

ToggleFOV()
{
if(self.fov == true)
	{
		self iPrintln("FOV: ^2ON");
		self setclientfov(85);
		self.fov = false;
	}
	else
	{
		self iPrintln("FOV: ^1OFF");
		self setclientfov(65);
		self.fov = true;
	}
}




























































