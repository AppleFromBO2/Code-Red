spawnCarePackage()
{
	spawnPosition = self traceBullet(200);
	entity = spawn("script_model", spawnPosition);
	entity setModel("t6_wpn_supply_drop_ally");
	self iPrintln("Object Spawned: ^2" + model);
	return entity;
}

spawnEntity(class, model, origin, angle)
{
	entity = spawn(class, origin);
	entity.angles = angle;
	entity setModel(model);
	return entity;
}

spawnObjective(origin, icon, onEntity)
{
	Objective_Add(level.activeObjectiveIndex, "active", origin);
	Objective_Icon(level.activeObjectiveIndex, icon);
	
	if (isDefined(onEntity))
		Objective_OnEntity(level.activeObjectiveIndex, onEntity);
		
	level.activeObjectiveIndex++;
}

roundUp(floatVal) 
{ 
	if (int(floatVal) != floatVal) 
        return int(floatVal + 1); 
	else 
        return int(floatVal); 
}

removeSkyBarrier()
{
	entArray = getEntArray();
	for (index = 0; index < entArray.size; index++)
	{
		if(isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] > 180)
			entArray[index].origin = (0, 0, 9999999);
	}
}	   

CreateWall(end, start, invisible)
{
    blockb=[];
    blockc=[];
    dh = (start[0], start[1], 0);
    hd = (end[0], end[1], 0);
    zaa = (0, 0, start[2]);
    azz = (0, 0, end[2]);
    D = Distance(dh, hd);
    H = Distance(zaa, azz);
    blocks = roundUp(D / 70);
    height = roundUp(H / 36);
    CX = start[0] - end[0];
    CY = start[1] - end[1];
    CZ = start[2] - end[2];
    XA = CX / blocks;
    YA = CY / blocks;
    ZA = CZ / height;
    Temp = VectorToAngles(end - start);
    BA = (0, Temp[1] + 90, 0);
    for(h=0; h < height; h++)
    {    
        for(i=0; i < blocks; i++)
        {
            spawnPos = (end + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h));
        	block = spawnEntity("script_model", level.supplyDropModel, spawnPos, BA);
        	if (isDefined(invisible) && invisible)
        		block hide();
        }
    }
}

CreateRamp(top, bottom, invisible)
{
    D = Distance(top, bottom);
    blocks = roundUp(D / 30);
    CX = top[0] - bottom[0];
    CY = top[1] - bottom[1];
    CZ = top[2] - bottom[2];
    XA = CX / blocks;
    YA = CY / blocks;
    ZA = CZ / blocks;
    Temp = VectorToAngles(top - bottom);
    BA =(Temp[0], Temp[1], Temp[2]);
    for(b = 0; b < blocks; b++)
    {
    	block = spawnEntity("script_model", level.supplyDropModel, (bottom + ((XA, YA, ZA) * B)), BA);
        if (isDefined(invisible) && invisible)
        	block hide();
    }
    block = spawnEntity("script_model", level.supplyDropModel, (bottom + ((XA, YA, ZA) * blocks)-(0, 0, 5)), (BA[0], BA[1], 0));
	if (isDefined(invisible) && invisible)
   		block hide();
}

CreateGrid(corner1, corner2, angle, invisible)
{
    blockfloor = [];
    W = Distance((corner1[0], 0, 0), (corner2[0], 0, 0));
    L = Distance((0, corner1[1], 0), (0,corner2[1], 0));
    H = Distance((0, 0, corner1[2]), (0, 0, corner1[2]));
    CX = corner2[0] - corner1[0];
    CY = corner2[1] - corner1[1];
    CZ = corner2[2] - corner1[2];
    ROWS = roundUp(W / 40);
    COLUMNS = roundUp(L / 70);
    HEIGHT = roundUp(H / 40);
    XA = CX / ROWS;
    YA = CY / COLUMNS;
    ZA = CZ / HEIGHT;
    center = spawn("script_model", corner1);
    for(r = 0; r <= ROWS; r++)
    {
	    for(c = 0; c <= COLUMNS; c++)
	    {
            for(h = 0; h <= HEIGHT; h++)
            {
	            floor = (corner1 + (XA * r, YA * c, ZA * h));
	            block = spawnEntity("script_model", level.supplyDropModel, floor, (0, 0, 0));
	            if (isDefined(invisible) && invisible)
   					block hide();
	            block LinkTo(center);
            }
		}
	}
    center.angles = angle;
}

CreateFlag(enter, exit, hiddenFlags, bothWays)
{
	if (bothWays)
	{
		if (!hiddenFlags)
		{
			entryFlag1 = spawnEntity("script_model", level.teleportFlagBothModel, enter, (0, 0, 0));
			entryFlag2 = spawnEntity("script_model", level.teleportFlagBothModel, exit, (0, 0, 0));
			spawnObjective(enter, "waypoint_recon_artillery_strike");
			spawnObjective(exit, "waypoint_recon_artillery_strike");
			entryFlag1.flagIsHidden = false;
		}
		else
		{
			entryFlag1 = spawn("script_model", enter);
			entryFlag2 = spawn("script_model", exit);
			entryFlag1.flagIsHidden = true;
		}	
		level thread Teleport_Flag_Think(entryFlag1, entryFlag2, true);
	}
	else
	{
		if (!hiddenFlags)
		{
			entryFlag = spawnEntity("script_model", level.teleportFlagStartModel, enter, (0, 0, 0));
			exitFlag = spawnEntity("script_model", level.teleportFlagEndModel, exit, (0, 0, 0));
			spawnObjective(enter, "waypoint_recon_artillery_strike");
			entryFlag.flagIsHidden = false;
		}
		else
		{
			entryFlag = spawn("script_model", enter);
			exitFlag = spawn("script_model", exit);
			entryFlag.flagIsHidden = true;
		}	    
		level thread Teleport_Flag_Think(entryFlag, exitFlag, false);
	}       
}

Teleport_Flag_Think(Flag1, Flag2, bothWays)
{
    level endon("game_ended");
    
    for(;;)
    {
	    foreach(player in level.players)
	    {
	    	if (bothWays)
	    	{
		        if(Distance(player.origin, Flag1.origin) < 25)
		        {
		            player SetOrigin(Flag2.origin + VectorScale(AnglesToForward((0, player.angles[1], 0)), 30));
		        	if (Flag1.flagIsHidden)
		        		player iPrintln("^1You Found A Hidden Teleport Flag!");
		        }
		        if(Distance(player.origin, Flag2.origin) < 25)
		        {
		            player SetOrigin(Flag1.origin + VectorScale(AnglesToForward((0, player.angles[1], 0)), 30));
		        	if (Flag1.flagIsHidden)
		        		player iPrintln("^1You Found A Hidden Teleport Flag!");
		        }
	        }
	        else
	        {
	        	if(Distance(player.origin, Flag1.origin) < 25)
		        {
		            player SetOrigin(Flag2.origin + VectorScale(AnglesToForward((0, player.angles[1], 0)), 30));
		       		if (Flag1.flagIsHidden)
		        		player iPrintln("^1You Found A Hidden Teleport Flag!");
		       }
	        }
	    }
	    wait 0.001;
	}
}

CreateElevator(start, end, time, waittime)
{
	TempAngles = VectorToAngles(end - start);
	Angles = (0, TempAngles[1], 0);

	center = spawn("script_model", start);
	elevator = spawnEntity("script_model", level.supplyDropModel, start, Angles);
	elevator EnableLinkTo();
	elevator LinkTo(center);
	spawnObjective(start, "compass_supply_drop_black", elevator);
	
	level thread Elevator_Think(center, start, end, time, waittime);
}

Elevator_Think(elevator, start, end, time, waittime)
{
    level endon("game_ended");
    
    wait waittime;
    for(;;)
    {
    	if (elevator.origin == start)
    	{
    		elevator MoveTo(end, time);
    		wait time;
    		wait waittime;
    	}
    	if (elevator.origin == end)
    	{
    		elevator MoveTo(start, time);
    		wait time;
    		wait waittime;
    	}
    	wait 0.01;
    }
}

CreateZipline(start, end, time, bothWays)
{
	TempAngles = VectorToAngles(end - start);
	Angles = (0, TempAngles[1], 0);
	
	if (bothWays)
	{
		ziplineStart = spawnEntity("script_model", level.supplyDropModel, start, Angles);
		ziplineEnd = spawnEntity("script_model", level.supplyDropModel, end, Angles);
		spawnObjective(start, "compass_supply_drop_green");
		spawnObjective(end, "compass_supply_drop_green");
	}
	else
	{
		ziplineStart = spawnEntity("script_model", level.supplyDropModelAxis, start, Angles);
		ziplineEnd = spawnEntity("script_model", "", end, Angles);
		spawnObjective(start, "compass_supply_drop_red");
	}
	level thread Zipline_Think(ziplineStart, ziplineEnd, time, bothWays);
}

Zipline_Hint_Think(localZiplineNumber)
{
	level endon("game_ended");
	self endon("disconnect");
	
	self.ZiplineHintThinkActive[localZiplineNumber] = true; 
	for(;;)
	{
		if (!isDefined(self.ziplineStringCreated[localZiplineNumber]))
		{
			self.ziplineHintString[localZiplineNumber] = self drawText("Press [{+usereload}] To Use Zipline", "objective", 1.5, 0, -50, (1, 1, 1), 1, (0, 0, 0), 0, 8, false);
	 		self.ziplineHintString[localZiplineNumber].alignX = "center";
			self.ziplineHintString[localZiplineNumber].alignY = "bottom";
			self.ziplineHintString[localZiplineNumber].horzAlign = "center";
			self.ziplineHintString[localZiplineNumber].vertAlign = "bottom";
			self.usingZipline = false;
		 	self.ziplineStringCreated[localZiplineNumber] = true;
		 	self.ziplineHintString[localZiplineNumber].alpha = 0;
	 	}
		if (self.nearZipline[localZiplineNumber] && !self.usingZipline && isAlive(self))
   		 	self.ziplineHintString[localZiplineNumber].alpha = 1;
    	if (!self.nearZipline[localZiplineNumber] && isAlive(self))
    		self.ziplineHintString[localZiplineNumber].alpha = 0;
    	wait 0.01;
	}
}

Zipline_Think(ziplineStart, ziplineEnd, time, bothWays)
{
    level endon("game_ended");
    
    localZiplineNumber = level.activeZiplines;
    level.activeZiplines++;
    
    for(;;)
    {
	    foreach(player in level.players)
	    {
	    	if (!isDefined(player.ZiplineHintThinkActive[localZiplineNumber]))
	    		player thread Zipline_Hint_Think(localZiplineNumber);
	    	if (!player.usingZipline && isAlive(player))
	    	{
		    	if (bothWays)
		    	{
			        if(Distance(player.origin, ziplineStart.origin) < 60)
			        {
			        	player.nearZipline[localZiplineNumber] = true;
			            if (player UseButtonPressed())
			           		player thread Zipline_Player_Think(player, localZiplineNumber, ziplineStart.origin, ziplineEnd.origin, time);
			        }
			        else if(Distance(player.origin, ziplineEnd.origin) < 60)
			        {
			        	player.nearZipline[localZiplineNumber] = true;
			        	if (player UseButtonPressed())
			            	player thread Zipline_Player_Think(player, localZiplineNumber, ziplineEnd.origin, ziplineStart.origin, time);
			        }
			        else
			        	player.nearZipline[localZiplineNumber] = false;
		        }
		        if (!bothWays)
		        {
		        	if(Distance(player.origin, ziplineStart.origin) < 60)
			        {
			        	player.nearZipline[localZiplineNumber] = true;
			       		if (player UseButtonPressed())
			            	player thread Zipline_Player_Think(player, localZiplineNumber, ziplineStart.origin, ziplineEnd.origin, time);
			       	}
			       	else
			       		player.nearZipline[localZiplineNumber] = false;
		        }
	        }
	    }
	    wait 0.01;
	}
}

Zipline_Player_Think(player, ziplineNumber, start, end, time)
{
	level endon("game_ended");
	self endon("disconnect");

	player.usingZipline = true;
	ZiplineMover = spawn("script_model", start);
	player PlayerLinkTo(ZiplineMover);
	player.ziplineHintString[ziplineNumber].alpha = 0;
	ZiplineMover MoveTo(end, time, 0.5, 0.5);
	wait time;
	player DetachAll(); 
	ZiplineMover delete();
	player.usingZipline = false;
}

CreateDoorSolid(open, close, time, angle, width, height, hp, triggerRadius)
{
	offset = (((width / 2) - 0.5) * -1);
	center = spawn("script_model", open);
	for(j = 0; j < width; j++)
	{
		door = spawnEntity("script_model", level.supplyDropModelAxis, open + ((0, 30, 0) * offset), (0, 0, 0));
		door EnableLinkTo();
		door LinkTo(center);
		for(h = 1; h < height; h++)
		{
			door = spawnEntity("script_model", level.supplyDropModelAxis, open + ((0, 30, 0) * offset) - ((40, 0, 0) * h), (0, 0, 0));
			door EnableLinkTo();
			door LinkTo(center);	
		}
		offset += 1;
	}
	center.angles = angle;
	center.state = "open";
	center.hp = hp;
	center.triggerRadius = triggerRadius;
	
	center thread Door_Player_Think(level.activeDoors);
	center thread Door_Think(open, close, time);
	wait 0.01;
}

CreateDoor(open, close, time, angle, width, height, hp, triggerRadius)
{
	offset = (((width / 2) - 0.5) * -1);
	center = spawn("script_model", open);
	for(j = 0; j < width; j++)
	{
		door = spawnEntity("script_model", level.supplyDropModelAxis, open + ((0, 30, 0) * offset), (0, 0, 0));
		door EnableLinkTo();
		door LinkTo(center);
		for(h = 1; h < height; h++)
		{
			door = spawnEntity("script_model", level.supplyDropModelAxis, open + ((0, 30, 0) * offset) - ((70, 0, 0) * h), (0, 0, 0));
			door EnableLinkTo();
			door LinkTo(center);
		}
		offset += 1;
	}
	center.angles = angle;
	center.state = "open";
	center.hp = hp;
	center.triggerRadius = triggerRadius;
	
	center thread Door_Player_Think(level.activeDoors);
	center thread Door_Think(open, close, time);
	wait 0.01;
}

Door_Think(open, close, time)
{
	level endon("game_ended");
	
	localDoorNumber = level.activeDoors;
	level.doorInUse[localDoorNumber] = false;
	level.activeDoors++;

	for(;;)
	{
		if(self.hp > 0)
		{
			self waittill ("triggeruse" , player);		
			if(player.team == "allies" && player.status == "human")
			{
				if(self.state == "open")
				{
					self playSound("mpl_drone_door_open");
					self MoveTo(close, time);
					level.doorInUse[localDoorNumber] = true;
					wait time;
					level.doorInUse[localDoorNumber] = false;
					self.state = "close";
					continue;
				}
				if(self.state == "close")
				{
					self playSound("mpl_drone_door_close");
					self MoveTo(open, time);
					level.doorInUse[localDoorNumber] = true;
					wait time;
					level.doorInUse[localDoorNumber] = false;
					self.state = "open";
					continue;
				}
			}
			if(player.team == "axis" && player.status == "zombie")
			{
				if(self.state == "close")
				{
					self.hp--;
					player iPrintlnBold("Door Damaged! +^2$50");
					player.money += 50;
					continue;
				}
			}
		} 
		else
		{
			if(self.state == "close")
				self MoveTo(open, time);
			self.state = "broken";
			wait 0.5;
		}
		wait 0.01;
	}
}

Door_RefreshTimer()
{
	level endon("game_ended");
	self endon("disconnect");

	self.doorRefreshTimerActive = true;
	for(;;)
	{
		if (self.alreadyDamagedDoor)
		{
			wait 1;
			self.alreadyDamagedDoor = false;
		}
		wait 0.01;
	}
}
				
Door_Player_Think(localDoorNumber)
{
	level endon("game_ended");
	self endon("disconnect");
	
	for(;;)
	{
		foreach(player in level.players)
		{
			if (!isDefined(player.doorRefreshTimerActive))
			{
				player thread Door_RefreshTimer();
				player.alreadyDamagedDoor = false;
			}
			if (!isDefined(player.doorStringCreated[localDoorNumber]))
    		{
    			player.doorHintString[localDoorNumber] = player drawText(player.currentDoorHint, "objective", 1.5, 0, -50, (1, 1, 1), 0, (0, 0, 0), 0, 8, false);
    			player.doorHintString[localDoorNumber].alpha = 0;
   		 		player.doorHintString[localDoorNumber].alignX = "center";
				player.doorHintString[localDoorNumber].alignY = "bottom";
				player.doorHintString[localDoorNumber].horzAlign = "center";
				player.doorHintString[localDoorNumber].vertAlign = "bottom";
       		 	player.doorStringCreated[localDoorNumber] = true;
       		 	player.nearDoor[localDoorNumber] = false;
       		}
			if (player.nearDoor[localDoorNumber] && !level.doorInUse[localDoorNumber])
	    	{
   		 		player.doorHintString[localDoorNumber] setText(player.currentDoorHint);
   		 		player.doorHintString[localDoorNumber].alpha = 1;
	    	}
	    	else
	    		player.doorHintString[localDoorNumber].alpha = 0;

			if(Distance(self.origin, player.origin) <= self.triggerRadius && isAlive(player))
			{
				if(player.team == "allies" && player.status == "human")
				{
					if(self.state == "open")
						player.currentDoorHint = "Hold [{+melee}] ^1To Close ^7the door / Press [{+usereload}] To Show Current Health.";
					if(self.state == "close")				
						player.currentDoorHint = "Hold [{+melee}] ^2To Open ^7the door / Press [{+usereload}] To Show Current Health.";
					if(self.state == "broken")
						player.currentDoorHint = "^1Door is Broken";
				}
				if(player.team == "axis" && player.status == "zombie")
				{
					if (self.state == "open")
						player.currentDoorHint = "";
					if(self.state == "close")
						player.currentDoorHint = "Press [{+melee}] | [{+attack}] ^1To Damage ^7the door / Press [{+usereload}] To Show Current Health.";
					if(self.state == "broken")
						player.currentDoorHint = "^1Door is Broken";
				}
				if (player MeleeButtonPressed() && player.team == "allies" && player.status == "human")
				{
					wait 0.5;
					if (player MeleeButtonPressed())
						self notify("triggeruse", player);
				}
				if(player MeleeButtonPressed() || player AttackButtonPressed() && player.team == "axis" && player.status == "zombie" && !player.alreadyDamagedDoor)
				{
					self notify("triggeruse", player);
					player.alreadyDamagedDoor = true;
				}
				if(player UseButtonPressed())
				{
					if (player.team == "allies" && player.status == "human" && self.state != "broken")
						player iPrintlnBold("Current Health: ^1" + self.hp);
					if (player.team == "axis" && player.status == "zombie" && self.state == "close")
						player iPrintlnBold("Current Health: ^1" + self.hp);
					wait 0.5;
				}
				player.nearDoor[localDoorNumber] = true;
			}
			else
				player.nearDoor[localDoorNumber] = false;
		}
		wait 0.01;
	}
}

ResetDoor(localDoorNumber, open, hp, time) 
{
	self.hp = hp;
	self MoveTo(open, time);
	self.state = "open";
}

watchForWorldTurretDeath()
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
		self notify("turretRemoved");		
		wait 0.01;
	}
}

turretPlayerWatcher()
{
	level endon("game_ended");
	self endon("turretRemoved");

	for (;;)
	{
		foreach(player in level.players)
		{
			if (Distance(self.origin, player.origin) <= 60 && isAlive(player) && player UseButtonPressed() && player.status == "zombie")
			{
				player suicide();
				player iPrintln("^1Zombies Cannot Use Turrets!");
			}
		}
		wait 0.01;
	}
}

CreateTurret(origin, angles, turrettype)
{
	turret = spawnTurret("auto_turret", origin, turrettype);
	turret.angles = angles;
	turret setModel("t6_wpn_turret_sentry_gun");
	turret setTurretTeam("allies");
	turret.team = "allies";
	SetupTurretHealth(turret);
	turret thread watchdamage();
	turret.weaponinfoname = turrettype;
	turret.turrettype = "sentry";
	turret.status = "human";
	turret setturrettype(turret.turrettype);
	turret laserOn();
	turret setturretminimapvisible(1);
	turret thread watchForWorldTurretDeath();
	turret thread turretPlayerWatcher();
	turret maps/mp/_entityheadicons::setentityheadicon(turret.team, turret, level.turrets_headicon_offset["default"]);
	return turret;
}

CreateMysteryBox(origin, angle, price)
{
	mysterybox = spawnEntity("script_model", level.supplyDropModelAxis, origin, angle);
	spawnObjective(origin, "perk_hardline");
	
	mysterybox thread MysteryBox_Think();
	mysterybox thread MysteryBox_Player_Think(price);
}

MysteryBox_Think()
{
	level endon("game_ended");
	
	for (;;)
	{
		self waittill("triggerMysteryBox", player, localMysteryBoxNumber);
		
		currentWeapon = spawn("script_model", self.origin);
		currentWeapon.angles = self.angles + (0, 90, 0);
		
		self thread MysteryBox_WeaponMover_Think(currentWeapon);
		
		self waittill("mysteryBoxWeaponMoverFinished");
		self thread MysteryBox_Timeout_Think();
		player.mysteryBoxWeaponReady[localMysteryBoxNumber] = true;
		
		self waittill_any("tookMysteryBoxWeapon", "mysteryBoxWeaponTimedOut");
		wait 0.50;
		if (!self.timedOut)
			player replaceWeaponWorld(self.currentWeaponReturn, "All");
		currentWeapon delete();
		player.isUsingMysteryBox = false;
		player.mysteryBoxWeaponReady[localMysteryBoxNumber] = false;
		self.mysteryBoxInUse = false;
		self.timedOut = false;
		wait 0.01;
	}
}

MysteryBox_Timeout_Think()
{
	level endon("game_ended");
	self endon("tookMysteryBoxWeapon");
	
	wait 12;
	self.timedOut = true;
	self notify("mysteryBoxWeaponTimedOut");
}

MysteryBox_WeaponMover_Think(currentWeapon)
{
	level endon("game_ended");

	self.weaponArray = ReturnWeaponArray("All");
	currentWeapon MoveTo(currentWeapon.origin + (0, 0, 60), 10, 2, 2);
	for (i = 0; i < 30; i++)
	{
		tempRandomWeapon = self.weaponArray[randomint(self.weaponArray.size)];
		currentWeapon SetModel(GetWeaponModel(tempRandomWeapon));
		self.currentWeaponReturn = tempRandomWeapon;
		wait 0.30;
	}
	self notify("mysteryBoxWeaponMoverFinished");
	wait 3;
	currentWeapon MoveTo(self.origin, 10, 2, 2);
}

MysteryBox_Player_Think(price)
{
	level endon("game_ended");
	
	localMysteryBoxNumber = level.activeMysteryBoxes;
	level.activeMysteryBoxes++;
	
	for (;;)
	{
		foreach(player in level.players)
		{
			if (!isDefined(player.mysteryBoxStringCreated[localMysteryBoxNumber]))
    		{
    			player.currentMysteryBoxHint = "Press [{+usereload}] To Use Mystery Box / ^2$" + price;
    			player.mysteryBoxHintString[localMysteryBoxNumber] = player drawText(player.currentMysteryBoxHint, "objective", 1.5, 0, -50, (1, 1, 1), 0, (0, 0, 0), 0, 8, false);
    			player.mysteryBoxHintString[localMysteryBoxNumber].alpha = 0;
   		 		player.mysteryBoxHintString[localMysteryBoxNumber].alignX = "center";
				player.mysteryBoxHintString[localMysteryBoxNumber].alignY = "bottom";
				player.mysteryBoxHintString[localMysteryBoxNumber].horzAlign = "center";
				player.mysteryBoxHintString[localMysteryBoxNumber].vertAlign = "bottom";
       		 	player.mysteryBoxStringCreated[localMysteryBoxNumber] = true;
       		 	player.nearMysteryBox[localMysteryBoxNumber] = false;
       		 	player.mysteryBoxWeaponReady[localMysteryBoxNumber] = false;
       		 	self.mysteryBoxInUse = false;
       		}
       		if (player.team != "axis" && player.status != "zombie")
       		{
				if (player.nearMysteryBox[localMysteryBoxNumber] && !self.mysteryBoxInUse)
		    	{
		    		player.currentMysteryBoxHint = "Hold [{+usereload}] To Use Mystery Box  / ^2$" + price;
	   		 		player.mysteryBoxHintString[localMysteryBoxNumber] setText(player.currentMysteryBoxHint);
	   		 		player.mysteryBoxHintString[localMysteryBoxNumber].alpha = 1;
		    	}
		    	else if (player.isUsingMysteryBox && player.mysteryBoxWeaponReady[localMysteryBoxNumber] && player.nearMysteryBox[localMysteryBoxNumber])
		    	{
		    		player.mysteryBoxHintString[localMysteryBoxNumber] setText(player.currentMysteryBoxHint);
	   		 		player.mysteryBoxHintString[localMysteryBoxNumber].alpha = 1;
		    	}
		    	else
		    		player.mysteryBoxHintString[localMysteryBoxNumber].alpha = 0;
		    		
		    	if(Distance(self.origin, player.origin) <= 60 && !self.mysteryBoxInUse && !player.isUsingMysteryBox)
		    	{
		    		player.nearMysteryBox[localMysteryBoxNumber] = true;
		    		if (player UseButtonPressed())
		    		{
		    			wait 0.5;
		    			if (player UseButtonPressed())
		    			{
			    			if (player.money >= price)
			    			{
			    				wait 0.10;
				    			player.currentMysteryBoxHint = "";
				    			player.isUsingMysteryBox = true;
				    			player.money -= price;
				    			self.mysteryBoxInUse = true;
				    			self notify("triggerMysteryBox", player, localMysteryBoxNumber);
			    			}
			    			else
			    			{
			    				player SendError("MoreMoney");
			    				wait 0.20;
			    			}
			    		}
		    		}
		    	}
		    	else if(Distance(self.origin, player.origin) <= 60 && player.isUsingMysteryBox && player.mysteryBoxWeaponReady[localMysteryBoxNumber])
		    	{
		    		player.nearMysteryBox[localMysteryBoxNumber] = true;
		    		player.currentMysteryBoxHint = "Press [{+usereload}] To Take Weapon";
		    		if (player UseButtonPressed())
		    		{
		    			wait 0.10;
		    			self notify("tookMysteryBoxWeapon");
		    		}
		    	}
		    	else
		    		player.nearMysteryBox[localMysteryBoxNumber] = false;
			}
			else
				player.mysteryBoxHintString[localMysteryBoxNumber].alpha = 0;				
		}
		wait 0.01;
	}
}
deathBarrier()
{
ents = getEntArray();
for ( index = 0; index < ents.size; index++ )
{
if(isSubStr(ents[index].classname, "trigger_hurt"))
ents[index].origin = (0, 0, 9999999);
}
}
WhiteContainer(pos, angle)
{
    WhiteCon = spawn("script_model", pos );
    WhiteCon setModel("p6_dockside_container_lrg_white");
    WhiteCon.angles = angle;
}

BlueContainer(pos, angle)
{
    BlueCon = spawn("script_model", pos );
    BlueCon setModel("p6_dockside_container_lrg_blue");
    BlueCon.angles = angle;
}

RedContainer(pos, angle)
{
    RedCon = spawn("script_model", pos );
    RedCon setModel("p6_dockside_container_lrg_red");
    RedCon.angles = angle;
}

OrangeContainer(pos, angle)
{
    OrangeCon = spawn("script_model", pos );
    OrangeCon setModel("p6_dockside_container_lrg_orange");
    OrangeCon.angles = angle;
}
CreateOrangeElevator(start, end, Angle, time, waittime)
{
	Angles = Angle;

	center = spawn("script_model", start);
	elevator = spawnEntity("script_model", "p6_dockside_container_lrg_orange", start, Angles);
	elevator EnableLinkTo();
	elevator LinkTo(center);
	
	level thread Elevator_Think(center, start, end, time, waittime);
}

spawnEntity(class, model, origin, angle)
{
	entity = spawn(class, origin);
	entity.angles = angle;
	entity setModel(model);
	return entity;
}

Elevator_Think(elevator, start, end, time, waittime)
{
    level endon("game_ended");
    
    wait waittime;
    for(;;)
    {
    	if (elevator.origin == start)
    	{
    		elevator MoveTo(end, time);
    		wait time;
    		wait waittime;
    	}
    	if (elevator.origin == end)
    	{
    		elevator MoveTo(start, time);
    		wait time;
    		wait waittime;
    	}
    	wait 0.01;
    }
}
CreateObject(model, origin, angle) {
	return spawnEntity("script_model", model, origin, angle);
}
createBlock(pos,ang)
{
	Crate = spawn("script_model", pos);
    Crate setmodel("t6_wpn_supply_drop_ally");
    Crate.angles = ang;
}

WallPointToPoint(start, end, height)
{
	Dist = distance((start[0], start[1], 0), (end[0], end[1], 0));
	Blocks = roundUp(Dist / 70);
	IntervalX = (end[0] - start[0]) / Blocks;
	IntervalY = (end[1] - start[1]) / Blocks;
	BlockAngles = (0, (VectorToAngles(end - start)[1] + 90), 0);
	for(i = 0; i < height; i++)
	{
		for(x = 0; x < Blocks; x++)
		{
			createBlock(start + (0,0,20) + ((IntervalX, IntervalY, 0) * x) + (0,0,(36 * i)), BlockAngles);
			wait 0.001;
		}
	}
}

roundUp(floatVal) 
{ 
	if (int(floatVal) != floatVal) 
        return int(floatVal + 1); 
	else 
        return int(floatVal); 
}
//Object Elevators

//Aftermath
CreateCarElevator(start, end, Angle, time, waittime)
{
 Angles = Angle;

 center = spawn("script_model", start);
 elevator = spawnEntity("script_model", "veh_iw_civ_firetruck", start, Angles);
 elevator EnableLinkTo();
 elevator LinkTo(center);
 
 level thread Elevator_Think(center, start, end, time, waittime);
}
/*AmmoBox()
{
     level.caja = spawn( "script_model", (self.origin+(85,0,20)) );
     level.caja setModel( "t6_wpn_drop_box");
     level.caja Solid();
     self PlaySoundToPlayer("wpn_agr_explode",self);
     for(;;)
     {
          self.sexting destroy();
          if(distance(self.origin, level.caja.origin) <100)
          {
               self.sexting = self createFontString( "objective", 1.85 );
               self.sexting setPoint("CENTER","CENTER", 0, 5);
               self.sexting setText("Press [{+usereload}] To Get Ammo");
               self.sexting.color = (1,0,0);
               if(self usebuttonpressed())
               {
                    self freezecontrols(true);
                    self EnableInvulnerability();
                    wait 1;
                    self thread CajaAmmo();
                    self freezecontrols(false);
                    self DisableInvulnerability();
                    self.sexting destroy();
                    wait 15; ////Change This If You Want
                    self notify("MoreAmmo");
               }
          }
          wait 0.01;
     }
}

CajaAmmo()
{
     self endon("disconnect");
     self endon("MoreAmmo");
     //self endon("death"); 
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
}*/




































































