setupCustomMap()
{
	if(getDvar("mapname") == "mp_nuketown_2020")
		level thread Nuketown();
	if(getDvar("mapname") == "mp_hijacked")
		level thread Hijacked();
	if(getDvar("mapname") == "mp_express")
		level thread Express();
	if(getDvar("mapname") == "mp_meltdown")
		level thread Meltdown();
	if(getDvar("mapname") == "mp_drone")
		level thread Drone();
	if(getDvar("mapname") == "mp_carrier")
		level thread Carrier();
	if(getDvar("mapname") == "mp_overflow")
		level thread Overflow();
	if(getDvar("mapname") == "mp_slums")
		level thread Slums();
	if(getDvar("mapname") == "mp_turbine")
		level thread Turbine();
	if(getDvar("mapname") == "mp_raid")
		level thread Raid();
	if(getDvar("mapname") == "mp_la")
		level thread Aftermath();	
	if(getDvar("mapname") == "mp_dockside") 
		level thread Cargo();	
	if(getDvar("mapname") == "mp_village")
		level thread Standoff();
	if(getDvar("mapname") == "mp_nightclub")
		level thread Plaza();	
	if(getDvar("mapname") == "mp_socotra")
		level thread Yemen();
	if(getDvar("mapname") == "mp_dig")
		level thread Dig();	
	if(getDvar("mapname") == "mp_pod")
		level thread Pod();	
	if(getDvar("mapname") == "mp_takeoff")
		level thread Takeoff();	
	if(getDvar("mapname") == "mp_frostbite")
		level thread Frost();	
	if(getDvar("mapname") == "mp_mirage")
		level thread Mirage();	
	if(getDvar("mapname") == "mp_hydro")
		level thread Hydro();	
	if(getDvar("mapname") == "mp_skate")
		level thread Grind();	
	if(getDvar("mapname") == "mp_downhill")
		level thread Downhill();	
	if(getDvar("mapname") == "mp_concert")
		level thread Encore();	
	if(getDvar("mapname") == "mp_vertigo")
		level thread Vertigo();	
	if (getDvar("mapname") == "mp_magma")
		level thread Magma();
	if(getDvar("mapname") == "mp_studio")
		level thread Studio();	
	if(getDvar("mapname") == "mp_paintball")
		level thread Rush();	
	if(getDvar("mapname") == "mp_castaway")
		level thread Cove();	
	if(getDvar("mapname") == "mp_bridge")
		level thread Detour();
	if(getDvar("mapname") == "mp_uplink")
		level thread Uplink();
}

Nuketown()
{ 
     //Made by iAmCrystal
     level thread removeSkyBarrier();
     CreateGrid((-260, -1782, 80), (320, -2140, 80));//ramp grid
     CreateFlag((-45, 289, -68), (33, -912, -6), false, true);//to ramps
     CreateFlag((1489, 4, 18), (-1749, 1181, -62), true, false);//back blue jump secret
     Createflag((-1869, 881, -61), (-1138, 487, 77), false, false);//blue jump exit
     CreateFlag((-630, 577, 99), (-17, 1341, 320), true, false);//orange jump secret
     CreateDoor((-147, -1764, 95), (47, -1583, 51), 2, (90, 90, 0), 5, 2, 40, 80);  
     CreateGrid((935, -598, 40), (1222, -764, 40));
     CreateGrid((1233, -795, 40), (971, -1206, 40)); 
	 CreateMysteryBox((1037, -765, 55), (0, 90, 0), 1);
	 CreateMysteryBox((321, -2074, 95), (0, 0, 0), 50);
	 CreateRamp((54, -1162, -70), (48, -1775, 80));
	 CreateTurret((-182, -1769, 95), (0, 90, 0), "auto_gun_turret_mp"); //turrent Test
	 CreateTurret((243, -1770, 95), (0, 90, 0), "auto_gun_turret_mp"); //turrent Test2
	
}

Hijacked()
{
   level thread removeSkyBarrier();
	//CreateRamp((-1252.82, 183.799, -39.7719), (-1136.78, 183.799, -39.7719)); //Door zu unten
	//CreateRamp((872.747, 283.156, 22.6344), (764.17, 283.156, 22.6344)); //Door zu unten
	//CreateRamp((347.368, -59.621, 20.125), (347.368, -59.621, 100.125)); //Door oben Kabine
	//CreateWall((930.08, 372.636, 20.125), (900.08, 372.636, 100.125)); //Door oben Kabine
	//CreateRamp((1181.44, 1.37563, 20.125), (1181.44, 1.37563, 100.125)); //Door oben Kabine
	//CreateWall((1039.66, 234.45, 156.125), (920.394, 234.45, 266.125)); //Door oben Kabine Leiter
	//CreateFlag((-81.3954, 390.286, 54.375), (-276.589, 94.8909, -171.875), false, false); //Flagge nach unten Brunnen
	//CreateFlag((251.694, 14.4321, -105.875), (826.082, -69.909, 156.125), false, false); //Flagge nach oben
	//CreateTurret( (379.615, -129.972, 164.125), (0, 180, 0), "auto_gun_turret_mp" ); //turrent Test
	CreateGrid((-2742.67, -398.804, 143.419), (-2898.95, 27.7107, 143.419)); //2 etage heck
	CreateDoor((-889.721, 185.118, 20.125), (-1056.59, 185.118, 20.125), 3, (90, 90, 0), 3, 2, 40, 80); //Door
	CreateZipline((-1565.27, 44.0073, 92.125), (-2753.54, -336.392, 159.294), 4, true); //zipline heck zu haus
	CreateGrid((-1500.48, 346.431, 92.125), (-1630.03, 346.431, 92.125)); //Mauer treppe
	CreateGrid((-2821.58, 492.399, 143.419), (-2842.73, 1267.09, 143.419));
	CreateFlag((-2835.51, 8.39762, 159.294), (-2831.8, 500.945, 159.294), false, true);
	CreateGrid((-2844.62, 1306.34, 143.419), (-2427.23, 1637.76, 143.419)); 
	CreateDoor((-2685.81, 1289.02, 159.294), (-2831.07, 1212.89, 159.294), 2, (90, 90, 0), 5, 2, 40, 80);
	CreateFlag((-2436.73, 1643.08, 159.294), (-217.716, 4.50464, 12.125), false, false);
	CreateMysteryBox((-2512.75, 1284.45, 159.294), (0, 90, 0), 50);
	
}

Express()
{ 
	level thread removeSkyBarrier();

CreateMysteryBox((-3494, -3633, 428), (0,73,0), 125);
CreateMysteryBox((-3537, -3772, 428), (0,73,0), 125);
CreateMysteryBox((2850, -1032, -120), (0,-90,0), 110);
CreateZipline((-4313, -3273, -30), (2226, 1050, -120), 2, true);
createWall((164, -2249, 164), (33.5, -2075, 165), true);
CreateFlag((264, 95.5, -15), (97, -2429, 163), false, false);
CreateFlag((2025, -1006, -120), (1680, -3, 81), false, false);
CreateDoor((2849, -696, -120), (3151, -20, -100), 2, (90, 90, 0), 3, 2, 30, 80);

		createObject(("p6_bullet_train_engine_rev"), (58, -2727, 110), (8, -141, 0));
		createObject(("p6_bullet_train_engine_rev"), (-135, -2555, 110), (0, -53, 0));
		
		createObject(("p6_bullet_train_engine_rev"), (0, -2500, 138), (180, -141, 0));
		createObject(("p6_bullet_train_engine_rev"), (-340, -2770, 135), (180, -141, 0));
		createObject(("p6_bullet_train_engine_rev"), (-680, -3040, 135), (180, -141, 0));
		createObject(("p6_bullet_train_engine_rev"), (-1020, -3310, 135), (180, -141, 0));
		createObject(("p6_bullet_train_engine_rev"), (-1360, -3580, 135), (180, -141, 0));
		createObject(("p6_bullet_train_engine_rev"), (-1700, -3850, 135), (180, -141, 0));
		
		
		createObject(("p6_bullet_train_engine_rev"), (-1944, -4149, 135), (180, 164, 0));
		createObject(("p6_bullet_train_car"), (-2344, -4035, 135), (160, 164, 0));
		createObject(("p6_bullet_train_car"), (-2747, -3920, 280), (160, 164, 0));
		createObject(("p6_bullet_train_car"), (-3147, -3805, 435), (180, 164, 0));
		createObject(("p6_bullet_train_car"), (-3911, -3582, 55), (130, -16, 0)); //Slide
		createObject(("p6_bullet_train_car"), (-3990, -3558, -15), (134, -16, 0));
		
		createObject(("p6_bullet_train_engine_rev"), (-2060, -4325, 132), (-90, -102, 0));
		createObject(("p6_bullet_train_engine_rev"), (-2180, -4315, 250), (-90, -102, 0));
		
		createObject(("p6_bullet_train_engine_rev"), (-3600, -3796, 370), (0, -15, 0));
		createObject(("p6_bullet_train_engine_rev"), (-3520, -3568, 370), (0, -15, 0));

		createObject(("p6_bullet_train_engine_rev"), (-4030, -3551, 520), (0, 164, 0));
		createObject(("p6_bullet_train_engine_rev"), (-4007, -3828, 370), (0, -106, 0));
		createObject(("p6_bullet_train_engine_rev"), (-4007, -3828, 245), (0, -106, 0));
		
		createObject(("p6_bullet_train_engine_rev"), (-3883, -3890, -85), (0, -104, 0));
		createObject(("p6_bullet_train_engine_rev"), (-3901, -3372, -28), (180, -104, 0));
		createObject(("p6_bullet_train_engine_rev"), (-4030, -3351, -28), (180, -104, 0));
		createObject(("p6_bullet_train_engine_rev"), (-4170, -3328, -28), (180, -104, 0));
		createObject(("p6_bullet_train_engine_rev"), (-4308, -3297, -28), (180, -104, 0));
		createObject(("p6_bullet_train_engine_rev"), (-3917, -3927, -85), (0, -15, 0));
		createObject(("p6_bullet_train_engine_rev"), (-3782, -3335, -85), (0, -14, 0));
		createObject(("p6_bullet_train_engine_rev"), (-4396, -3221, -85), (0, 75, 0));
		
		createObject(("p6_bullet_train_engine_rev"), (3151, 660, -270), (0, 90, 0));
		createObject(("p6_bullet_train_engine_rev"), (3151, 226, -270), (0, 90, 0));
		createObject(("p6_bullet_train_engine_rev"), (3151, -683, -270), (0, -90, 0));
	
 }

Meltdown()
{
    level thread removeSkyBarrier();
	CreateFlag((-209.881, -371.531, -63.875), (-276.944, -616.667, -127.875), false, false);//bunker 1
	CreateRamp((14.3591, -555.641, -95), (-417.743, -555.641, -95), false);
	CreateRamp((-417.743, -555.641, -95), (-417.743, -1320.36, -95), false);
	CreateDoor((42.077, -1340.3, -127.875), (42.077, -1146.68, -127.875), 2, (90, 90, 90), 10, 2, 30, 100);
	CreateRamp((246.359, -1304.97, -110.33), (212.358, -1304.97, -110.33), false);
	CreateFlag((195.873, -1295.89, -94.455), (293.462, 556.769, 72.125), false, false);

	CreateFlag((471.889, 206.526, 72.125), (475.769, 292.586, 72.125), false, true);//mystery box
	CreateRamp((832.688, 388.627, 110.125), (832.688, 388.627, 110.125), false);
	CreateRamp((832.688, 388.627, 124.25), (832.688, 388.627, 124.25), false);
	CreateRamp((832.688, 388.627, 138.25), (832.688, 388.627, 138.25), false);
	CreateMysteryBox((600.386, 32.4155, 91.2485), (90, 90, 0), 150);
	
	CreateFlag((689.16, 4586.8, -135.875), (689.861, 4764.62, -135.875), false, true);//bunker 2
	CreateRamp((748.098, 5662.96, -72), (748.098, 5402.81, -72), false);
	CreateRamp((599.753, 5842.36, -143.875), (1020.16, 5842.36, -37), false);
	CreateDoor((1055.21, 5949.4, -23.8461), (870.77, 5843.33, -56.7367), 2, (90, 90, 90), 2, 2, 20, 100);
	CreateGrid((1057.48, 5792.78, -39.7211), (1223.52, 6042.56, -39.7211), false);
	CreateFlag((1207.79, 6050.42, -23.8461), (871.135, 4140.26, -139.875), false, false);
	CreateRamp((231.745, 6200.41, -98), (760.977, 6200.41, -98), true);//barrier
	CreateRamp((1001.14, 5911.94, 33.5217), (730.359, 5916.96, -135.875), true);//barrier
	CreateRamp((1001.14, 5911.94, 103.5217), (730.359, 5916.96, -65.875), true);//barrier
	CreateRamp((1001.14, 5911.94, 33.5217), (1022.47, 6208.13, 33.5217), true);//barrier
	CreateRamp((1013.16, 6109.42, 33.5217), (1262.55, 6113.35, 33.5217), true);//barrier
	CreateRamp((752.432, 6148.77, -72.2324), (752.432, 5968.21, -72.2324), true);//barrier
}

Drone()
{
	level thread removeSkyBarrier()
	CreateFlag((-329.68, 8431.06, 322.672), (-33.8727, -931.003, -39.875), false, false); // Dont remove
	CreateFlag((-329.68, 8431.06, 322.672), (-33.8727, -931.003, -39.875), false, false); // bunker escape flag
	CreateFlag((998.876, 3702.04, 298.218), (585.0149, 7178.51, 306.672), false, True); //enter bunker
	CreateMysteryBox((434.989, -777.067, 240.125), (0, 180, 0), 150);
	CreateWall((464.431, 6926.81, 360.676), (849.875, 7100.98, 320.511)); // 1st back wall
	CreateWall((240.72, 7671.27, 306.672), (418.682, 7745.64, 397.672)); // 2nd back wall
	CreateWall((-50.7627, 8402.28, 306.672), (68.1149, 8509.7, 420.672)); //front right wall
	CreateWall((-158.503, 8321.72, 306.672), (-293.008, 8235.62, 420.672)); //front left wall
	CreateWall((-448.359, -636.762, 239.702), (-24.413, -666.683, 280.125)); // 1st plat wall
	CreateWall((202.322, -1162.11, 230.597), (202.66, -1084.42, 320.182)); // room wall
	CreateWall((-12.6804, -1502.63, 50.3447), (-9.80337, -1565.91, 170.863)); // 2nd plat wall
	CreateRamp((-254.393, 8267.81, 417.825), (57.0122, 8502.17, 417.825)); // 1st bunker ramp/floor
	CreateRamp((-295.4, 8313.46, 417.825), (12.4179, 8562.77, 417.825)); // 2nd bunker ramp/floor
	CreateRamp((-284.103, 8370.66, 428.526), (-481.152, 8588.01, 455.653)); // 1st bunker ramp
	CreateRamp((-199.233, 8693.32, 320.504), (-71.9255, 8556.26, 419.866)); // 2nd bunker ramp
	CreateRamp((-258.517, 8859.44, 451.811), (-547.972, 8584.76, 451.811)); // back ramp/floor
	CreateDoor((-97.5456, 8358.69, 410.011), (-105.688, 8355.64, 312.672), 5, (90, 125, 0), 2, 2, 25, 80); //1st bunker door
	CreateDoor((851.847, -1002.64, 240.125), (1005.49, -1001.51, 240.125), 5, (90, 90, 0), 4, 2, 25, 80); //1nd room door
	CreateElevator((-498.157, -868.63, -15.1372), (-498.157, -868.63, 250.043), 3, 2); // plat elevator
	CreateFlag((-2008, -1989, 80), (-2008, -2262, 79), false, true);
}

Carrier()
{
    level thread removeSkyBarrier();
    //V1.0 Made BY:SKONAFID/SPARX
    //1st bunker
    CreateWall((-2484.02, 1454.88, -36.9663), (-2494.62, 1037.86, -67.875));
    CreateDoor((-2497.21, 1125.37, -67.875), (-2497.95, 968.823, -67.875), 3, (90, 90, 90), 7, 2, 30, 80);
    CreateFlag((-3007.86, 1401.45, -67.875), (-6279.72, 482.6, -179.875), false, false);
    CreateFlag((-3722.25, 863.286, -40.875), (-2120.28, 1396.52, -67.875), true, false);

    //2nd bunker
    CreateWall((-6289.36, 75.2229, -180.711), (-6099.52, 72.9107, -179.875));
    CreateWall((-6288.53, 72.5659, -154.836), (-6124.77, 71.9364, -155.103));
    CreateWall((-6129.9, 71.2682, -130.734), (-6289.36, 74.0885, -128.961));
    CreateDoor((-6051.35, -38.2957, -179.875), (-6055.98, 73.5169, -179.875), 3, (90, 90, 0), 5, 2, 30, 80);
    CreateFlag((-6272.5, -568.581, -179.875), (-6178.2, -984.667, 44.125), false, false);

    //boat
    CreateZipline((-4943.38, -2016.18, -75.875), (-5881.25, -17879.1, -305.853), 6, true);
    CreateGrid((-5831.09, -17980.4, -310.841), (-5944.11, -18617.8, -299.995));
    CreateGrid((-5412.95, -18667.8, -207.327), (-5331.11, -18272, -198.119));
    CreateRamp((-5851.56, -18527, -308.273), (-5416.95, -18520.6, -183.835));
    CreateDoor((-5945.75, -18527.8, -308.273), (-5763.73, -18525.8, -264.265), 3, (90, 90, 90), 4, 2, 30, 80);
    CreateZipline((-5328.71, -18196.5, -215.099), (-557.016, -1731.2, -187.363), 6, true);

    //bunker3
    CreateZipline((371.516, -1535.27, -267.875), (-2193.34, 873.727, -67.875), 4, false);
    CreateWall((-193.788, -1649.19, -237.952), (-186.651, -1064.97, -267.875));
    CreateDoor((-153.206, -1163.58, -267.875), (-186.277, -997.394, -267.875), 3, (90, 90, 90), 7, 2, 30, 80);
    CreateWall((-193.248, -1696.87, -197.556), (-186.129, -1094.37, -193.463));
}

Overflow()
{
		//Created By xKraveModz
	level thread removeSkyBarrier();
	CreateWall((-319.097,-2947.62,-31.875), (125.243,-3382.55,96.1576), false);//Wall #1
	CreateWall((106.148,-3376.44,-33.886), (-147.088,-3632.31,96.1576), false);//Wall #2
	CreateWall((-140.202,-3626.67,-31.875), (-602.35,-3180.11,96.1576), false);//Wall #3
	CreateDoor((-558.92,-3154.8,-31.875), (-495.009,-3075.26,-31.875), 3,(90,135,0),11,2,20,80);//Door To Bunker
	CreateMysteryBox((38.7811,-3380.98,-32.7998), (0,135,0), 50);//Mystery Box #1
	CreateMysteryBox((-24.3675,-3443.36,-31.875), (0,135,0), 50);//Mystery Box #2
	CreateFlag((-141.022,-3539.69,-31.875), (2323.12,-840.106,8.6945), false, false);//Teleport Out Of Bunker
	CreateWall((-336.962,-2889.13,-31.875), (-796.4148,-2221.81,96.1576), true);//Invisable Wall #1
	CreateWall((-396.83,-3426.24,-31.875), (-598.889,-3642.65,96.1576), true);//Invisable Wall #2
	CreateFlag((-2289.24,-836.36,-131.875), (-1221.51,-2152.18,-22.2549), false, false);//Teleport Into Bunker Area
	CreateFlag((-179.303,1912.92,97.125), (2982.43,-458.262,40.125), true, false);//Hidden Flag #1 To Sand Box
	CreateTurret((2377.07,-635.723,48.8142),(0,175,0), "auto_gun_turret_mp");//Turret In Hidden Flag #1 Area
	CreateFlag((-1761.16,-1472.99,-33.8754), (-1892.38,924.653,-5.8609), true, false);//Hidden Flag #2 To Outside Map Area
	CreateTurret((-1237.48,2248.56,-6.40662),(0,-50,0), "auto_gun_turret_mp");//Turret In Hidden Flag #2 Area
	CreateFlag((225.621,2349.88,72.2772), (1890.3,-88.6554,64.125), false, false);//Hidden Flag To Escape Hidden Flag #2 Area
	CreateZipline((1060.76,-1207.14,0.430733), (1083.7,-1838.08,-7.875),3,true);//Zipline To Alley Way
	CreateFlag((667.027,-1810.16,-7.875), (163.102,2203.98,472.125), false, true);//Flag From Alley To Roof #1
	CreateFlag((-231.34,2249.67,472.261), (-410.887,2200.24,400.125), false, true);//Teleport From  Roof #1 To Roof #2
	CreateFlag((263.634,-1481.54,-23.875), (-951.664,-485.596,0.125), false, true);//Teleport To Bank
	CreateMysteryBox((-126.355,1614.05,472.125), (0,90,0), 50);//Mystery Box #3
	CreateFlag((-177.033,-79.7607,-6.125), (-2954.46,3964.38,177.005), false, false);//Death Trap Flag (Troll) xD
	CreateFlag((-973.144,-696.534,0.125), (494.402,-2187.12,-31.0116), false, true);//Teleport From Bank To Alley Way #2
	CreateMysteryBox((-1068.01,-2208.6,-39.875), (0,90,0), 100);//Mystery Box #4
	CreateDoor((-523.241,-2224.36,-17.4754), (-524.236,-2132.68,-17.4754), 3,(90,0,0),7,2,20,80);//Door To Alley Way #2 -17.4754
	
}

Slums() // Created by CKG -CraZy KiD GaMeR- aka Scifen
{
	level thread removeSkyBarrier();
	CreateWall((1685.14, 2318.22, 584.125), (2068.61, 2324.59, 708.856), false);//Wall #1
	CreateWall((2256.81, 2039.68, 584.125), (1721.72, 1848.39, 708.856), false);//Wall #2
	CreateWall((2068.61, 2324.59, 584.125), (2256.81, 2039.68, 708.856), false);//Wall #3
	CreateDoor((1685.14, 2193.59, 584.125), (1689.07, 2001.46, 597.269), 3,(90,190,0),8,2,20,80);//Door To Bunker
	CreateMysteryBox((2098.98, 2215.81, 576.125), (0,215,0), 75);//Mystery Box #1
	CreateMysteryBox((2145.91, 2144.76, 576.125), (0,215,0), 75);//Mystery Box #2
	CreateFlag((-53.2659, 1623.53, 576.125), (726.095, 1609.28, 584.125), false, true);//Teleport To Bunker Area
	CreateFlag((722.17, -3456.36, 548.286), (1838.01, -1114.61, 620.125), true, false);//Hidden Flag #1 1117.56, 1319.2, 580.16
	CreateFlag((-507.641, -2443.35, 491.882), (1131, 2199.15, 744.125), true, false);//Hidden Flag #2
	CreateFlag((933.641, 2224.86, 744.125), (-1082.64, 402.365, 562.125), false, false);//Escape Hidden Flag #2 Area
	CreateFlag((2121.48, 2181.75, 627.513), (631.246, -709.675, 622.125), true, false);//Escape Flag From Bunker
	CreateMysteryBox((1171.25, -1833.23, 508.125), (0,180,0), 90);//Mystery Box #3
	CreateDoor((966.545, -1770.08, 508.125), (961.067, -1866.33, 508.125), 2,(90,180,0),4,2,15,80);//Door To Little Corner
	CreateWall((1149.85, -1690.72, 508.125), (990.514, -1682.73, 597.269), false);//Cover Entrance To Little Corner
	CreateFlag((1178.36, -1954.97, 587.086), (390.778, -698.985, 622.125), true, false);//Escape Flag From Corner
	
//Thanks for using my map! Subscribe and stay updated @xKraveModz <3	
}

Turbine()
{   
    level thread removeSkyBarrier();
	CreateFlag((-386.575, -2263.15, 156.848), (-473, -2476, 164), false, false);
	CreateFlag((-1352.49, -4001.75, 609.834), (-1938.15, -4275.27, 750.011), false, false);// to platform
	CreateGrid((-1861.66, -4246.43, 734.136), (-2012.95, -4416.41, 734.136), 90, false);
	CreateRamp((-2236.18, -4311.71, 677.744), (-2236.18, -4311.71, 677.744), false);
	CreateRamp((-2243.08, -4451.6, 659.177), (-2243.08, -4451.6, 659.177), false);
	
	CreateZipline((-2434.09, -4579.86, 556.435), (-2851.76, -4288.05, 531.58), 1, false);//to bunker
	CreateZipline((-2439.19, -4259.27, 597.587), (-2763.02, -4227.9, 531.58), 1, false);
	
	CreateGrid((-2748.19, -3755.66, 515.705), (-2935.19, -4292.38, 515.705), 90, false);//bunker
	CreateRamp((-2748.19, -4092.71, 600), (-2854.94, -4091.9, 600), false);
	CreateRamp((-2748.19, -4092.71, 580), (-2854.94, -4091.9, 580), false);
	CreateRamp((-2748.19, -4092.71, 555), (-2854.94, -4091.9, 555), false);
	CreateDoor((-2912.01, -3965.02, 531.58), (-2912.01, -4091.27, 531.58), 3, (90, 0, 90), 2, 2, 30, 60);
	CreateFlag((-2911.24, -3768.26, 531.58), (1658.4, 2425.54, 210.125), false, false);
}

Raid()
{ 
	level thread removeSkyBarrier();
    CreateWall((375, 3336, 130.052), (225, 3336, 130.051));
    CreateDoor((972, 4542, -3), (1039, 4260, -3), 2, (90, 0, 0), 4, 2, 40, 80);
    CreateMysteryBox((260, 4665, 197), (0, 90, 0), 50);
    CreateFlag((2249, 4191, -1), (2311, 6050, 320), false, false);
    CreateGrid((842, 4664, 182), (222, 4408, 182));
    CreateFlag((3020, 4574, -4),(143, 3345, -3), true, false);
    CreateFlag((1026, 5039, -75), (4686, 3702, 614), true, false);
    CreateFlag((784, 1357, 102), (1450, 2189, 360), true, false);
    CreateMysteryBox((1222, 2184, 360), (0, 90, 0), 0);
    Createzipline((318, 3415, 96), (1623, 4340, 132), true);
    CreateElevator((891, 4615, -3), (891, 4615, 197), 2, 2);
    Createflag((1389, 1623, 614), (2469, 4436, 16), false, false);
    Createzipline((281, 3663, -3), (1623, 4340, 132), true);
    Createzipline((1456, 2099, 360), (1623, 4340, 132), true);

}

Aftermath()
{ 
level thread removeSkyBarrier();
 
//Interactive Objects
CreateWall((-1690, -132, -265), (-1690, -162, -140), false); //Blocker 1
CreateWall((-2098, 215, -200), (-2098, 230, -90), false); //Blocker 2
CreateWall((-650, -592, -260), (-580, -592, -140), false); //Blocker 3
CreateFlag((-1885, -209, -260), (-860, -1228, -268), false, false); //Flag From Building to Parking Lot Floor 1
CreateFlag((1173, -2152, -44), (-694, -1831, 115), false, false); //Flag From Parking Lot Floor 2 to Parkinglot Floor 3
CreateFlag((-3447, -1690, -207), (-510, -1200, 221), false, false); //Restart Parcore Flag
CreateFlag((-3034, -3249, 294), (-1190, 5360, -263), false, false); //Base Escape Back into Map
CreateDoor((-500, 280, -44), (-300, 280, -44), 3, (90, 90, 0), 5, 2, 30, 60); // Door 1
CreateDoor((-245, -1790, -44), (-245, -1610, -44), 3, (90, 0, 0), 5, 2, 20, 60); // Door 2
CreateDoor((-3700, -3198, -207), (-3450, -3198, -207), 3, (90, 90, 0), 8, 2, 30, 60); //Door 3
CreateZipline((0, -1990, -268), (-768, -1990, -44), 2, true); //Zipline to ParkingLot Floor 2
CreateMysteryBox((-2033, 31, -60), (0, 90, 0), 150); //Mystery Box 1
CreateMysteryBox((-3077, -3967, -207), (0, 90, 0), 150); //Mystery Box 2
 
//Ground
CreateObject(("veh_iw_civ_firetruck"), (-1973, 534, -142), (0, 90, 0)); //Ground
CreateObject(("veh_iw_civ_firetruck"), (-1602, 560, -203), (0, 90, 0)); //Ground
CreateObject(("veh_iw_civ_firetruck"), (-1476, -40, -268), (0, 90, 0)); //Ground       
CreateObject(("veh_iw_civ_firetruck"), (-1807, 709, -220), (35, 0, 0)); //Ground Ramp FireTruck
CreateObject(("veh_iw_civ_firetruck"), (-1232, -65, -262), (0, 0, 0)); //Ground
CreateObject(("veh_iw_civ_firetruck"), (-1135, -65, -262), (325, 0, 0)); //Ground Ramp FireTruck
CreateObject(("veh_iw_civ_suv_whole_red"), (-1306, -368, -190), (0, 113, 0)); //Ground
CreateObject(("veh_iw_civ_ambulance_whole"), (-1514, 409, -211), (0, 130, 0)); //Ground
 
//ParkingLot Floor 1
CreateObject(("veh_iw_civ_firetruck"), (-100, -1900, -268), (0, 90, 0)); //ParkingLot Floor 1
CreateObject(("veh_iw_civ_firetruck"), (100, -1900, -268), (0, 90, 0)); //ParkingLot Floor 1
CreateObject(("veh_iw_civ_firetruck"), (0, -2140, -268), (0, 0, 0)); //ParkingLot Floor 1
 
//ParkingLot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-580, -1738, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-907, -1294, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-535, -1540, -44), (0, 90, 0)); //ParkingLot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-907, -880, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-530, -880, -44), (0, 0, 0)); //Parkinglot Floor 2
 
CreateObject(("veh_iw_civ_firetruck"), (-317, -2137, -44), (0, 90, 0)); //ParkingLot Floor 2   
CreateObject(("veh_iw_civ_firetruck"), (-317, -1877, -44), (0, 90, 0)); //ParkingLot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-907, -2300, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-485, -2300, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (-100, -2300, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (300, -2300, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (700, -2300, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (1100, -2300, -44), (0, 0, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (1280, -2100, -44), (0, 90, 0)); //Parkinglot Floor 2
CreateObject(("veh_iw_civ_firetruck"), (1280, -1700, -44), (0, 90, 0)); //Parkinglot Floor 2
 
//Parkinglot Floor 3
CreateObject(("veh_iw_civ_suv_whole_black"), (-588, -1734, 115), (0, 135, 0)); //Parkinglot Floor 3
CreateObject(("veh_iw_civ_firetruck"), (-207, -1521, 115), (0, 0, 0)); //ParkingLot Floor 3
CreateObject(("veh_t6_police_car_destructible"), (347, -1403, 115), (0, 0, 0)); //ParkingLot Floor 3
CreateObject(("veh_t6_police_car_destructible"), (770, -1384, 115), (0, 130, 0)); //ParkingLot Floor 3
CreateObject(("veh_iw_civ_firetruck"), (471, -803, 115), (0, 20, 0)); //Parkinglot Floor 3
CreateObject(("veh_iw_civ_firetruck"), (379, -119, 115), (0, 90, 0)); //Parkinglot Floor 3
CreateObject(("veh_iw_civ_suv_whole_beige"), (174, -450, 115), (0, 100, 0)); //Parkinglot Floor 3
       
CreateObject(("veh_iw_civ_firetruck"), (-183, -230, 40), (35, 90, 0)); //Ramp FireTruck                
CreateObject(("veh_iw_civ_firetruck"), (-186, -555, 115), (0, 90, 0)); //Parkinglot Floor 3    
CreateObject(("veh_iw_civ_firetruck"), (-186, -905, 115), (0, 90, 0)); //Parkinglot Floor 3
CreateObject(("veh_iw_civ_firetruck"), (-186, -1050, 115), (0, 90, 0)); //Parkinglot Floor 3
CreateObject(("veh_iw_civ_firetruck"), (-412, -1200, 115), (0, 0, 0)); //Parkinglot Floor 3
CreateObject(("veh_iw_civ_firetruck"), (-825, -1200, 115), (0, 0, 0)); //Parkinglot Floor 3
 
//Sideways Elevator
CreateCarElevator((-1130, -1200, 97), (-3386, -1200, 97), ( 0, 90, 0), 7.5, 7); //Rear Piece
CreateCarElevator((-1460, -1200, 97), (-3694, -1200, 97), ( 0, 90, 0), 7.5, 7); //Front Piece
CreateCarElevator((-1284, -1000, 97), (-3540, -1000, 97), ( 0, 0 , 0), 7.5, 7); //Left Siding
CreateCarElevator((-1284, -1200, 115), (-3540, -1200, 115), ( 0, 0, 180), 7.5, 7); //Middle
CreateCarElevator((-1284, -1100, 115), (-3540, -1100, 115), ( 0, 0, 180), 7.5, 7); //Right
CreateCarElevator((-1284, -1300, 115), (-3540, -1300, 115), ( 0, 0, 180), 7.5, 7); //left
 
//Moving Platforms
CreateCarElevator((-3100, -1500, 115), (-3900, -1500, 115), ( 0, 0, 180), 6, 0.1); //Sideways
CreateCarElevator((-3100, -1900, 115), (-3900, -1900, 115), ( 0, 90, 180), 7.5, 0.5); //Longways
CreateCarElevator((-3100, -2300, 115), (-3900, -2300, 115), ( 0, 90, 180), 6, 0.5); //Longways
CreateCarElevator((-3100, -2700, 115), (-3900, -2700, 115), ( 0, 0, 180), 5, 0.3); //Sideways
CreateCarElevator((-3100, -2850, 115), (-3900, -2850, 115), ( 0, 0, 180), 3, 0.2); //Sideways
 
//First Up and Down Elevator
CreateCarElevator((-3500, -2950, 97), (-3500, -2950, -180), ( 0, 0, 180), 3, 0.5); //Elevator
CreateObject(("veh_iw_civ_firetruck"), (-3100, -2850, -207), (0, 0, 0)); //Elevator Sides
CreateObject(("veh_iw_civ_firetruck"), (-3900, -2850, -207), (0, 0, 0)); //Elevator Sides
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3000, -207), (0, 90, 0)); //Elevator Sides
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3000, -207), (0, 90, 0)); //Elevator Sides
CreateObject(("veh_iw_civ_firetruck"), (-3500, -2850, -207), (0, 0, 0)); //Elevator Back
 
//Second Up and Down Elevator
CreateCarElevator((-3450, -3950, -180), (-3450, -3950, 290), ( 0, 0, 180), 4, 2);
 
//First Floor Walls of Base
CreateObject(("veh_iw_civ_firetruck"), (-3600, -3100, -5), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3600, -3200, -5), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3700, -3200, -5), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3800, -3200, -5), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3200, -5), (90, 90, 0)); //Castle Left Side Front
 
CreateObject(("veh_iw_civ_firetruck"), (-3300, -3100, -5), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3200, -5), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3300, -3200, -5), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3200, -5), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3100, -3200, -5), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3200, -5), (90, 90, 0)); //Castle Right Side Front
 
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3200, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3300, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3400, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3500, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3600, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3700, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3800, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3900, -5), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -4000, -5), (90, 180, 0)); //Castle Left Side
 
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3200, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3300, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3400, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3500, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3600, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3700, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3800, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3900, -5), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -4000, -5), (90, 0, 0)); //Castle Right Side
 
CreateObject(("veh_iw_civ_firetruck"), (-3600, -4000, -5), (90, 270, 0)); //Castle Left Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3700, -4000, -5), (90, 270, 0)); //Castle Left Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3800, -4000, -5), (90, 270, 0)); //Castle Left Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3900, -4000, -5), (90, 270, 0)); //Castle Left Side Back
 
CreateObject(("veh_iw_civ_firetruck"), (-3500, -4000, -5), (90, 270, 0)); //Castle Middle Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3400, -4000, -5), (90, 270, 0)); //Castle Middle Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3300, -4000, -5), (90, 270, 0)); //Castle Middle Side Back
 
CreateObject(("veh_iw_civ_firetruck"), (-3200, -4000, -5), (90, 270, 0)); //Castle Right Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3100, -4000, -5), (90, 270, 0)); //Castle Right Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3000, -4000, -5), (90, 270, 0)); //Castle Right Side Back
 
//Second Floor Walls of Base
CreateObject(("veh_iw_civ_firetruck"), (-3600, -3100, 395), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3600, -3200, 395), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3700, -3200, 395), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3800, -3200, 395), (90, 90, 0)); //Castle Left Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3200, 395), (90, 90, 0)); //Castle Left Side Front
       
CreateObject(("veh_iw_civ_firetruck"), (-3300, -3100, 395), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3200, 395), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3300, -3200, 395), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3200, 395), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3100, -3200, 395), (90, 90, 0)); //Castle Right Side Front
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3200, 395), (90, 90, 0)); //Castle Right Side Front
 
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3200, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3300, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3400, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3500, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3600, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3700, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3800, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3900, 395), (90, 180, 0)); //Castle Left Side
CreateObject(("veh_iw_civ_firetruck"), (-3900, -4000, 395), (90, 180, 0)); //Castle Left Side
 
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3200, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3300, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3400, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3500, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3600, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3700, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3800, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3900, 395), (90, 0, 0)); //Castle Right Side
CreateObject(("veh_iw_civ_firetruck"), (-3000, -4000, 395), (90, 0, 0)); //Castle Right Side
 
CreateObject(("veh_iw_civ_firetruck"), (-3600, -4000, 395), (90, 270, 0)); //Castle Left Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3700, -4000, 395), (90, 270, 0)); //Castle Left Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3800, -4000, 395), (90, 270, 0)); //Castle Left Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3900, -4000, 395), (90, 270, 0)); //Castle Left Side Back
 
CreateObject(("veh_iw_civ_firetruck"), (-3500, -4000, 395), (90, 270, 0)); //Castle Middle Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3400, -4000, 395), (90, 270, 0)); //Castle Middle Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3300, -4000, 395), (90, 270, 0)); //Castle Middle Side Back
 
CreateObject(("veh_iw_civ_firetruck"), (-3200, -4000, 395), (90, 270, 0)); //Castle Right Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3100, -4000, 395), (90, 270, 0)); //Castle Right Side Back
CreateObject(("veh_iw_civ_firetruck"), (-3000, -4000, 395), (90, 270, 0)); //Castle Right Side Back
 
//First Floor Base
CreateObject(("veh_iw_civ_firetruck"), (-3600, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3700, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3800, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3400, 180), (0, 90, 0));
 
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3300, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3100, -3400, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3400, 180), (0, 90, 0));
 
CreateObject(("veh_iw_civ_firetruck"), (-3600, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3700, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3800, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3900, -3800, 180), (0, 90, 0));        
 
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3300, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3200, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3100, -3800, 180), (0, 90, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3000, -3800, 180), (0, 90, 0));
 
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3270, 180), (0, 0, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3370, 180), (0, 0, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3470, 180), (0, 0, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3570, 180), (0, 0, 0));
 
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3100, -120), (0, 0, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3100, -20), (0, 0, 0));
CreateObject(("veh_iw_civ_firetruck"), (-3400, -3100, 100), (0, 0, 0));
 
CreateObject(("veh_iw_civ_firetruck"), (-3454, -3177, 140), (0, 0, 0));
 
//Script End
}
Cargo()
{
level thread removeSkyBarrier();
OrangeContainer((-2025, 2018, -195), ( 0, 90, 0 ));//roll,yaw,Pitch
	BlueContainer((-2375, 2018, -195), ( 0, 90, 0 ));
	OrangeContainer((-2725, 2018, -195), ( 0, 90, 0 ));
	BlueContainer((-3075, 2018, -195), ( 0, 90, 0 ));
	OrangeContainer((-3425, 2018, -195), ( 0, 90, 0 ));
	BlueContainer((-3775, 2018, -195), ( 0, 90, 0 ));
	OrangeContainer((-4125, 2018, -195), ( 0, 90, 0 ));
	BlueContainer((-4475, 2018, -195), ( 0, 90, 0 ));
	
	OrangeContainer((-4590, 1780, -195), ( 0, 0, 0 ));
	BlueContainer((-4590, 1430, -195), ( 0, 0, 0 ));
	OrangeContainer((-4590, 1080, -195), ( 0, 0, 0 ));
	BlueContainer((-4590, 730, -195), ( 0, 0, 0 ));
	OrangeContainer((-4590, 380, -195), ( 0, 0, 0 ));
	BlueContainer((-4590, 30, -195), ( 0, 0, 0 ));
	OrangeContainer((-4590, -320, -195), ( 0, 0, 0 ));
	BlueContainer((-4590, -670, -195), ( 0, 0, 0 ));
	OrangeContainer((-4590, -1020, -195), ( 0, 0, 0 ));
	BlueContainer((-4590, -1370, -195), ( 0, 0, 0 ));
	OrangeContainer((-4590, -1720, -195), ( 0, 0, 0 ));
	
	BlueContainer((-4475, -1970, -195), ( 0, 90, 0 ));
	OrangeContainer((-4125, -1970, -195), ( 0, 90, 0 ));
	BlueContainer((-3775, -1970, -195), ( 0, 90, 0 ));
	OrangeContainer((-3425, -1970, -195), ( 0, 90, 0 ));
	BlueContainer((-3075, -1970, -195), ( 0, 90, 0 ));
	OrangeContainer((-2725, -1970, -195), ( 0, 90, 0 ));
	BlueContainer((-2375, -1970, -195), ( 0, 90, 0 ));
	OrangeContainer((-2025, -1970, -195), ( 0, 90, 0 ));      //W 130 L 350 H 130
	BlueContainer((-1675, -1970, -195), ( 0, 90, 0 ));
	OrangeContainer((-1325, -1970, -195), ( 0, 90, 0 ));
	BlueContainer((-975, -1970, -195), ( 0, 90, 0 ));
	OrangeContainer((-625, -1970, -195), ( 0, 90, 0 ));
	
	BlueContainer((-385, -1855, -195), ( 0, 0, 0 ));
	OrangeContainer((-385, -1505, -195), ( 0, 0, 0 ));
	
	RedContainer((-4350, 380, -195), ( 0, 90, 0 ));//Path to building
	RedContainer((-4000, 380, -195), ( 0, 90, 0 ));
	
	WhiteContainer((-3650, -10, -65), ( 0, 90, 0 ));//R Walls 1
	WhiteContainer((-3650, 770, -65), ( 0, 90, 0 ));
	WhiteContainer((-3300, -10, -65), ( 0, 90, 0 ));//L Walls 1
	WhiteContainer((-3300, 770, -65), ( 0, 90, 0 ));
	
	WhiteContainer((-3650, -10, 195), ( 0, 90, 0 ));//R Walls 2
	WhiteContainer((-3650, 770, 195), ( 0, 90, 0 ));
	WhiteContainer((-3300, -10, 195), ( 0, 90, 0 ));//L Walls 2
	WhiteContainer((-3300, 770, 195), ( 0, 90, 0 ));
	
	WhiteContainer((-3650, -10, 325), ( 0, 90, 0 ));//R Walls 3
	WhiteContainer((-3650, 770, 325), ( 0, 90, 0 ));
	WhiteContainer((-3300, -10, 325), ( 0, 90, 0 ));//L Walls 3
	WhiteContainer((-3300, 770, 325), ( 0, 90, 0 ));
	
	
	WhiteContainer((-3763, 623, 65), ( 0, 0, 0 ));
	WhiteContainer((-3763, 623, -65), ( 0, 0, 0 ));//Front Left wall 1
	
	WhiteContainer((-3763, 136, 65), ( 0, 0, 0 ));
	WhiteContainer((-3763, 136, -65), ( 0, 0, 0 ));//Front Right wall 1
	
	WhiteContainer((-3763, 623, 195), ( 0, 0, 0 ));//Front Left wall 2
	WhiteContainer((-3763, 136, 195), ( 0, 0, 0 ));//Front Right wall 2
	
	WhiteContainer((-3763, 623, 325), ( 0, 0, 0 ));//Front Left wall 3
	WhiteContainer((-3763, 136, 325), ( 0, 0, 0 ));//Front Right wall 3
	
	WhiteContainer((-3193, 525, -65), ( 0, 0, 0 ));//Back walls 1
	WhiteContainer((-3193, 175, -65), ( 0, 0, 0 ));
	 
	WhiteContainer((-3193, 525, 195), ( 0, 0, 0 ));//Back walls 2
	WhiteContainer((-3193, 175, 195), ( 0, 0, 0 ));
	
	WhiteContainer((-3193, 525, 325), ( 0, 0, 0 ));//Back walls 3
	WhiteContainer((-3193, 175, 325), ( 0, 0, 0 ));
	
	WhiteContainer((-3193, 175, 65), ( 0, 0, 0 ));//
	WhiteContainer((-3193, 525, 65), ( 0, 0, 0 ));//
	WhiteContainer((-3323, 525, 65), ( 0, 0, 0 ));//
	
	WhiteContainer((-3650, -10, 65), ( 0, 90, 0 ));//F Roof 1
	WhiteContainer((-3650, 120, 65), ( 0, 90, 0 ));
	WhiteContainer((-3650, 250, 65), ( 0, 90, 0 ));
	WhiteContainer((-3650, 380, 65), ( 0, 90, 0 ));
	WhiteContainer((-3650, 510, 65), ( 0, 90, 0 ));
	//WhiteContainer((-3650, 640, 65), ( 0, 90, 0 ));
	WhiteContainer((-3650, 770, 65), ( 0, 90, 0 ));
	
	WhiteContainer((-3300, -10, 65), ( 0, 90, 0 ));//B Roof 1
	WhiteContainer((-3300, 120, 65), ( 0, 90, 0 ));
	WhiteContainer((-3300, 250, 65), ( 0, 90, 0 ));
	WhiteContainer((-3300, 380, 65), ( 0, 90, 0 ));
	WhiteContainer((-3300, 510, 65), ( 0, 90, 0 ));
	//WhiteContainer((-3300, 640, 65), ( 0, 90, 0 ));
	WhiteContainer((-3300, 770, 65), ( 0, 90, 0 ));
	
	WhiteContainer((-3650, -10, 455), ( 0, 90, 0 ));//F Roof 2
	WhiteContainer((-3650, 120, 455), ( 0, 90, 0 ));
	WhiteContainer((-3650, 250, 455), ( 0, 90, 0 ));
	WhiteContainer((-3650, 380, 455), ( 0, 90, 0 ));
	WhiteContainer((-3650, 510, 455), ( 0, 90, 0 ));
	WhiteContainer((-3650, 640, 455), ( 0, 90, 0 ));
	WhiteContainer((-3650, 770, 455), ( 0, 90, 0 ));
	
	WhiteContainer((-3300, -10, 455), ( 0, 90, 0 ));//B Roof 2
	WhiteContainer((-3300, 120, 455), ( 0, 90, 0 ));
	WhiteContainer((-3300, 250, 455), ( 0, 90, 0 ));
	WhiteContainer((-3300, 380, 455), ( 0, 90, 0 ));
	WhiteContainer((-3300, 510, 455), ( 0, 90, 0 ));
	WhiteContainer((-3300, 640, 455), ( 0, 90, 0 ));
	WhiteContainer((-3300, 770, 455), ( 0, 90, 0 ));
	
	WhiteContainer((-3420, 640, -25), ( 0, 90, -45 ));//ramp 1

	WhiteContainer((-3650, -10, -195), ( 0, 90, 0 ));//F Floor
	WhiteContainer((-3650, 120, -195), ( 0, 90, 0 ));
	WhiteContainer((-3650, 250, -195), ( 0, 90, 0 ));
	WhiteContainer((-3650, 380, -195), ( 0, 90, 0 ));
	WhiteContainer((-3650, 510, -195), ( 0, 90, 0 ));
	WhiteContainer((-3650, 640, -195), ( 0, 90, 0 ));
	WhiteContainer((-3650, 770, -195), ( 0, 90, 0 ));
	
	WhiteContainer((-3300, -10, -195), ( 0, 90, 0 ));//B Floor
	WhiteContainer((-3300, 120, -195), ( 0, 90, 0 ));
	WhiteContainer((-3300, 250, -195), ( 0, 90, 0 ));
	WhiteContainer((-3300, 380, -195), ( 0, 90, 0 ));
	WhiteContainer((-3300, 510, -195), ( 0, 90, 0 ));
	WhiteContainer((-3300, 640, -195), ( 0, 90, 0 ));
	WhiteContainer((-3300, 770, -195), ( 0, 90, 0 ));
	
	BlueContainer((-3980, 380, 155), ( 0, 90, 30 ));//ramp 2
	BlueContainer((-4280, 380, 329), ( 0, 90, 30 ));
	
	BlueContainer((-4545, 380, 402), ( 0, 90, 0 ));//Pathway 2
	BlueContainer((-4895, 380, 402), ( 0, 90, 0 ));
	
	RedContainer((-5245, -270, 402), ( 0, 90, 0 ));//Floor 1 Front B2
	RedContainer((-5245, -140, 402), ( 0, 90, 0 ));
	RedContainer((-5245, -10, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 120, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 120, 532), ( 0, 90, 0 ));//Wall
	RedContainer((-5245, 250, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 380, 402), ( 0, 90, 0 ));//middle
	RedContainer((-5245, 510, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 640, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 640, 532), ( 0, 90, 0 ));//Wall
	RedContainer((-5245, 770, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 900, 402), ( 0, 90, 0 ));
	RedContainer((-5245, 1030, 402), ( 0, 90, 0 ));
	
	RedContainer((-5595, -270, 402), ( 0, 90, 0 ));//Floor 1 Mid B2
	RedContainer((-5595, -140, 402), ( 0, 90, 0 ));
	RedContainer((-5595, -10, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 120, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 120, 532), ( 0, 90, 0 ));//Wall
	RedContainer((-5595, 250, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 380, 402), ( 0, 90, 0 ));//middle
	RedContainer((-5595, 510, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 640, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 640, 532), ( 0, 90, 0 ));//Wall
	RedContainer((-5595, 770, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 900, 402), ( 0, 90, 0 ));
	RedContainer((-5595, 1030, 402), ( 0, 90, 0 ));
	
	RedContainer((-5945, -270, 402), ( 0, 90, 0 ));//Floor 1 Back B2
	RedContainer((-5945, -140, 402), ( 0, 90, 0 ));
	RedContainer((-5945, -10, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 120, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 250, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 380, 402), ( 0, 90, 0 ));//middle
	RedContainer((-5945, 510, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 640, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 770, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 900, 402), ( 0, 90, 0 ));
	RedContainer((-5945, 1030, 402), ( 0, 90, 0 ));
	
	RedContainer((-5138, 623, 532), ( 0, 0, 0 ));//F walls
	RedContainer((-5138, 136, 532), ( 0, 0, 0 ));
	RedContainer((-5138, 800, 532), ( 0, 0, 0 ));
	RedContainer((-5138, -80, 532), ( 0, 0, 0 ));
	
	RedContainer((-5245, -270, 532), ( 0, 90, 0 ));
	RedContainer((-5245, 1030, 532), ( 0, 90, 0 ));
	RedContainer((-5595, -270, 532), ( 0, 90, 0 ));
	RedContainer((-5595, 1030, 532), ( 0, 90, 0 ));
	RedContainer((-5945, -270, 532), ( 0, 90, 0 ));
	RedContainer((-5945, 1030, 532), ( 0, 90, 0 ));
	
	RedContainer((-6058, -25, 532), ( 0, 0, 0 ));//Back walls
	RedContainer((-6058, 325, 532), ( 0, 0, 0 ));
	RedContainer((-6058, 675, 532), ( 0, 0, 0 ));
	RedContainer((-6058, 800, 532), ( 0, 0, 0 ));
	
	RedContainer((-5245, -270, 662), ( 0, 90, 0 ));//Roof 1 Front B2
	RedContainer((-5245, -140, 662), ( 0, 90, 0 ));
	RedContainer((-5245, -10, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 120, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 250, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 380, 662), ( 0, 90, 0 ));//middle
	RedContainer((-5245, 510, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 640, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 770, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 900, 662), ( 0, 90, 0 ));
	RedContainer((-5245, 1030, 662), ( 0, 90, 0 ));
	
	RedContainer((-5595, -270, 662), ( 0, 90, 0 ));//Roof 1 Mid B2
	RedContainer((-5595, -140, 662), ( 0, 90, 0 ));
	RedContainer((-5595, -10, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 120, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 250, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 380, 662), ( 0, 90, 0 ));//Middle
	RedContainer((-5595, 510, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 640, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 770, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 900, 662), ( 0, 90, 0 ));
	RedContainer((-5595, 1030, 662), ( 0, 90, 0 ));
	
	RedContainer((-5945, -270, 662), ( 0, 90, 0 ));//Roof 1 Back B2
	RedContainer((-5945, -140, 662), ( 0, 90, 0 ));
	RedContainer((-5945, -10, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 120, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 250, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 380, 662), ( 0, 90, 0 ));//middle
	RedContainer((-5945, 510, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 640, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 770, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 900, 662), ( 0, 90, 0 ));
	RedContainer((-5945, 1030, 662), ( 0, 90, 0 ));
	// Elevator Start
	BlueContainer((-4475, 2018, -195), ( 0, 90, 0 ));//Middle
	BlueContainer((-4345, 1888, -195), ( 0, 90, 0 ));//Left
	//BlueContainer((-4475, 1888, -195), ( 0, 90, 0 ));//Left OG
	BlueContainer((-4475, 2148, -195), ( 0, 90, 0 ));//Right
	
	BlueContainer((-4475, 2018, 975), ( 0, 90, 0 ));//Middle
	
	BlueContainer((-4475, 2148, -65), ( 0, 90, 0 ));//Right Mid
	BlueContainer((-4475, 2148, 65), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 195), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 325), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 455), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 585), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 715), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 845), ( 0, 90, 0 ));
	BlueContainer((-4475, 2148, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4345, 1888, -65), ( 0, 90, 0 ));//Left Mid
	BlueContainer((-4475, 1888, 65), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 195), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 325), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 455), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 585), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 715), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 845), ( 0, 90, 0 ));
	BlueContainer((-4475, 1888, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4125, 2148, -195), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, -65), ( 0, 90, 0 ));//Right Front
	BlueContainer((-4125, 2148, 65), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 195), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 325), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 455), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 585), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 715), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 845), ( 0, 90, 0 ));
	BlueContainer((-4125, 2148, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4125, 2018, 65), ( 0, 90, 0 ));//Middle Front
	BlueContainer((-4125, 2018, 195), ( 0, 90, 0 ));
	BlueContainer((-4125, 2018, 325), ( 0, 90, 0 ));
	BlueContainer((-4125, 2018, 455), ( 0, 90, 0 ));
	BlueContainer((-4125, 2018, 585), ( 0, 90, 0 ));
	BlueContainer((-4125, 2018, 715), ( 0, 90, 0 ));
	BlueContainer((-4125, 2018, 845), ( 0, 90, 0 ));
	BlueContainer((-4125, 2018, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4125, 1888, -195), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, -65), ( 0, 90, 0 ));//Left Front
	BlueContainer((-4125, 1888, 65), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 195), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 325), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 455), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 585), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 715), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 845), ( 0, 90, 0 ));
	BlueContainer((-4125, 1888, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4825, 2148, -195), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, -65), ( 0, 90, 0 ));//Right Back
	BlueContainer((-4825, 2148, 65), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 195), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 325), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 455), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 585), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 715), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 845), ( 0, 90, 0 ));
	BlueContainer((-4825, 2148, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4825, 2018, -195), ( 0, 90, 0 ));
	BlueContainer((-4825, 2018, -65), ( 0, 90, 0 ));//Middle Back
	BlueContainer((-4825, 2018, 65), ( 0, 90, 0 ));
	BlueContainer((-4825, 2018, 195), ( 0, 90, 0 ));
	BlueContainer((-4825, 2018, 325), ( 0, 90, 0 ));
	BlueContainer((-4825, 2018, 455), ( 0, 90, 0 ));
	BlueContainer((-4825, 2018, 585), ( 0, 90, 0 ));
	RedContainer((-4825, 2018, 715), ( 0, 90, 0 ));
	//BlueContainer((-4825, 2018, 845), ( 0, 90, 0 ));
	BlueContainer((-4825, 2018, 975), ( 0, 90, 0 ));
	
	BlueContainer((-4825, 1888, -195), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, -65), ( 0, 90, 0 ));//Left Back
	BlueContainer((-4825, 1888, 65), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 195), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 325), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 455), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 585), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 715), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 845), ( 0, 90, 0 ));
	BlueContainer((-4825, 1888, 975), ( 0, 90, 0 ));
	
	CreateOrangeElevator((-4475, 2018, -195), (-4475, 2018, 715), (0, 90, 0), 4, 2);
	
	RedContainer((-5175, 2018, 715), ( 0, 90, 0 ));//Top path S M
	
	RedContainer((-5175, 2148, 715), ( 0, 90, 0 ));//R
	RedContainer((-5175, 2278, 715), ( 0, 90, 0 ));
	
	RedContainer((-4830, 2278, 773), ( 0, 90, -20 ));//RS Ramp
	RedContainer((-4607.5, 2278, 853.5), ( 0, 90, -20 ));
	RedContainer((-4423, 2278, 922), ( 0, 90, -20 ));//UP
	RedContainer((-4125, 2278, 975), ( 0, 90, 0 ));
	
	RedContainer((-5175, 1888, 715), ( 0, 90, 0 ));//L
	RedContainer((-5175, 1758, 715), ( 0, 90, 0 ));
	
	RedContainer((-4830, 1758, 773), ( 0, 90, -20 ));//LS Ramp
	RedContainer((-4607.5, 1758, 853.5), ( 0, 90, -20 ));
	RedContainer((-4423, 1758, 922), ( 0, 90, -20 ));//UP
	RedContainer((-4125, 1758, 975), ( 0, 90, 0 ));
    
}
Standoff()
{ 		
	level thread removeSkyBarrier();
	CreateZipline((-915.487, 494.567, 112.125), (-149.797, 286.336, 416.125), 2, true);
	CreateFlag((-29.4653, 324.668, 406.869), (-1004.61, -1211.63, 144.125), false, false); 
	CreateWall((-831.719, -1509.41, 130.51), (-835.455, -1523.15, 206.446), true);
	CreateWall((-1028.11, -1057.7, 202.643), (-994.003, -1046.86, 110.976), true);
	CreateWall((-1169.95, -1213.25, 182.213), (-1173.61, -1228.18, 106.766), true);
	CreateDoor((-1329.37, -1336.49, 7.69385), (-1180.27, -1348.45, 4.36679), 3, (90, 90, 0), 1, 2, 40, 80); 
	CreateDoor((-811.922, -1629.51, 0.00953701), (-815.906, -1508.66, 8.125), 3, (90, 90, 90), 1, 2, 40, 80);
	CreateMysteryBox((-27.2538, 156.061, 443.871), (0, 180, 0), 150);
	CreateMysteryBox((-967.632, -1382.68, 8.125), (0, 180, 0), 150);
	CreateGrid((743.189, 2523.27, 289.298), (882.167, 2177.48, 326.079), (0, 90, 0), false);
	CreateRamp((1085.21, 2519.93, 295.332), (949.979, 1794.94, -43.8637), false);
	CreateRamp((738.284, 2503.53, 270.064), (522.259, 2044, -54.2939), false);
	CreateFlag((737.389, 1429.19, 7.63348), (953.528, 1753.16, 8.20063), false, true);
	CreateFlag((618.747, 1441.06, 8.125), (506.189, 1922.5, 8.125), false, true);
	CreateDoor((934.783, 2541.61, 305.173), (1060.34, 2384.56, 254.385), 3, (90, 90, 0), 1, 2, 15, 80);
	CreateDoor((846.043, 2537.97, 305.173), (673.618, 2370.18, 201.95), 3, (90, 90, 0), 1, 2, 15, 80);
	CreateMysteryBox((892.985, 2674.25, 305.173), (0, 90, 0), 150);
	createFlag((-1624, -2357, 0), (-2922, -2326, 0), false, true);
	CreateFlag((398, -4866, 8), (228, -1340, 912),  true, true);
	
}

Plaza()
{ 
//Created by SneakerStreet
level thread removeSkyBarrier();
CreateWall((-16347.8, 1455.32, -83.5871), (-16211.1, 1309.94, 40.0661));
CreateWall((-16956.7, 845.661, -83.5871), (-16835.9, 719.3, 40.0661));
CreateDoor((-16831.8, 1333.63, -87.875), (-16941.9, 1435.3, -87.875), 2, (90, 130, 0), 3, 2, 40, 80);
CreateFlag((-16817, 757.063, -79.875), (-16024.2, 3598.98, -119.875), false, false);
CreateMysteryBox((-16471.8, 967.277, -79.875), (0, 132, 0), 200);
CreateWall((-15717.8, 2075.86, -143.929), (-15716.2, 1933, -35.1064));
CreateDoor((-15878.8, 2077.48, -139.875), (-15873.2, 2204.44, -139.375), 2, (90, 90, 0), 3, 2, 40, 80);
CreateFlag((-16217.6, 1416.58, -87.875), (-16024.2, 3598.98, -119.875), false, false);
CreateMysteryBox((-16363.4, 1553.17, -85.875), (0, 42, 0), 200);
CreateDoor((-17605.5, 364.307, -139.875), (-17703.2, 370.599, -139.375), 2, (90, 0, 0), 3, 2, 40, 80);
CreateFlag((-16924.1, 709.523, -87.875), (-18994.8, 1770.75, -152.875), false, false);
CreateWall((-17565.2, 210.16, -139.875), (-17440.3, 208.443, -20.1064));
CreateMysteryBox((-17105.3, 907.332, -85.875), (0, 42, 0), 200);
CreateFlag((-17550.2, 104.653, -139.875), (-15602.3, 2058.21, -138.875), false, true);
CreateTurret((-16696.4, 1191.07, -87.875), (0, 130, 0), "auto_gun_turret_mp");
} 

Yemen()
{ 
	level thread removeSkyBarrier();
	CreateFlag((819.673, 193.533, 26.125), (1006.52, 1096.91, 571.343), false, false); // flag to zipline
	CreateZipline((992.624, 1336.36, 571.243), (1243.58, 2480.77, 1165.13), 2, true);//to bunker
	CreateZipline((847.641, 1336.36, 571.243), (994.163, 2494.75, 1165.13), 2, true);//to bunker
	CreateRamp((1317.82, 2408.45, 1220.89), (934.218, 2411.45, 1220.89), false);
	CreateRamp((934.218, 2411.45, 1205.01), (947.4, 2656.33, 1205.01), false);
	CreateRamp((934.218, 2411.45, 1220.89), (947.4, 2656.33, 1220.89), false);
	CreateRamp((692.729, 2652.43, 1220.89), (947.4, 2656.33, 1220.89), false);
	CreateRamp((700.19, 3000.85, 1220.89), (692.729, 2652.43, 1220.89), false);
	CreateRamp((700.19, 3000.85, 1220.89), (1324.14, 2994.51, 1220.89), false);
	CreateRamp((1317.82, 2408.45, 1220.89), (1324.14, 2994.51, 1220.89), false);
	CreateDoor((1114.84, 2779.93, 1165.13), (1114.84, 2640.74, 1165.13), 2, (90, 90, 0), 3, 2, 25, 80);
	CreateRamp((1196.48, 2640.02, 1189.13), (1318.48, 2635.71, 1189.13), false);
	CreateRamp((1196.48, 2640.02, 1205.01), (1318.48, 2635.71, 1205.01), false);
	CreateRamp((1196.48, 2640.02, 1220.89), (1318.48, 2635.71, 1220.89), false);
	CreateRamp((1033.2, 2640.19, 1189.13), (973.524, 2643.2, 1189.13), false);
	CreateRamp((1033.2, 2640.19, 1205.01), (973.524, 2643.2, 1205.01), false);
	CreateRamp((1033.2, 2640.19, 1220.89), (973.524, 2643.2, 1220.89), false);
	CreateFlag((754.601, 2944.23, 1165.13), (180.159, -1353.21, 264.125), false, false);
	CreateRamp((-309.033, 938.988, 345.125), (-309.033, 938.988, 345.125), false); //house bunker
	CreateDoor((-544.082, 1074.76, 213.148), (-664.043, 1069.76, 213.148), 5, (90, 90, 0), 3, 2, 30, 80);
	CreateMysteryBox((-327.641, 1036.59, 313.125), (0, 0, 0), 100);
}

Dig()
{ 
//Created by xTiibo Modz V1.3 
level thread removeSkyBarrier(); 
CreateDoor((-431, -2150, 92.13), (-690, -2160, 83.13), 2, (90, 90, 0), 6, 2, 25, 80);
CreateFlag((-438, -1490, 72), (-391, -2405, 93.343), false, false);
CreateDoor((1385, -654, 170.13), (1385, -654, 245.13), 2, (90, 90, 0), 3, 2, 20, 80);
CreateFlag((-905, -1827, 82), (1010, -1428, 146), false, false);
CreateElevator((1285, -1295.391, 149.125), (1285, -1295.391, 236.792), 2, 1);
CreateWall((-284, -2453, 97.037), (-284, -2316.826, 160.632), true); //1 door
CreateWall((1258, -655.474, 224.037), (1257, -655.474, 314.632), false); //2 door
CreateWall((1939, -1249.474, 272.037), (1940, -1249.474, 352.037), true); //antiglitch 1
CreateWall((1295, -820, 252.037), (1295, -810, 321.037), true); //antiglitch 2
CreateWall((2285, -1246, 262.037), (2284, -1246, 342.037), true); //antiglitch 3
CreateWall((1347, -1247, 281.037), (1348, -1247, 352.037), true); //antiglitch 4
CreateWall((1645, -1248, 265.037), (1644, -1248, 342.037), true); //antiglitch 5
CreateWall((1295, -456, 265.037), (1295, -457, 342.037), true); //antiglitch 6
CreateWall((1292, 330, 232.037), (1560, 330, 231.037), false);
CreateWall((1292, 330, 282.037), (1560, 330, 281.037), false);
CreateDoor((1761, -201, 228.13), (1476, -201, 240.13), 2, (90, 0, 0), 5, 2, 20, 80);
CreateZipline((885.188, -1152, 120.125), (1282, -1120, 250.125), 1, true);
CreateRamp((2063, -230, 211), (2063, -382, 280), false);
CreateMysteryBox((1899, -920, 288.961), (0, 90, 0), 100);
CreateFlag((1886, 28, 227), (1883, 251, 255.343), false, true);
CreateMysteryBox((1238, -557, 220.961), (0, 90, 0), 100);
CreateWall((1230, 336, 247.037), (1231, 336, 297.037), true); //antiglitch 7
CreateWall((1481, -37, 288.037), (1481, -36, 398.037), true); //antiglitch 8
CreateWall((2021.44, 811, 326.037), (1459, 811, 325.037), true);
CreateWall((1463, 802, 326.037), (1465, 435, 325.037), true);
CreateRamp((1503, 370, 210), (1507, 456, 275), true);
CreateFlag((1353, 923, 251), (-2540, 1029, 110.343), false, false);
CreateWall((-2356, 717, 96.037), (-1979, 714, 180.037), true);
CreateDoor((-574, 1314, 97.13), (-734, 1486, 96), 2, (90, 0, 0), 3, 2, 25, 80);
CreateDoor((-257, 1331, 97.13), (-128, 1177, 96), 2, (90, 90, 0), 2, 2, 25, 80);
CreateFlag((-137, 1504, 9), (147, 1316, 245.343), true, true); //hidden flag
CreateFlag((2000, 716, 213), (1993, 764, 295.343), true, false);
CreateWall((-2567, 1034, 119.037), (-2567, 1033, 179.037), true);
CreateMysteryBox((-309, 1504, 97.961), (0, 90, 0), 100);
CreateTurret( (3, 1361, 223.125), (0, 180, 0), "auto_gun_turret_mp" );
CreateDoor((1589, -741, 288.13), (1524, -1143, 235.13), 2, (90, 0, 0), 5, 2, 15, 80);
CreateWall((1408, 558, 296.037), (1407, 564, 350.037), true); //antiglitch 9
CreateWall((1484, 126, 306.037), (1485, 126, 370.037), true); //antiglitch 10
CreateFlag((-1634, 789, 115), (-1568, 848, 88.125), false, false);
CreateWall((-1799, 995, 65.037), (-1799, 996, 95.037), false);
CreateWall((1474, -1051, 282), (1474, -933, 283), true); //antiglitch 11
}

Pod()
{  //Created by SneakerStreet
level thread removeSkyBarrier();
CreateRamp((-1853.95, -283.205, 431.354), (-1853.73, -541.851, 552.879));
CreateGrid((-1881.09, -559.391, 552.879), (-1652.56, -1171.57, 552.879));
CreateWall((-1782.44, -530.608, 552.879), (-1596.61, -530.608, 553.879));
CreateWall((-1782.44, -530.608, 620.456), (-1596.61, -530.608, 621.456));
CreateWall((-1622.73, -547.608, 552.879), (-1622.73, -890.091, 553.879));
CreateWall((-1622.73, -547.608, 620.456), (-1622.73, -890.091, 621.456));
CreateWall((-1622.73, -890.091, 552.879), (-1622.73, -1240.01, 652.331));
CreateFlag((-1896.85, -1205.03, 568.754), (1231.24, -123.347, 271.204), false, false);
CreateMysteryBox((-1657.37, -1043.78, 568.754), (0, 0, 0), 200);
CreateDoor((-1731.34, -565.249, 568.754), (-1861.37, -565.962, 568.77), 2, (90, 90, 0), 2, 2, 35, 80);
CreateFlag((-223.609, 1182.8, 437.228), (-1117.22, -1569.99, 420.125), false, true);
CreateWall((-759.361, 399.641, 416.365), (-670.56, 399.641, 540.365));
CreateDoor((-704.069, 146.653, 420.125), (-674.916, 53.1565, 426.941), 2, (90, 115, 0), 3, 2, 20, 80);
CreateFlag((-592.616, 284.226, 420.125), (694.142, -2266.54, 384.854), false, false);
CreateWall((643.359, -1693.64, 372.152), (490.641, -1698.15, 471.152));
CreateWall((1315.65, -510.299, 243.532), (1515.54, -510.299, 340.532));
CreateWall((1084.35, -470.453, 264.626), (935.74, -470.453, 360.626));
CreateDoor((1008.18, -505.094, 260.841), (889.929, -490.453, 270.227), 2, (90, 90, 0), 2, 2, 30, 80);
CreateMysteryBox((1146.03, -664.641, 246.097), (0, 90, 0), 200);
CreateFlag((584.203, -1609.16, 348.125), (-1863.72, 2090.26, 480.152), false, false);
CreateTurret((1099.96, -1187.69, 260.125), (0, 90, 0), "auto_gun_turret_mp");
 }

Takeoff()
{ 	//Created by speselized5
	level thread removeSkyBarrier();
	//CreateFlag((-377.345, 4304.17, 32.125), (-378.816, 4791.27, 115.426), false, true);
	CreateZipline((479.7, 3321.43, 32.125), (-667.716, 3452.09, 184.125), true);
	CreateDoor((-964.043, 3496.36, 201.465), (-963.085, 3432.2, 201.465), 3, (90, 180, 0), 4, 2, 30, 80);
	CreateWall((-1270.23, 3535.44, 250.027), (-1540.36, 3534.54, 250.20), false);
	CreateWall((-1528.46, 3542.86, 162.88), (-1526.32, 3752.09, 188.763), false);
	CreateWall((-1270.23, 3535.44, 180.027), (-1540.36, 3534.54, 180.20), false);
	CreateFlag((-1526.42, 3688.87, 188.763), (-382.147, 583.253, 64.125), false, false);
	//added by 0zersub
	CreateFlag((176.588, -586.988, -0.875), (-605.78, -373.684, -7.875), true, true);//Hidden place 1
	CreateFlag((-1769.58, 176.412, 0.125), (-1584.36, 455.641, 2.125), true, true);//Hidden place 2 
	CreateGrid((-735.641, 186.101, 32.125), (-768.359, 186.101, 32.125), (90, 90, 0), true);//Block window health center 05
	CreateGrid((-883.315, 189.158, -11.0192), (-905.15, 186.73, -11.0192), (90, 90, 0), true);//Block door health center 05 pt1
	CreateGrid((-883.315, 189.158, 29.9333), (-905.15, 186.73, 29.9333), (90, 90, 0), true);//Block door health center 05 pt2
	CreateDoor((-922.512, 12.78, 14.7714), (-983.655, -84.0735, 14.7714), 3, (90, 0, 0), 1, 2, 30, 80);//Behind door health center 05
	CreateDoor((-305.206, 4.0352, 14.7714), (-429.473, 3.96509, 14.7714), 3, (90, 0, 0), 3, 2, 30, 80);//Front door health center 05
	CreateGrid((614.037, 450.597, 188.125), (575.641, 450.597, 188.125), (90, 90, 0), true);//Block ramp lounge 04
	CreateGrid((1276.98, 772.571, 14.7928), (1276.98, 638.77, 14.7928), (0, 0, 0), false);//Block side door Lounge 04
	CreateGrid((1276.98, 772.571, 30.7928), (1276.98, 638.77, 30.7928), (0, 0, 0), false);//Block side door Lounge 04 pt1
	CreateDoor((1121.78, 518.149, 14.159), (1119.75, 353.967, 14.159), 3, (90, 90, 0), 4, 2, 30, 80);//Behind door Lounge 04
 	CreateDoor((1256.41, 1281.34, 0.125), (1256.41, 1094.62, 43.8369), 3, (90, 90, 0), 4, 2, 30, 80);//Front door Lounge 04
	CreateMysteryBox((832.095, 415.641, 0.125), (0, 90, 0), 100);
	//Added by xTiibo Modz
	CreateFlag((-377.345, 4340.17, 32.125), (-378.816, 4460.27, 31.426), false, true);
	CreateRamp((-397, 4535, 20), (-397, 4665, 100), true);
	CreateRamp((-354, 4535, 20), (-354, 4665, 100), true);
	CreateWall((-150, 5365, 115.875), (-315, 5365, 225.125), false);
	CreateWall((-430, 5365, 115), (-640, 5365, 225.125), false);
	CreateGrid((-422, 4448, 11.875), (-322, 4523, 11.875), 90, false);
	CreateDoor((-343, 5365, 233.125), (-343, 5365.2, 130.125), 2, (90, 90, 0), 2, 2, 30, 80);
	CreateRamp((-140, 5460, 240), (-630, 5440, 225), false);
	CreateRamp((-140, 5380, 240), (-630, 5365, 225), false);//dessus barriere porte
	CreateWall((-132, 5375, 115.125), (-132, 5740, 247.125), false);
	CreateWall((-625, 5375, 115.125), (-625, 5740, 247.125), false);
	CreateRamp((-206, 5680, 115), (-206, 5487, 225), false);
	CreateFlag((-376, 5775.17, 120.125), (-620.909, 3410.52, 184.125), false, false);
	CreateWall((-503, 4953, 115.125), (-613, 4953, 210.125), false);
	CreateMysteryBox((-590, 5553, 125.125), (90, 180, 0), 100);
}

Frost()
{ 
//Frost v2 By speselized
CreateWall((2024.51, 1347.83, 15.56385), (1431.44, 1343.38, 15.134));
CreateWall((2024.51, 1347.83, 70.56385), (1431.44, 1343.38, 70.134)); 
CreateWall((1482.86, 1305.64, 15.9483), (1468.32, 1865.91, 15.78503)); 
CreateWall((1477.86, 1305.64, 70.9483), (1461.32, 1865.91, 70.78503)); 
CreateWall((1448.32, 1865.91, 15.78503), (614.996, 1849.04, 04.125)); 
CreateWall((1448.32, 1865.91, 70.78503), (614.996, 1849.04, 70.125)); 
CreateWall((641.555, 1837.11, 15.22837), (637.647, 2611.15, 1.50267)); 
CreateWall((641.555, 1837.11, 70.22837), (637.647, 2611.15, 70.50267)); 
CreateWall((675.847, 2577.92, 15.18936), (1196.11, 2591.8, 15.73985));
CreateWall((675.847, 2577.92, 70.18936), (1196.11, 2591.8, 70.73985));
CreateWall((1196.11, 2591.8, 15.73985), (1205.95, 2226.89, 15.3811)); 
CreateWall((1196.11, 2591.8, 70.73985), (1205.95, 2226.89, 70.3811)); 
CreateWall((1220.95, 2226.89, 15.3811), (1801.04, 2230.98, 4.249)); 
CreateWall((1220.95, 2226.89, 70.3811), (1801.04, 2230.98, 70.249));
CreateWall((1785.21, 2246.96, 15.48251), (1784.68, 2630.53, 15.16695)); 
CreateWall((1785.21, 2246.96, 70.48251), (1784.68, 2630.53, 70.16695)); 
CreateWall((1800.42, 2615.98, 15.13351), (2274.63, 2608.5, 0.495411)); 
CreateWall((1800.42, 2615.98, 70.13351), (2274.63, 2608.5, 70.495411)); 
CreateWall((2256.63, 2608.5, 15.495411), (2253.87, 1939.79, 15.93455)); 
CreateWall((2256.63, 2608.5, 70.495411), (2253.87, 1939.79, 70.93455)); 
CreateWall((1803.85, 1935.1, 15.92241), (2271.38, 1935.46, 15.068015)); 
CreateWall((1803.85, 1935.1, 70.92241), (2271.38, 1935.46, 70.068015)); 
CreateWall((1775.68, 1920.58, 15.20771), (1775.32, 1594.61, 15.4721)); 
CreateWall((1775.68, 1920.58, 70.20771), (1775.32, 1594.61, 70.4721)); 
CreateWall((1810.01, 1642.66, 15.373876), (2265.14, 1647.29, 15.54136)); 
CreateWall((1810.01, 1642.66, 70.373876), (2265.14, 1647.29, 70.54136)); 
CreateWall((2234.24, 1147.64, 15.85474), (2231.09, 1651.08, 15.2489)); 
CreateWall((2234.24, 1147.64, 70.85474), (2231.09, 1651.08, 70.2489)); 
CreateWall((2040.47, 1334.43, 15.13222), (2042.18, 1105.61, 15.8421)); 
CreateWall((2040.47, 1334.43, 70.13222), (2042.18, 1105.61, 70.8421)); 
CreateMysteryBox((2023.15, 2557.63, 17.8465), (0, 90, 0), 100);
CreateDoor((1632.37, 2051.31, 15.26624), (1634.01, 1868.05, 15.43343), 2, (90, 90, 0), 10, 2, 20, 80); 
CreateFlag((2132.49, 1042.16, -6.4455), (2132.55, 1167.39, -10.994), false, true);
CreateFlag((685.908, 2531.2, 0.125), (1864.82, -131.263, 14.5192), false, false); // Escape flag
}

Mirage()
{ 	//Created by speselized5 //fixed & added things by 0zersub
	level thread removeSkyBarrier();
	CreateWall((823.834, 1140.99, 122.83), (824.033, 1363.71, 124.094), false);
	CreateWall((823.834, 1140.99, 155.83), (824.033, 1363.71, 155.094), false);
	CreateWall((823.834, 1140.99, 190.83), (824.033, 1363.71, 190.094), false);
	CreateDoor((-3.43415, 1932.96, 35.125), (-4.36561, 1832.2, 35.125), 2, (90, 90, 0), 4, 2, 15, 80);//Main Door
	CreateWall((-847.348, 1385.49, 160.199), (-846.551, 1128.68, 160.2245), false);
	CreateWall((-847.348, 1385.49, 115.199), (-846.551, 1128.68, 115.2245), false);
	CreateWall((-741.408, 1157.64, 6.44371), (-591.747, 1155.67, -1.78725), true);
	CreateWall((-568.59, 1160.66, 18.3249), (-793.66, 1160.07, 18.8257), false);
	CreateWall((-568.59, 1154.66, 35.3249), (-793.4, 1160.07, 35.8257), false);
	CreateFlag((-472.499, 1819.5, 266.125), (-665.399, 1241.97, -11.631), false, true);//to upstairs balcony
	CreateWall((350.847, 1359.47, 271.28), (499.652, 1220.4, 271.396), false);
	CreateWall((-109.372, 975.154, 264.78), (165.357, 967.5, 255.809), false);
	CreateFlag((381.062, 1209.75, 266.125), (100.049, 833.463, 266.125), true, true);//Hidden flag upstairs
	CreateFlag((-2345.98, 1153.39, -39.875), (-661.969, 1667.64, -39.875), true, true);//Hidden flag to jail
	CreateMysteryBox((700.71, 1497.57, 101.961), (0, 90, 0), 100);
	}

Hydro()
{
//Created by SneakerStreet
level thread removeSkyBarrier();
CreateFlag((-2701.3, -457.21, 222.125), (-2865.28, -1577.53, 216.125), false, false);
CreateWall((-3181.05, -1262.43, 216.125), (-3052.13, -1107, 335.966));
CreateWall((-3822.95, -446.114, 211.584), (-2600.19, 684.654, 284.57));
CreateWall((-3313.87, -482.114, 264.591), (-3387.29, -442.564, 266.554), true);
CreateWall((-2705.11, 561.652, 301.738), (-2554.92, 713.997, 306.735), true);
CreateTurret((-2760.69, 203.599, 216.125), (0, 270, 0), "auto_gun_turret_mp");
CreateTurret((-3023.35, 228.974, 216.125), (0, 270, 0), "auto_gun_turret_mp");
CreateMysteryBox((-2287.64, 43.9901, 216.125), (0, 0, 0), 200);
CreateMysteryBox((-2287.64, -125.783, 216.125), (0, 0, 0), 200);
CreateFlag((-2557.1, 187.289, 256.125), (-1407.16, -3460.03, 82.125), false, false);
CreateWall((715.112, -2820.03, 100.391), (515.633, -2824.46, 86.6547), true);
CreateFlag((-750.577, -3222.29, 82.125), (1220.17, -3911.64, 82.125), false, false);
CreateDoor((787.686, -3475.36, 82.125), (603.119, -3497.35, 82.125), 2, (90, 90, 0), 4, 2, 30, 80);
CreateFlag((1202.53, -3098.6, 82.126), (-30.2542, -1241.76, 324.125), false, false);
CreateMysteryBox((1248.07, -3334.27, 82.125), (0, 0, 0), 200);
CreateDoor((788.418, -3147.36, 82.125), (607.233, -3170.1, 82.125), 2, (90, 90, 0), 4, 2, 30, 80);
} 

Grind()
{   //Created by 0zersub v1
	level thread removeSkyBarrier();
	CreateDoor((-1200.39, -703.971, 280.125), (-1200.39, -914.468, 280.125), 3, (90, 0, 0), 4, 2, 30, 80);//Front Door near green car
	CreateGrid((-360.919, -615.66, 305.48), (-362.822, -579.831, 305.228), (90, 0, 0), true);//Window block 1 main room
	CreateGrid((-360.919, -622.332, 331.094), (-362.822, -622.332, 331.228), (90, 0, 0), true);//Window block 2 main room 
	CreateFlag((723.166, -672.803, 184.125), (-408.296, -1101.71, 328.125), false, false);//Teleport to Secret Area
	CreateFlag((-1184.36, -1234.36, 330.125), (-2238.24, -590.123, 250.125), false, false);//Secret Area to Spawn Area
	CreateGrid((-523.207, -153.065, 167.273), (-524.207, -153.065, 167.273), (90, 0 , 0), true);//Block stairs door
	CreateDoor((747.641, 21.6409, 272.125), (747.641, 240.567, 272.125), 4, (90, 0, 0), 6, 2, 20, 80);//Skateboard track big Door upstairs
	CreateDoor((884.359, 225.584, 272.125), (884.359, 54.1851, 272.125), 3, (90, 0, 0), 2, 2, 20, 80);//skateboard track small Door upstairs
	CreateDoor((-431.359, -1236.36, 328.125), (-561.247, -1147.76, 328.125), 3, (90, 0, 0), 4, 2, 20, 80);//Secret Area Door
	CreateDoor((22.0251, -547.848, 184.125), (-138.707, -314.092, 280.125), 3, (90, 0, 0), 3, 2, 20, 80);//Behind Door main room
	CreateFlag((-773.923, -648.719, 280.125), (1934.7, -295.722, 207.625), false, false);//Emergency flag main room to outside 
	CreateMysteryBox((-431.141, -938.376, 280.125), (0, 180, 0), 50);
}

Downhill()
{	//created by 0zersub
	level thread removeSkyBarrier();
	CreateDoor((1592.14, -1358.97, 993.617), (1784.75, -1346.95, 993.617), 3, (90, 90, 0), 6, 2, 30, 80);//1st big door
	CreateDoor((1678.99, -1665.15, 993.617), (1678.99, -1237.56, 993.617), 5, (90, 0, 0), 7, 2, 30, 80);//2nd big door
	CreateDoor((2004.95, -865.984, 993.617), (2203.89, -949.491, 993.617), 4, (90, 90, 0), 3, 2, 30, 80);//front door control room 
	CreateDoor((2333.08, 844.748, 1010.54), (2164.86, 852.094, 1010.54), 4, (90, 90, 0), 4, 2, 30, 80);//behind door control room
	CreateDoor((1213.54, 2662.98, 1121.13), (1380.15, 2643.32, 1176.82), 4, (90, 68, 0), 2, 2, 30, 80);//house stairs door
	CreateFlag((138.591, -2711.65, 1043.5), (132.304, -2986.64, 1051.02), false, true);//lets go for ski
	CreateDoor((-161.336, -1163.73, 1011.29), (-117.646, -1053.61, 1011.29), 3, (90, 335, 0), 1, 2, 20, 80);//door mini room
	CreateDoor((-10.9226, -1488.14, 1019.73), (93.2197, -1548.69, 1019.73), 2, (90, 68, 0), 1, 2, 25, 80);//door near blue track
	CreateFlag((-151.149, 1028.47, 1115.13), (235.631, -1395.78, 1001.13), true, true);//hide area
	CreateFlag((1909.52, -1108.83, 980.125), (298.678, 752.412, 1064.13), false, false);//Emengercy flag big doors
	CreateFlag((1925.28, 771.042, 980.125), (298.678, 752.412, 1064.13), false, false);//Emengercy flag behind-middle door
	CreateDoor((2164.9, 536.592, 1010.54), (1990.36, 535.886, 1010.54), 3, (90, 90, 0), 4, 2, 30, 80);//middle door
	CreateMysteryBox((222.39, -1082.21, 1001.13), (0, 68, 0), 150);//mysterybox near turret
	CreateMysteryBox((2254.86, -1230.34, 980.125), (0, 0, 0), 150);//mysterybox near 2 big doors
	CreateTurret((440.635, -1155.56, 1001.13), (0, 90, 0), "auto_gun_turret_mp");
}

Encore()
{ 
//Created by xTiibo Modz
level thread removeSkyBarrier();
CreateFlag((-1504, 254, -62), (-5614, 3038, 14), false, false);
CreateWall((-5731, 3039, 7), (-5731, 2949, 80), true);
CreateWall((-5687, 2944, 6), (-5509, 3010, 80), true);
CreateWall((-5710, 3095, 6), (-5519, 3095, 80), true);
CreateDoor((-4610, 3922, 45), (-4558, 3910, 45), 2, (90, 80, 0), 3, 2, 25, 80);
CreateDoor((-4088, 3360, 80), (-4082, 3290, 80), 2, (90, -10, 0), 3, 2, 25, 80);
CreateWall((-4658, 3493, 21), (-4575, 3435, 140), false);
CreateMysteryBox((-4875, 4912, 3), (0, 135, 0), 110);
CreateDoor((-3326, 4740, -26), (-3326, 4678, -26), 2, (90, 10, 0), 3, 2, 30, 80);
CreateRamp((-2814, 4889, -29), (-2659, 4881, 30), false);
CreateWall((-2850, 4985, -10), (-2660, 4990, -9), true);
CreateWall((-2850, 4835, -10), (-2660, 4835, -9), true);
CreateWall((-2890, 2077, 39), (-2050, 2075, 39), false);
CreateWall((-2890, 2077, 95), (-2050, 2075, 96), true);
CreateRamp((-2262, 5422, 20), (-2262, 5864, 180), false);
///CreateDoor((-2091, 5901, 192), (-2254, 5399, 32), 2, (90, 90, 0), 5, 2, 25, 80);
CreateWall((-2329, 5413, 30), (-2359, 5413, 120), false);
CreateWall((-2200, 5413, 30), (-2180, 5413, 120), false);
CreateWall((-2030, 6470, 192), (-2217, 6470, 280), false);
CreateMysteryBox((-1910, 6715, 192), (0, 90, 0), 110);
CreateFlag((-1400, 6655, 192), (330, 2370, 24), false, false);
CreateWall((-2503, 6470, 192), (-2323, 6470, 280), false);
CreateDoor((-2394, 6673, 192), (-2279, 6464, 192), 2, (90, 90, 0), 4, 2, 25, 80);
CreateWall((-1971, 6497, 190), (-1971, 6357, 263), true);
//CreateFlag((2325, 2150, 0.125), (-37910, 12551, 207), false, false); //Big out of map

CreateFlag((306, 1765, -63), (726, 1399, -63), false, false);
CreateWall((827, 1531, -32), (962, 1166, -31), false);
CreateRamp((1295, 955, -63), (1295, 771, 20), false);
CreateRamp((1312, 740, 24), (1147, 740, 24), false);
CreateRamp((1144, 740, 30), (940, 740, 130), false);
CreateWall((618, 595, 160), (1135, 590, 201), false);
CreateDoor((803, 773, 149), (1162, 740, 39), 2, (90, 0, 0), 2, 2, 30, 80);
CreateFlag((1120, 636, 140), (-1440, 3029, 32), false, false);
CreateMysteryBox((651, 629, 149), (0, 90, 0), 110);
CreateDoor((-1617, 3222, 32), (-1388, 3080, 32), 2, (90, 55, 0), 3, 2, 45, 80);
CreateWall((-1478, 3088, 32), (-1478, 3089, 70), false);
CreateWall((-1371, 2985, 32), (-1371, 2986, 70), true);
}

Vertigo()
{ 	//Created by hi2108
	level thread removeSkyBarrier();
	CreateFlag((-1502.74, -0.586645, 8.625), (-1792.05, 0.265627, 104.125), false, false); //1.Flagge bei flugzeug
	CreateFlag((-2770.41, -1.43311, 104.125), (4204.24, 3698.54, -319.875), false, false); //2.flagge zur platform
	CreateFlag((4204.21, 2704.96, -317.145), (4194.28, 572.514, 228.125), false, false); //3.flagge zur kleinen fläche
	CreateFlag((4205.67, 183.574, 228.125), (4204.46, -1823.89, -316.997), false, false); //4.flagge zur 2.platform
	CreateFlag((4202.64, -2864.95, -317.512), (804.234, -460.628, -31.875), false, false); //aus platform in raum
	CreateFlag((225.466, 6.05344, 284.125), (3697.63, -2344.5, -319.875), false, true); //auf dach
	CreateFlag((-664.182, -0.729715, -18.3445), (-231.1, 0.696467, 152.125), false, false); //in raum in mitte
	CreateDoor((-242.787, -200.118, 182.264), (-342.909, -195.587, 182.125), 3, (90, 90, 0), 2, 2, 15, 80); // tür mitte links
	CreateDoor((-197.706, 201.627, 182.125), (-344.072, 194.001, 182.125), 3, (90, 90, 0), 2, 2, 15, 140); // tür mitte rechts
	CreateMysteryBox((-416.359, 323.22, 152.125), (0, 180, 0), 100); // rechts
	CreateMysteryBox((-416.359, -321.243, 152.125), (0, 180, 0), 100); //links
	CreateFlag((415.768, -171.803, 152.125), (322.98, -28.4677, -31.8557), false, false); // rechts flagge ausgang
	CreateFlag((426.865, 184.528, 152.125), (322.98, -28.4677, -31.8557), false, false); // linke flagge ausgang
	CreateDoor((4342.08, 378.503, 270.125), (4193.78, 372.046, 270.125), 3, (90, 90, 0), 9, 2, 15, 80); //3. kleine fläche
	CreateDoor((-958.072, -2143.1, -130.875), (-958.072, -2100, -130.875), 3, (90, 0, 0), 1, 2, 15, 80); // blocking door
	CreateDoor((-760, -2443.06, -130.875), (-700.83, -2443.06, -130.875), 3, (90, 90, 0), 1, 2, 15, 80); // kleiner raum
	CreateMysteryBox((4203.84, -2599.07, -319.875), (0, 90, 0), 100); // bei wand 3.kleine flache
	CreateMysteryBox((4077.55, 240.466, 228.125), (0, 180, 0), 100); // 2. platform
	CreateFlag((-815.507, -223.613, 8.125), (795.162, 241.987, 5.26984), false, false); //ausgang in 2.kleinen raum
	CreateFlag((-1003.14, 152.794, 8.125), (-1002.11, -152.863, 8.125), false, true); // switch between 2 rooms
	CreateFlag((-802.465, -0.856345, 144.125), (-1055.97, 146.293, 8.125), false, true); // nach oben 
	CreateFlag((45, 2690, -19.875), (-842.72, 198.753, 8.125), false, false); // relaxing place
	CreateGrid((3966.74, 2436.46, -439.42), (4580.25, 1928.6, -439.386), 90); // secret floor
	CreateRamp((4199.22, 2005, -350), (4199.22, 2137.64, -423.545)); // secret ramp
	CreateGrid((4283.85, -1518.63, -439.386), (4342.1, -1217.79, -439.386), 90); // secret floor other side 1.
	CreateGrid((4342.1, -1217.79, -439.386), (4027.28, -1087.45, -439.386), 90); // secret floor other side 2.
	CreateRamp((4261.31, -1126.72, -423.545), (3900.44, -1181.58, -329.42)); // secret ramp other side 1.
	CreateRamp((3900, -1181.58, -329.42), (3900, -1096.76, -308.852)); // secret ramp other side 2.
	CreateRamp((3900, -1096.76, -308.852), (4200, -1065, -99.499)); // secret ramp other side 3
	CreateGrid((4200, -1065, -99.499), (4270.84, -1404.71, -105.50), 90); // secret floor other side 4. lay down
 }

Magma()
{ 
//Created By xTiibo Modz V1.2
level thread removeSkyBarrier();
CreateFlag((683, -927, -521), (-867.278, 308.809, -495.875), false, false);
Createwall((-2724.756, -1387.477, -559.9594), (-2724, -1215, -558.7044), false); //1
Createwall((-2724.756, -1387.477, -509.9594), (-2724, -1215, -508.7044), false ); //2
Createwall((-2724.756, -1387.477, -459.9594), (-2724, -1215, -458.7044), false ); //3
Createwall((-2724.756, -1387.477, -559.9594), (-3272, -1387, -558.7044), false); //1
Createwall((-2724.756, -1387.477, -509.9594), (-3272, -1387, -508.7044), false); //2
Createwall((-2724.756, -1387.477, -459.9594), (-3272, -1387, -458.7044), false); //3
CreateDoor((-2766, -1300, -559.54), (-2750.36, -1142.886, -515.54), 2, (90, 0, 0), 4, 2, 30, 80);
CreateRamp((-3275.756, -1202.477, -495.9594), (-3275, -1450, -450.7044), false );
CreateFlag((-2275, -1467, -559.875), (-2520, -1459, -559.875), false, true);
CreateElevator((-2250.048, 715, -489.6955), (-2250.048, 715, -355.6955), 2, 1);
CreateElevator((-2292, 96, -495.6955), (-2292, 96, -330), 2, 1);
CreateRamp((-3376.756, -1480.477, -450.9594), (-2970, -1480, -450.7044), false );
CreateRamp((-3376.756, -1550.477, -450.9594), (-2970, -1550, -450.7044), false );
CreateZipline((-1020, 539.994, -451.125), (-1709.11, 756.517, -343.876), 1, true);
CreateDoor((-2531, 47, -308.54), (-2290, 242.886, -495.54), 2, (90, 90, 0), 3, 2, 30, 80);
CreateFlag((-3092, -1630, -450), (-867.278, 308.809, -495.875), false, false);
Createwall((-3089, -1585.477, -460.9594), (-3089, -1662, -460.7044), false);
CreateDoor((-3400, -1470.886, -559.54), (-3217, -1470.886, -559.54), 2, (90, 0, 0), 3, 2, 30, 80);
CreateFlag((-191, 328, -495), (-1727, 744.532, -343.875), false, false);
CreateMysteryBox((-2509, -424.88, -300.125), (0, 90, 0), 110);
CreateMysteryBox((-3456, -1154, -490), (0, 0, 0), 110);
Createwall((-3217.756, -1626.477, -559), (-3217, -1520, -558.7044), false);
Createwall((-3217.756, -1626.477, -510), (-3217, -1520, -510.7044), false);
CreateFlag((-2292.64, -448, -316), (149.72, -1910, -303.875), false, false);
Createwall((111, -1758.477, -475), (111, -1688, -475.7044), false);
CreateFlag((-2307, -490, -495), (-2524, -175, -219.875), true, true);
Createwall((-2968, -1424, -459), (-2968, -1423, -459), false );

//CreateRamp((-3411, -1526, -465), (-3593, -1526, -400), false ); // Beta functions
//CreateFlag((-3545, -1526, -395), (-3570, -1492, -329), false, true); // Beta functions
}

Studio() //v2 Made by CodJumper
{
	level thread removeSkyBarrier();
	CreateFlag((880.269, -128.696, -21.875), (731.784, -252.809, -63.875), false, true); // 1st bunker enter flag
	CreateFlag((633.707, -1560.75, 96.125), (2066.35, 2231.37, -39.875), true, false); // 1st bunker escape flag
	CreateFlag((2641.75, 1521.29, 76), (2564.91, 1601.8, -43.875), false, true); // 2nd bunker 1st flag
	CreateFlag((2354.02, 1364.27, -43.875), (285.885, 755.791, 36.124), false, false); // 2nd bunker escape flag
	CreateFlag((-133.674, 975.225, 96.125), (-650.456, -427.257, -127.875), false, true); // random flag 1
	CreateZipline((518.547, -1195.03, 100.125), (401.057, 957.14, 194.125), 4, false); //1st room zip 1way
	Createwall((1205.34, -541.486, -30.3254), (1394.89, -1142.58, 10.3254), true); // Blocking wall 1
	Createwall((540.756, -875.477, -50.9594), (508.76, -1752.64, 75.7044), true ); // Blocking wall 2
	Createwall((691.247, -1603.46, 94.6437), (490.345, -1603.46, 135.6437), true); // Blocking wall 3
	Createwall((503.674, -840.285, -40.9588), (717.267, -840.285, -41.9588)); // 1st bunker 1st bottom wall
	Createwall((503.674, -840.285, 20.9588), (717.267, -840.285, 21.9588)); // 1st bunker  1st top wall
	Createwall((832.238, -541.245, -40.9588), (832.238, -850.285, -41.9588)); // 1st bunker 2nd bottom wall
	Createwall((832.238, -541.245, 20.9588), (832.238, -850.285, 21.9588)); // 1st bunker 2nd top walll
	Createwall((914.393, 1233.4, 118.246), (761.707, 981.197, 191.152), true); // 1st room ladder blocking wall
	Createwall((1384.25, 1547.21, 115.125), (1162.49, 1675.12, 116.125), true); // 1st room 5th side wall
	Createwall((2229.77, 1747.64, -43.875), (2229.77, 1264.36, 66), true); // 2nd bunker bottom wall
	Createwall((2201.71, 1264.36, 85), (2201.71, 1441.31, 86)); // 2nd bunker right bottom wall
	Createwall((2201.71, 1747.64, 85), (2201.71, 1553.82, 86)); // 2nd bunker left bottom wall
	Createwall((2201.71, 1264.36, 155), (2201.71, 1441.31, 156)); // 2nd bunker right top wall
	Createwall((2201.71, 1747.64, 155), (2201.71, 1553.82, 156)); // 2nd bunker left top wall
	CreateRamp((1666.41, 1375.59, 73.6968), (1996.69, 1464.23, 56)); // 2nd bunker 1st ramp
	CreateRamp((2528.6, 1669.57, 76), (2350.66, 1669.57, 190.433)); // 2nd bunker 2nd ramp
	CreateRamp((1272.45, 1402.86, 94.125), (1409.94, 1317.8, 75.6937)); // 1st room 2nd ramp
	CreateGrid((2007.64, 1264.36, 60.125), (2704.56, 1725.21, 60.125), 90, true);  // 2nd bunker 1st invis floor
	CreateGrid((2201.71, 1747.64, 200), (2320.71, 1264.36, 201), 90);  // 2nd bunker 2nd top floor
	CreateGrid((2150.71, 1747.64, 65), (2280.71, 1264.36, 65), 90);  // 2nd bunker 3rd bottom floor
	CreateDoor((610.297, -840.285, -35.9588), (761.854, -840.285, -35.285), 3, (90, 90, 0), 3, 2, 35, 80); // 1st bunker door
	CreateDoor((2201.71, 1497.88, 16), (2201.71, 1497.88, 92), 3, (90, 0, 0), 4, 2, 25, 80); // 2nd bunker door
	CreateDoor((1124.31, 1558.99, 98.125), (1076.81, 1472.99, 98.125), 3, (90, 150, 0), 2, 2, 15, 80); // 1st room door
	CreateElevator((955.048, -1200.14, -42.6955), (955.048, -1200.14, 96.6955), 3, 1); //1st bunker ele
	CreateMysteryBox((536.139, -1536.88, 96.125), (0, 120, 0), 150); // 1st bunker box
 }

Rush()
{		//Created by 0zersub
		level thread removeSkyBarrier();
		CreateDoor((-1174.86, 273.359, 19.2346), (-998.651, 260.509, 19.2346), 3, (90, 0, 90), 4, 2, 30, 80);//down door 1
		CreateDoor((527.634, 568.445, 163.135), (707.43, 551.102, 163.135), 3, (90, 0, 90), 3, 2, 30, 80);//up door 1
		CreateGrid((637.391, 624.359, 168.125), (637.381, 589.206, 168.125), (90, 0, 0), true);//up door 1 block 
		CreateGrid((-262.202, 187.641, 0.125), (-262.202, 218.359, 0.125), (90, 0, 0), true);//block door1
		CreateGrid((-262.202, 187.641, 19.2346), (-262.202, 218.359, 19.2346), (90, 0, 0), true);//block door2
		CreateGrid((-262.202, 187.641, 18.1175), (-262.202, 218.359, 18.1175), (90, 0, 0), true);//block door 3
		CreateGrid((-262.202, 187.641, 56.2747), (-262.202, 218.359, 56.2747), (90, 0, 0), true);//block door 4
		CreateDoor((401.641, 182.282, 163.135), (401.641, 272.492, 163.135), 3, (90, 0, 0), 2, 2, 10, 80);//up near turret door
		CreateDoor((821.385, -1203.39, 163.135), (639.706, -1192.77, 163.135), 3, (90, 0, 90), 4, 2, 30, 80);//up door 2 start
		CreateDoor((-650.641, -1478.15, 19.2346), (-650.641, -1636.72, 19.2346), 4, (90, 0, 0), 3, 2, 25, 80);//down door 2
		CreateFlag((422.376, -1081.86, 136.125), (724.956, -619.762, 264.125), false, false);//teleport to roof
		CreateFlag((730.114, 8.15531, 136.125), (987.052, 223.361, 136.125), false, false);//teleport from roof
		CreateFlag((-773.94, -688.024, 0.125), (658.285, -697.432, 170.125), false, true);//base1 to base2
		CreateFlag((-1460.52, -1446.08, 0.125), (-1610.49, -1448.21, 0.125), true, true);//secret gun room
		CreateTurret((573.692, 168.938, 136.125), (0, 270, 0), "auto_gun_turret_mp");//turret base 2
		CreateMysteryBox((944.359, -1028.16, 136.125), (0, 180, 0), 50);//mystery box base 2
		CreateMysteryBox((-446.606, 286.359, 0.125), (0, 90, 0), 50);//mystery box base 1
}

Cove()
{ 
        //Created By xTiibo Modz
        level thread removeSkyBarrier();
        ents = getEntArray();
        for ( index = 0; index < ents.size; index++ )
        {
        if(isSubStr(ents[index].classname, "trigger_hurt"))
        ents[index].origin = (0, 0, 9999999);
        }
        CreateDoor((1093, 196, 197.125), (990, 83, 233), 3, (90, -15, 0), 2, 2, 30, 80);
        Createwall((330, 157, 39), (266, 182, 120), true);
        CreateDoor((669, 219, 151.125), (555, 290, 96), 2, (90, 75, 0), 3, 2, 30, 80);
        Createwall((253, 442, 129), (120, 476, 189), true);
        CreateRamp((-2752, 993, -59.375), (-3080, 1037, 20),false);
        CreateMysteryBox((273, 389, 126), (90, 75, 0), 110);
        CreateFlag((310, 206, 47), (-1524, 1228.762, 59), false, false);
        CreateFlag((-3028, 1034, 23), (-3627, 865, 86), false, false);
        Createwall((-3647, 860, 82), (-3660, 1125, 83),false);
        Createwall((-3685, 860, 86), (-3700, 1125, 260),false);
        CreateRamp((-3633, 1123, 86), (-4850, 1123, 83),false);
        CreateRamp((-3920, 1067, 81), (-3920, 886, 80),false);
        CreateRamp((-3633, 1123, 86), (-3448, 1123, -30),false);
        CreateRamp((-3880, 920, 92), (-3712, 928, 130),false);
        CreateTurret((-3736, 925.938, 220), (0, -15, 0), "auto_gun_turret_mp");
        CreateDoor((-3847, 922, 116), (-3847, 1125, 100), 2, (90, 0, 0), 2, 2, 25, 80);
        Createwall((-3712, 1068, 105), (-3873, 1068, 176),false);
        Createwall((-3875, 1055, 105), (-3875, 955, 176),false);
        Createwall((-4820, 848, 30), (-4820, 1036, 205),false);
        Createwall((-4820, 1260, 30), (-4820, 1406, 205),false);
        CreateRamp((-5025, 1123, 30), (-4850, 1123, 83),false);
        CreateFlag((-4945, 1338, 45), (1529, 16, 279), false, false);
        Createwall((-4820, 1080, 30), (-4820, 980, 86),false);
        Createwall((-4820, 1155, 30), (-4820, 1255, 86),false);
        CreateDoor((-5036, 1123, 40), (-4850, 1120, 103), 2, (90, 0, 0), 6, 2, 25, 80);
        CreateRamp((-4880, 828, 30.375), (-4880, 1396, 30),false);
        CreateRamp((-4961, 828, 30.375), (-4961, 1396, 30),false);
        CreateRamp((-5040, 828, 30.375), (-5040, 1396, 30),false);
        CreateRamp((-5120, 828, 30.375), (-5120, 1396, 30),false);
        Createwall((-4844, 835, 55), (-5190, 835, 56),false);
        Createwall((-4844, 835, 115), (-5190, 835, 116),false);
        Createwall((-4844, 835, 171), (-5190, 835, 172),false);
        Createwall((-4844, 1366, 55), (-5190, 1365, 56),false);
        Createwall((-4844, 1366, 115), (-5190, 1365, 116),false);
        Createwall((-4844, 1366, 171), (-5190, 1365, 172),false);
        CreateMysteryBox((-4910, 910, 55), (90, 90, 0), 110);
        Createwall((-5169, 872, 44), (-5169, 1375, 152),true);
 }

Detour()
{ //Created by Unknown Edited by SneakerStreet
    Createwall((1692,-65,152), (1692,-149,260),false);//front wall
	Createwall((1692,72,152), (1692,166,260),false);//front wall
	Createwall((820,163,150), (820,0,250),false);//spawm wall
	Createwall((1119,-152,158), (1119,-50,230),false);//spawm wall 2
	CreateRamp((1500.5,-110,327.375), (1500.5,105,322),false);//infront of bunker 2
	CreateRamp((1701,-111,275.875), (1520,-111,310),false);//infront of bunker 1
	CreateRamp((2050,110,152.125), (2050,-104.673,270),false);//ramp to grid
	CreateGrid((1980,-108,260), (1690,148,260), 90,false);//grid roof of bunker
	CreateFlag((781,15,8.125), (700,98,152.125),false,false);//entry 
	CreateFlag((2060,-109,152), (1863.73,552.918,19),false,false);//exit
	CreateDoor((1695,-86,152.125), (1695,2,152.125), 2, (90, 90, 90), 2, 2, 30, 80);//bunker
	CreateMysteryBox((1884,150,285), (180, 180, 0), 200);//on grid
	CreateWall((-624.083, -841.905, 14.7755), (-989.289, -841.905, 107.793), false);
	CreateWall((-2051.84, -871.515, -119.087), (-1808.13, -871.515, -20.3964), false);
    CreateDoor((-108.401, -886.641, -102.875), (102.62, -899.341, -127.875), 2, (90, 0, 90), 4, 2, 30, 80);
    CreateWall((568.79, -1103.18, -88.6716), (635.567, -1175.89, -41.892), false);
    CreateWall((1120.36, -594.121, -131.81), (820.37, -594.121, -56.9505), false);
    CreateWall((1469.38, -816.856, -126.144), (1469.38, -940.537, -44.528), false);
    CreateMysteryBox((-437.585, -1197.64, 1.125), (0, 90, 0), 200);
    CreateFlag((-1947.63, -938.975, -122.375), (2043.41, -132.094, -127.875), false, false);
    CreateFlag((1834.3, -130.745, -127.875), (1745.27, -127.745, -127.875), false, false);
    CreateFlag((1515.78, -130.745, -127.875), (1413.62, -130.745, -127.875), false, false);
    CreateFlag((1209.65, -130.745, -127.875), (776.064, 102.544, 152.125), false, false);
    }

Uplink()
{ 
//Created by xTiibo Modz V1.1
level thread removeSkyBarrier();
CreateFlag((6662, -8110, 169.125), (2147, -743, 456.122),true,true); //Hidden flag
CreateFlag((2943.06, 2020.14, 288.125), (2943.12, 2128.27, 268.122),false,false);
CreateFlag((3312.29, 673.403, 320.125), (3305, 625.27, 320.125),false,true);
CreateRamp((2948.12, 2080.27, 251.122), (2948.12, 2613.3, 147.525),true);
CreateRamp((2948.12, 2613.7, 180.601), (2948.12, 2650, 170.525),false);
CreateMysteryBox((3473.69, 401, 320.125), (180, 180, 0), 100);
CreateZipline((3342.34, 331.79, 320.125), (2835.25, 371.082, 214.125), 2,true);
CreateRamp((3030, 3469.96, 160.446), (2962.12, 3337, 200.334),true);
CreateRamp((2962.12, 3337, 200.334), (2827.08, 3026.53, 200.426),false);
CreateFlag((6496, -8984, 168.139), (2479.04, 320.171, 214),false,false);
CreateFlag((2456.91, -884, 320.125), (6419.25, -6378.19, 173.635),false,false);
CreateWall((6113.6, -6312.37, 174.112), (6574.15, -6112.68, 260.381),false);
CreateWall((2950.15, 3475.88, 185.112), (2757.38, 3057, 280.112),true); //droite
CreateWall((3068.64, 3395, 185.739), (2880, 2990, 280.112),true); //gauche
CreateWall((2773.64, 3031, 179.739), (2857.64, 2984, 280.739),false);
CreateFlag((3145, 3709.7, 195), (2794.12, -605, 454.122),false,false);
CreateWall((2836, -655, 487.122), (2685, -655, 520.525),true);
CreateFlag((2455, 632, 214), (2794.12, -605, 454.122),false,false);
CreateMysteryBox((6658.48, -9002.75, 168.125), (180, 180, 0), 125);
CreateDoor((6290, -8039, 170), (6494.98, -8055, 170.433), 2, (90, 90, 0), 2, 2, 25, 80);
CreateWall((6188.83, -8061, 170.739), (6485.64, -8050, 280.739),false);
CreateWall((6580, -8060, 170.739), (6750, -8075, 280.739),false);
CreateDoor((3088, 3275, 179.433), (2969, 3345, 215), 3, (90, 65, 0), 2, 2, 25, 80);
CreateMysteryBox((2824.69, 3042, 216.125), (90, 0, 0), 125);
}







































































