#include maps/mp/gametypes/_globallogic_score;
#include maps/mp/gametypes/_globallogic_utils;
#include maps/mp/_scoreevents;
#include maps/mp/teams/_teams;
#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/gametypes/_hud_message;
#include maps/mp/gametypes/_hud;
#include maps/mp/gametypes/_spawnlogic;
#include maps/mp/gametypes/_spawning;
#include maps/mp/killstreaks/_turret_killstreak;

init()
{
	PrecacheItem("minigun_wager_mp");
	PrecacheItem("m32_wager_mp");
	PrecacheModel("t6_wpn_supply_drop_ally");
	PrecacheModel("t6_wpn_supply_drop_axis");
	PrecacheModel("t6_wpn_supply_drop_trap");
	PrecacheModel("mp_flag_green");
	PrecacheModel("mp_flag_red");
	PrecacheModel("mp_flag_neutral");
    loadfx("impacts/fx_deathfx_dogbite");
    loadfx("weapon/talon/fx_talon_emp_stun");
    loadfx("fire/fire_smoke_trail_L");
    PrecacheModel("p6_bullet_train_car");
    PrecacheModel("veh_iw_civ_firetruck"); //Firetruck
    PrecacheModel("veh_iw_civ_ambulance_whole"); //Ambulance
    PrecacheModel("veh_iw_civ_suv_whole_red"); //SUV Red
    PrecacheModel("veh_iw_civ_suv_whole_black"); //SUV Black
    PrecacheModel("veh_iw_civ_suv_whole_beige"); //SUV Beige
    PrecacheModel("veh_t6_police_car_destructible"); //Police Car
    precacheShader("hud_remote_missile_target");
    precacheShader("headicon_dead");
    level.deads = "headicon_dead";
    level.esps = "hud_remote_missile_target";
	
	//Don't Change
	level.activeZiplines = 0;
	level.activeDoors = 0;
	level.activeMysteryBoxes = 0;
	level.activeObjectiveIndex = 0;
	level.zombiecount = 0;
	level.humancount = 0;
	level.currentgametime = 0;
	level.ingraceperiod = 0;
	level.scoreroundbased = 0;
	level.allow_teamchange = 0;
	level.turretsSpawned = 0;
	level.botsHaveBeenSpawned = false;
	level.timerspawned = false;
	level.zombieSelectionInProgress = true;
	
	//These Can Be Changed
	level.timeremainingtext = "Nuke Launch: ";
	level.zombieficationTime = 15; //In Seconds
	level.gametime = 1800; //In Seconds
	level.survivorCashBonus = 150;
	level.moneyperkill = 125;
	level.moneyperassist = 100;
	level.moneyperkillzombie = 500;
	level.moneyperzombiedeath = 100;
	level.teamscoreperkill = 4;
	level.teamscoreperdeath = 1;
	level.teamscoreperheadshot = 2;
	level.turretLimit = 5;
	level.amountOfBotsToSpawn = 11;
	level.spawnBots = true;
	level.useCustomMaps = true;
	level.hostCantBecomeZombie = true; //If true host cannot become the starting zombie
	level.enableInformationBar = true;
	level.informationBarText = "^FAttention, Welcome To ^3Code ^1Red! ^7A ^6Outburst ^7Vs Remaining ^5Life ^4Gamemode!^7 | [{+actionslot 1}] To ^2Open ^7The Shop | [{+gostand}] To Select Options | [{+usereload}] To Go Back | ^1YouTube: ^5ImAppleRBX";
	level.supplyDropModel = "t6_wpn_supply_drop_ally";
	level.supplyDropModelAxis = "t6_wpn_supply_drop_axis";
	level.supplyDropModelTrap = "t6_wpn_supply_drop_trap";
	level.teleportFlagStartModel = "mp_flag_green";
	level.teleportFlagEndModel = "mp_flag_red";
	level.teleportFlagBothModel = "mp_flag_neutral";
	wait 10; //Stop Game Crashing
	
	level thread monitorGame();
	level thread monitorTime();
	level thread informationBar();
    level thread onPlayerConnect();
    level thread zombieCountdown();
    level thread threadMonitor();
}

onPlayerConnect()
{
	level endon("game_ended");
	
    for(;;)
    {
        level waittill("connected", player);
        
        //Don't Change
		player.clientid = level.clientid;
        level.clientid++; 
        level.ingraceperiod = 0;
        player.status = "human";    
        player.humandied = 0;
        player.threadsReady = false;
        player.startingZombie = false;
        player.MenuInit = false;
        
        //These Can Be Changed
        player.giveCash = true;
        player.money = 200;
        player.health = 100;
       	player.moneymultiplier = 1;
        
        itemPriceSetup();
		player giveMenu();
				
        player thread onPlayerSpawned();
    	player thread onPlayerDied();
    	player thread onPlayerLeave();
    	wait 0.05;
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
	
	isFirstSpawn = true;

	level.ingraceperiod = 0;
	self.healthMonitor = false;
	self.threadsReady = true; 
	
	if (getDvar("g_gametype") != "tdm")
		thread maps/mp/gametypes/_globallogic::endgame("tie", "Gametype Must Be ^1Team Deathmatch");
		
	self thread weaponMonitior();
	self thread hudMonitor();
	self thread teamMonitor();
	self thread teamMonitorCustom();
	self thread damageMonitor(); 
    self welcomeMessage();
    self setupTeamDvars();

    self changeteam("allies");
    self notify("menuresponse", "changeclass", "class_smg");
    
    for(;;)
    {    	
        self waittill("spawned_player");
        
           if(isFirstSpawn)
        {
            self thread homefront();
          
         } 
            isFirstSpawn = false;
           
        //self thread coords();

     
        if (!isDefined(level.customMapReady) && level.useCustomMaps)
   		{
	    	level thread setupCustomMap();
	    	level.customMapReady = true;
    	}
        
        if (isDefined(self.infraredOn))
			self giveInfraredVisionRaw();
        if (self.status == "zombie")
        	self SetModel("c_usa_mp_seal6_sniper_fb");
        else
        	self SetModel("c_usa_mp_seal6_lmg_fb");
    	self giveSpawnWeapons(self.status);
    	wait 0.10;
    	self giveSpawnWeapons(self.status);
    	wait 0.05;
    	setDvar("g_TeamColor_Axis","1 0 0 1");
        setDvar("g_TeamColor_Allies","1 0 0 1");
        wait .2;
        setDvar("g_TeamColor_Axis","1 0.7 0 1");
        setDvar("g_TeamColor_Allies","1 0.7 0 1");
        wait .2;
        setDvar("g_TeamColor_Axis","1 1 0 1");
        setDvar("g_TeamColor_Allies","1 1 0 1");
        wait .2;
        setDvar("g_TeamColor_Axis","0 1 0 1");
        setDvar("g_TeamColor_Allies","0 1 0 1");
        wait .2;
        setDvar("g_TeamColor_Axis","0 0 1 1");
        setDvar("g_TeamColor_Allies","0 0 1 1");
        wait .2;
        setDvar("g_TeamColor_Axis","1 0 1 1");
        setDvar("g_TeamColor_Allies","1 0 1 1");
        wait .2;
        setDvar("g_TeamColor_Axis","0 1 1 1");
        setDvar("g_TeamColor_Allies","0 1 1 1");
        wait .1;
        setDvar("lowAmmoWarningColor1","1 0 0 1");
        setDvar("lowAmmoWarningNoAmmoColor1","1 0 0 1");
        setDvar("lowAmmoWarningNoReloadColor1","1 0 0 1");
        wait .2;
        setDvar("lowAmmoWarningColor1","1 0.7 0 1");
        setDvar("lowAmmoWarningNoAmmoColor1","1 0.7 0 1");
        setDvar("lowAmmoWarningNoReloadColor1","1 0.7 0 1");
        wait .2;
        setDvar("lowAmmoWarningColor1","1 1 0 1");
        setDvar("lowAmmoWarningNoAmmoColor1","1 1 0 1");
        setDvar("lowAmmoWarningNoReloadColor1","1 1 0 1");
        wait .2;
        setDvar("lowAmmoWarningColor1","0 1 0 1");
        setDvar("lowAmmoWarningNoAmmoColor1","0 1 0 1");
        setDvar("lowAmmoWarningNoReloadColor1","0 1 0 1");
        wait .2;
        setDvar("lowAmmoWarningColor1","0 0 1 1");
        setDvar("lowAmmoWarningNoAmmoColor1","0 0 1 1");
        setDvar("lowAmmoWarningNoReloadColor1","0 0 1 1");
        wait .2;
        setDvar("lowAmmoWarningColor1","1 0 1 1");
        setDvar("lowAmmoWarningNoAmmoColor1","1 0 1 1");
        setDvar("lowAmmoWarningNoReloadColor1","1 0 1 1");
        wait .2;
        setDvar("lowAmmoWarningColor1","0 1 1 1");
        setDvar("lowAmmoWarningNoAmmoColor1","0 1 1 1");
        setDvar("lowAmmoWarningNoReloadColor1","0 1 1 1");
        wait .1;
    }
} 
onPlayerDied()
{		
	self endon("disconnect");
	level endon("game_ended");
	
	for (;;)
	{
	    self waittill("death");
		if (self.status != "zombie" && level.zombieficationTime == 0)
		{
			self notify("infected");
			level.infectedPlayers[getPlayerName(self)] = "infected";
			self changeteam("axis");
			self resetDvars();
			self.status = "zombie";
			self.maxhealth = 100;
			self.currentdeaths = 0;
			self.pers["deaths"] = 0;
			level thread humanDied();
			self.money = 0;
			self thread CreateMenu();
			wait 0.10;
			self thread maps/mp/gametypes/_globallogic_ui::closeMenus();
		}
		wait 0.05;
	}
}

onPlayerLeave()
{
	level endon("game_ended");
	self endon("playerLeave");
	
	for (;;)
	{
		self waittill("disconnect");
		self destroyPlayerHuds();
		self notify("playerLeave");
		wait 0.05;
	}
}

humanDied()
{
	foreach(player in level.players)
	{ player.humandied = 1; wait 0.01; }
}

threadMonitor()
{
	level endon("game_ended");
	level endon("winnerDeclared");
	
	wait 1;
	for (;;)
	{
		if (!level.inprematchperiod && level.rankedmatch)
		{
			level.gameforfeited = 0;
			level notify("abort forfeit");
		}
		foreach (player in level.players)
		{
			if (!player.threadsReady)
			{
				player.status = "human";
		        player.threadsReady = true;
		        player.giveCash = true;
		        player.money = 50;
		        player.health = 100;
		       	player.moneymultiplier = 1;
		        player.humandied = 0;
		        player.startingZombie = false;
		        level.ingraceperiod = 0;
		        
		        itemPriceSetup();
		        player.MenuInit = false;
				player giveMenu();
						
		        player thread onPlayerSpawned();
		    	player thread onPlayerDied();
		    	player thread onPlayerLeave();
		    	player suicide();
		    	wait 0.05;
			}
			if (IsDefined(level.infectedPlayers[getPlayerName(player)]))
			{
				if(level.infectedPlayers [getPlayerName(player)] == "infected" && IsAlive(player) && player.pers["team"] == "allies" && player.status == "human")
				{
					player suicide();
					wait 0.05;
				}
			}
		}
		wait 0.05;
	}
}


teamMonitor()
{
	self endon("disconnect");
	
	for (;;)
	{
	    if (self IsSplitScreen())
    	{
    		kick(self GetEntityNumber());
    	}
    	if (self.startingZombie && self.pers["team"] != "axis" && isAlive(self))
    	{
    		self changeteam("axis");
    		self.status = "zombie";
    		wait 0.10;
			self notify("menuresponse", "changeclass", "class_smg");
    		self.startingZombie = false;
    	}
    	if (self.pers["team"] == "axis" && self.status == "human")
    	{
    		self changeteam("allies");
    	    self.status = "human";
    	    wait 0.10;
			self notify("menuresponse", "changeclass", "class_smg");
    	}
       	if (self.pers["team"] == "allies" && self.status == "zombie")
		{
			self changeteam("axis");
			self.status = "zombie";
			wait 0.10;
			self notify("menuresponse", "changeclass", "class_smg");
		}
    	if (self.pers["team"] == "axis" && self.status == "human")
    	{
    		if (!level.inprematchperiod && level.zombieficationTime > 0)
    	 	{
	    		self changeteam("allies");
	    		self.status = "human";
				wait 1;
	    		if (self.pers["team"] == "axis" && level.zombieficationTime > 0 && self.status != "zombie")
	    		{
		    		self changeteam("allies");
		    		self.status = "human";
		    		wait 0.50;
		    		self notify("menuresponse", "changeclass", "class_smg");
					if (self.pers["team"] == "axis")
					{
						self changeteam("axis");
						self.status = "zombie";
						wait 0.10;
						self notify("menuresponse", "changeclass", "class_smg");
					}
				}
			}
    	}
		wait 0.01;
	}
}


teamMonitorCustom()
{
	self endon("disconnect");
	
	for (;;)
	{
		self waittill("joined_team");
		wait 0.10;
		if (self.status == "human" && self.pers["team"] == "axis")
		{
			self changeteam("allies");
			self.status = "human";
			wait 0.10;
			self notify("menuresponse", "changeclass", "class_smg");
		}
		if (self.status == "zombie" && self.pers["team"] == "allies")
		{
			self changeteam("axis");
			self.status = "zombie";
			wait 0.10;
			self notify("menuresponse", "changeclass", "class_smg");
			self thread maps/mp/gametypes/_globallogic_ui::closeMenus();
		}
		wait 0.05;
	}
}

damageMonitor()
{
	self endon("disconnect");
	
	for (;;)
	{
		if (self.status == "zombie")
		{
			self waittill("damage", damage, attacker, direction, point, type, tagname, modelname, partname, weaponname);
			if (type == "MOD_FALLING")
			{
				self.giveCash = false;
				self waittill("spawned_player");
				self.giveCash = true;
			}
		}
		wait 0.01;
	}
}

monitorGame()
{
	level endon("game_ended");
	level endon("winnerDeclared");
	level.timeToPauseGame = 10;
	
	wait 1;
	for (;;)
	{
		if (!level.inprematchperiod)
		{
			if (level.currentgametime == level.timeToPauseGame)
				pausetimer();
			level.zombiecount = 0;
			level.humancount = 0;
			wait 0.05;
			foreach(player in level.players)
			{
				if (player.status == "zombie")
					level.zombiecount += 1;
				if (player.status == "human")
					level.humancount += 1;
				if (level.zombieSelectionInProgress)
					level.zombiecount = 1337;
				wait 0.05;
			}
			if (level.zombiecount == 0 && level.zombieficationTime == 0 && !level.zombieSelectionInProgress)
			{
				level thread selectRandomPlayers();
			}
			if (level.zombiecount == level.players.size && level.humancount == 0)
			{
				level thread finishGame();
				level thread maps/mp/gametypes/_globallogic::endgame("axis", "^5Earth ^7Was Overtaken");
				level notify("winnerDeclared");
				level notify("game_ended");
			}
			if (level.currentgametime == level.gametime)
			{
				level thread finishGame();
				level thread maps/mp/gametypes/_globallogic::endgame("allies", "Humans ^1survived");
				level notify("winnerDeclared");
				level notify("game_ended");
			}
			wait 0.05;
		}
		wait 0.05;
	}
}

finishGame()
{
	level.TimeHUD FadeOverTime(0.50);
	level.TimeHUD.alpha = 0;
	level.ClockHUD FadeOverTime(0.50);
	level.ClockHUD.alpha = 0;
	
	level thread destroyHuds();
}

monitorTime()
{
	level endon("game_ended");
	level endon("winnerDeclared");
	
	wait 1;
	for (;;)
	{
		if (!level.inprematchperiod && level.timerspawned)
		{
			if (level.currentgametime != level.gametime)
				level.currentgametime += 1;
			else
				level notify("timelimit_reached");
		}
		wait 1;
	}
}

weaponMonitior()
{
	self endon("disconnect");
	level endon("game_ended");
	level endon("winnerDeclared");
	
	for (;;)
	{
		if (self.status == "human" && isAlive(self) && level.inprematchperiod && level.zombieficationTime != 0)
		{
			self.currentWeapon = self GetCurrentWeapon();
			if (self.currentWeapon != level.playerspawnweapon)
			{
				self.status = "human";
				self giveSpawnWeapons(self.status);
				wait 2;
			}
		}
		wait 0.05;
	}
}

zombieCountdown()
{
	level endon("game_ended");
	level endon("winnerDeclared");
	level endon("zombieficationDone");
	
	wait 1;
	for (;;)
	{
		if (!level.inprematchperiod && !level.timerspawned)
		{
			/*level.TimeHUD = self drawText(level.timeremainingtext, "objective", 2, 0, -30, (1, 1, 1), 0, (0, 0, 1), 0.50, 3, true);
			level.TimeHUD.alignX = "center";
			level.TimeHUD.alignY = "top";
			level.TimeHUD.horzAlign = "center";
			level.TimeHUD.vertAlign = "top";
			level.TimeHUD FadeOverTime(0.50);
			level.TimeHUD.alpha = 1;*/
		
			level.ClockHUD = self drawText("", "objective", 2, 75, -30, (1, 1, 1), 0, (0, 0, 1), 0.50, 3, true);
			level.ClockHUD.alignX = "center";
			level.ClockHUD.alignY = "top";
			level.ClockHUD.horzAlign = "center";
			level.ClockHUD.vertAlign = "top";
			level.ClockHUD setTimer(level.gametime);
			level.ClockHUD FadeOverTime(0.50);
			level.ClockHUD.alpha = 1;
			level.timerspawned = true;
		}
		if (level.zombieficationTime != 0 && !level.inprematchperiod)
		{
			iPrintlnBold("^1Zombiefication In " + level.zombieficationTime + " Seconds");
			wait 5;
			level.zombieficationTime -= 5;
		}
		if (level.zombieficationTime == 0)
		{
			level thread selectRandomPlayers();
			iPrintlnBold("^1Zombies Have Been Released...");
			level notify("zombieficationDone");
		}
		wait 0.05;
	}
}

hudMonitor()
{
	self endon("disconnect");
	level endon("game_ended");
	level endon("winnerDeclared");
	
	self storeHuds();
	self.currentkills = self.pers["kills"];
	self.currentdeaths = self.pers["deaths"];
	self.currentassists = self.pers["assists"];
	for (;;)
	{
		if (self.giveCash)
		{
			if (self.humandied == 1)
			{
				if (self.status == "human")
				{
					self.money += level.survivorCashBonus;
					self iPrintln("You Have Been Given ^2$" + level.survivorCashBonus + " ^7Survivor Cash Bonus");
				}
				self.humandied = 0;
				wait 0.01;
			}
			if (self.pers["kills"] != self.currentkills)
			{
				if (self.status == "human")
				{
					self.money += level.moneyperkill * self.moneymultiplier;
					self.currentkills = self.pers["kills"];
				}
				if (self.status == "zombie")
				{
					self.money += level.moneyperkillzombie * self.moneymultiplier;
					self.currentkills = self.pers["kills"];
				}
			}
			if (self.pers["assists"] != self.currentassists)
			{
				if (self.status == "human")
				{
					self.money += level.moneyperassist * self.moneymultiplier;
					self.currentassists = self.pers["assists"];
				}
				if (self.status == "zombie")
				{
					self.money += level.moneyperassist * self.moneymultiplier;
					self.currentassists = self.pers["assists"];
				}
			}
			else if (self.pers["deaths"] != self.currentdeaths && self.status == "zombie")
			{
				self.money += level.moneyperzombiedeath * self.moneymultiplier;
				self.currentdeaths = self.pers["deaths"];
			}
		}
		else
		{
			self.currentkills = self.pers["kills"];
			self.currentdeaths = self.pers["deaths"];
			self.currentassists = self.pers["assists"];
			wait 0.001;
		}
		self.HealthValue setValue(self.health);
		self.MoneyValue setValue(self.money);
		wait 0.05;
	}
}

informationBar()
{
	if (level.enableInformationBar)
	{
		level endon("game_ended");
		
		level.infoBarBackground = level drawShader("white", -50, 30, 1000, 35, (0, 0, 0), 0.50, 7, true);
		level.infoBarBackground.alignX = "center";
		level.infoBarBackground.alignY = "bottom";
		level.infoBarBackground.horzAlign = "center";
		level.infoBarBackground.vertAlign = "bottom";
		
		level.infoBarText = level drawText(level.informationBarText, "smallfixed", 2, 1000, 32, (1, 1, 1), 1, (0, 0, 0), 0, 10, true);	
		level.infoBarText.alignX = "center";
		level.infoBarText.alignY = "bottom";
		level.infoBarText.horzAlign = "center";
		level.infoBarText.vertAlign = "bottom";
		
		for (;;)
		{
			if (level.infoBarText.x == -1000)
				level.infoBarText.x = 1000;
			else
			{
				level.infoBarText MoveOverTime(20);
				level.infoBarText.x = -1000;
				wait 25;
			}
			wait 0.05;
		}
	}
}
homefront()
{
	self endon("death");
	self endon("disconnect");
	self endon("welcone_Done");
	for(;;)
	{
		self EnableInvulnerability();
   		self disableWeapons();
   		//self hide();
   		self freezeControls(true);
   		zoomHeight = 30000;
   		zoomBack = 20000;
  		yaw = 55;
   		origin = self.origin;
   		self.origin = origin+vector_scale(anglestoforward(self.angles+(0,-180,0)),zoomBack)+(0,0,zoomHeight);
   		ent = spawn("script_model",(0,0,0));
   		ent.angles = self.angles+(yaw,0,0);
   		ent.origin = self.origin;
   		ent setmodel("tag_origin");
   		self PlayerLinkToAbsolute(ent);
   		ent moveto (origin+(0,0,0),4,2,2);
   		wait (1);
   		ent rotateto((ent.angles[0]-yaw,ent.angles[1],0),3,1,1);
   		wait (0.5);
   		self playlocalsound("ui_camera_whoosh_in"); 
   		wait (2.5);
   		self unlink();
   		wait (0.2);
   		ent delete();
   		//elf Show();
   		self freezeControls(false);
   		self enableWeapons();
   		self disableInvulnerability();
   		self notify("welcone_Done");
	}
}

vector_scale(vec,scale)
{
	vec=(vec[0]*scale,vec[1]*scale,vec[2]*scale);
 	return vec;
}
coords()
{
	self endon("disconnect");
	for(;;)
	{
		self iprintln(self.origin + " - " + self.angles);
		wait 2;
	}
}
/*
spyplane()
{
 if(self.spyplane == true)
 {
  givespyplane();
  self.spyplane = false;
  self.spyplanecooldownmessage = true;
  wait 60; //Coolown
  self.spyplane = true;
  self.spyplanecooldownmessage = false;
 }
 else
 {
  if(self.spyplanecooldownmessage == true)
  {
   iprintlnBold("Wait for spyplane to recharge");
  }
 }
}*/





































































