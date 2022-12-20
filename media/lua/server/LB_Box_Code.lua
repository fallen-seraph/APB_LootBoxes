function Recipe.GetItemTypes.LootBox(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("LootBox"))
end

function Recipe.GetItemTypes.ChristmasLootBox(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("ChristmasLootBox"))
end

function Recipe.OnCreate.LB_OpenBox(items, result, player)
    local lootBox = items:get(0)
    local modData = lootBox:getModData()
    local requestedItems = {}

    if (modData.LootBoxID == "knight_box") then
        requestedItems = knightBox();
    elseif (modData.LootBoxID == "pistol_box") then
        requestedItems = pistolBox();
    elseif (modData.LootBoxID == "rifle_box") then
        requestedItems = rifleBox();
    elseif (modData.LootBoxID == "shotgun_box") then 
        requestedItems = shotgunBox();   
    elseif (modData.LootBoxID == "smg_box") then
        requestedItems = smgBox();
    elseif (modData.LootBoxID == "pistol_ammo_box") then
        requestedItems = pistolAmmo();
    elseif (modData.LootBoxID == "rifle_ammo_box") then
        requestedItems = rifleAmmo();
    elseif (modData.LootBoxID == "shotgun_ammo_box") then
        requestedItems = shotgunAmmo();
    elseif (modData.LootBoxID == "halloween_box") then
        requestedItems = halloween();
    elseif (modData.LootBoxID == "christmas_box") then
        requestedItems = christmas();
    elseif (modData.LootBoxID == "book_box") then
        requestedItems = books();
    end
    
    if ( requestedItems ) then
        for k,v in pairs(requestedItems) do
            print('[APB]: Spawning: '..v..' of '..k..' for '..player:getUsername())
            player:getInventory():AddItems(k, v)
        end
    end
end

--function that spawns the knight set from Pow Low Loot
function knightBox()
    local boxItems = {}
    local knightSwords = { "Conan_Sword","CH_WarSword","ScrapSword","RogueSword2","TKSword" }

    boxItems.Hat_Tknight = 1
    boxItems.Vest_Tknight = 1
    boxItems.KnightArms = 1
    boxItems.Gloves_TKnight = 1
    boxItems.KnightGreaves = 1
    boxItems.Shoes_TKnight = 1
    boxItems.KnightWaist = 1
    boxItems.ChainMail = 1

    boxItems[knightSwords[ZombRand(1,#knightSwords+1)]] = 1

    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end
        
    return boxItems
end

--function that spawns 1-3 of any caliber pistol
function pistolBox()
    local boxItems = {}
    --array of known Brita's Pistols
    local availableItems = { "M9","CZ75","FN_57","Colt1911","AMT1911_Long","M9A3","CZ97B","FN_57_MK2","Colt_Kimber","AMT1911","Judge513_Long_45LC","B93R","PPK","CP33","Colt_Commander","Colt_Service45","Colt_Service38","Judge513_45LC","P226","Buckmark_Carbine","Buckmark","Buckmark_Long","Bersa85F","G21","G18","G34","G42","LCP380","BodyGuard380","M5906","M5238","M4506","ZIP22","Colt1903","Makarov","Makarov380","PB","Automag","APS","SW_327_357","M1911_Carbine","GP100_2_357","GP100_4_357","GP100_6_357","Rhino_60DS_357","Colt_Navy_1851","Taurus856","K6S_357","P220","XD4","XD9","M1936","M29_44_Carbine","HK4_380","HK4 22","MP9","MP45","DEagle","Luger","Luger_WW1","Luger_Carbine","VP70","VP70_Stock","HK_MK23","HK_USP","HK_USP_Match","DEagle_Long" }
    --random number to determine how many guns should be received.
    local random = ZombRand(0,100)

    if ( random < 50 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    elseif ( random > 90 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    else
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    end

    for k,v in pairs(boxItems) do
        if k == "FN_57" or k == "FN_57_MK2" then
            boxItems["57clip"] = 2
        end
    end

    if (random < 5 ) then
        boxItems.Cleaning = 1
    elseif (random > 95) then
        boxItems.WD = 1
    end

    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    return boxItems
end

function rifleBox()
    local boxItems = {}
    local availableItems = { "SV_98","K14","SVD","SVDK","Mosin","MosinObrez_Pistol","Winchester1866","Win_1895","Marlin_1894_357","M1Carbine","M2Carbine","Commando","Ruger_No1_3006","M1903","Type38","Type99","M1","Savage12","MAS36","MAS44","MAS49","Marlin_M70","Cricket_22","Ruger_1022","Thompson_Center_3006","M40","M40A3","M46_Mauser","L96","WA2000","OTS_03_SVU","PSG1","MSG90","FAMAS","FAMAS_Felin","QBZ 95","F2000","Tavor","L85","L86","L22","ASVAL","VSS","K1DEV","K2_203","K2_C1","XM8Compact_Pistol","XM8","XM8LMG","FN_FNC","Type20","Type89","MK47","AK5C","MK18","H416","SCARL","G28","Ots14_1A_02","Ots14_4A","BAR","BAR_Monitor","G3","G33","LVOA_C","M14EBR","M14","SKS","ColtM16","M16A1","CAR15_Survival","ADAR","M4A1","Bush_XM15_Custom","MCX_Virtus","MCX_VirtusPatrol","MCX_Socom","G36","G36C","MINI14","AUG","44782","AR18","G11K3","M240","M60","G21LMG","MG42","M249","K3LMG","RPD" }
    
    local random = ZombRand(0,100)

    if ( random > 85 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    else
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    end

    if (random < 5 ) then
        boxItems.Cleaning = 1
    elseif (random > 95) then
        boxItems.WD = 1
    end

    return boxItems
end

function shotgunBox()
    local boxItems = {}
    local availableItems = { "R11_87","M1897","SPAS12_Fixed","SPAS12_Fold","SPAS_15","M870_Wingmaster","M870_Police","M870_MCS","M870_CQB","M870 Breaching Pistol","M870 Express","VIPER_G2","AUTO_5","10855_Silver","Shorty_Pistol","A400","Ithaca_M37","MP133","MP133S_Pistol","TOZ194_Pistol","KS23","KS23_S_Pistol","Triple_Crown","Coachgun","M1887","DT11","TXS_804_410g","Terminator","TOZ106","M1014","M1014_Wick","Moss500_20","ROYAL_SXS","Colt1855","UTS15","SPAS_15","Saiga12_Tromix","Saiga12","Saiga12_Long","CAWS","KSG","KSG25","AA12","DAO12","M1208","M1212","M1216","SIX12","SIX12SD" }

    local random = ZombRand(0,100)

    if ( random > 85 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    else
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    end

    for k,v in pairs(boxItems) do
        if ( k == "M1208" ) then
            boxItems.SRM1208_Cylinder = 1
        elseif ( k == "M1212" ) then
            boxItems.SRM1212_Cylinder = 1
        elseif ( k == "M1216" ) then
            boxItems.SRM1216_Cylinder = 1
        elseif ( k == "SIX12" ) then
            boxItems.SIX12_Cylinder = 1
        elseif ( k == "SIX12SD" ) then
            boxItems.SIX12_Cylinder = 1
        end
    end

    if (random < 5 ) then
        boxItems.Cleaning = 1
    elseif (random > 95) then
        boxItems.WD = 1
    end

    if ( ZombRand(0,100000) == 1 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end
    
    return boxItems
end

function smgBox()
    local boxItems = {}
    local availableItems = { "SUB2000","KG9","Calico_M900_Fold","Calico_M950_Pistol","M1Carbine","M2Carbine","M635","M635S","M635SD","JW3_TTI_MPX","KRISS9_Stock","KRISS9_MLOK_Stock","BT9_Fold","UMP9_Stock","MP5_Fixed","MP5_Stock","MP5SD6_Fixed","MP5SD6_Stock","44782","MP7","Jatimatic","Sten","Sten_MK2","Sten_MK2SD","STAR_Z45_Stock","STAR_Z45_Fixed","VSS","ASVAL","K7_Stock","EVO_Fold","UZI","UZI_Wood","UZI_Micro","MAC10_Fold","KRISS_Stock","Thompson","Thompson_1928","M2Hyde","Model55_Fold","Model50","UMP45_Stock","Vz61_Fixed","Vz61_Fold","FN_P90","FN_PS90","MPA57DMG","MPA57DMG_Carbine","AKS74U" }

    local random = ZombRand(0,100)

    if ( random > 85 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    else
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    end

    if (random < 5 ) then
        boxItems.Cleaning = 1
    elseif (random > 95) then
        boxItems.WD = 1
    end

    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    return boxItems
end

function rifleAmmo()
    local boxItems = {}
    local availableItems = { "556Box","223Box","308Box","3006Box","762x39Box","545x39Box","762x54rBox","BB177Box" }
    local brass = { "Brass545x39","Brass556","Brass762x39","Brass762x51","Brass762x54r","Brass223","Brass308","Brass3006" }

    local random = ZombRand(0,100)
    --45% chance of 1 Box min:2 Max:4
    if ( random <= 45 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(2,5)
    --10% chance of 3 boxes min:3 Max:8
    elseif ( random >= 90 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(1,5)
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(1,4)
    else
    --45% chance of 2 boxes
    --total min:3 Max:4
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(2,5)
    end

    -- .5% chance
    if ( ZombRand(0,200) == 100 ) then
        local goodPrize = { "PrimerLG_Pack","GunPowder" }

        if ( goodPrize[zombRand(1,3)] == "PrimerLG_Pack") then
            boxItems.PrimerLG_Pack = 1
            boxItems[brass[ZombRand(1,#brass+1)]] = 40
        else
            boxItems["Base.GunPowder"] = 2
            boxItems[brass[ZombRand(1,#brass+1)]] = 40
        end
    end

    -- .01% chance
    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    return boxItems
end

function pistolAmmo()
    local boxItems = {}
    local availableItems = { "Bullets9mmBox","Bullets45Box","Bullets45LCBox","Bullets44Box","Bullets357Box","Bullets380Box","Bullets57Box","BB177Box" }
    local brass = { "Brass9","Brass45","Brass45LC","Brass357","Brass380","Brass57" }

    local random = ZombRand(0,100)
 
    if ( random < 85 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(1,3)
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    else
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(1,4)
    end

    if ( ZombRand(0,200) == 100 ) then
        local goodPrize = { "PrimerSM_Pack","GunPowder" }

        if ( goodPrize[zombRand(1,3)] == "PrimerSM_Pack") then
            boxItems.PrimerSM_Pack = 1
            boxItems[brass[ZombRand(1,#brass+1)]] = 40
        else
            boxItems["Base.GunPowder"] = 2
            boxItems[brass[ZombRand(1,#brass+1)]] = 40
        end
    end

    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    return boxItems
end

function shotgunAmmo()
    local boxItems = {}
    local availableItems = { "410gShotgunShellsBox","20gShotgunShellsBox","ShotgunShellsBox","10gShotgunShellsBox","4gShotgunShellsBox" }
    local craftingItems = { "PrimerLG_Pack","GunPowder","Brass9","Brass45","Brass45LC","Brass357","Brass380","Brass57" }
    
    local random = ZombRand(0,100)

    if ( random < 45 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(2,4)
    elseif ( random > 90 ) then
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(3,7)
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 2
    else
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(2,4)
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = ZombRand(2,5)
    end

    if ( ZombRand(0,200) == 100 ) then
        local goodPrize = { "PrimerSG_Pack","GunPowder" }

        if ( goodPrize[zombRand(1,3)] == "PrimerSG_Pack") then
            boxItems["Base.PrimerSG_Pack"] = 1
            boxItems[brass[ZombRand(1,#brass+1)]] = 40
        else
            boxItems["Base.GunPowder"] = 2
            boxItems[brass[ZombRand(1,#brass+1)]] = 40
        end
    end

    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    return boxItems
end

function halloween()
    local boxItems = {}
    local availableItems = { "AuthenticZClothing.SkeletonBody","AuthenticZClothing.HawaiianLei","AuthenticZClothing.Glasses_Popeyes","AuthenticZClothing.Boilersuit_PrisonerClassic","AuthenticZClothing.Boilersuit_GhostbustersSpengler","AuthenticZClothing.Boilersuit_CrossingGuard","AuthenticZClothing.Sweater_Freddy","AuthenticZClothing.CultistRobe","AuthenticZClothing.Dress_Maid","AuthenticZClothing.Dress_Nurse","AuthenticZClothing.Mime_Overalls","AuthenticZClothing.Clown_Coveralls","AuthenticZClothing.Vest_Waistcoat_Barbershop_Blue","AuthenticZClothing.Vest_Waistcoat_Barbershop_Green","AuthenticZClothing.Vest_Waistcoat_Barbershop_Purple","AuthenticZClothing.Vest_Waistcoat_Barbershop_Yellow","AuthenticZClothing.Vest_Waistcoat_Joker_Orange","AuthenticZClothing.Skirt_ShortRedPlaid","AuthenticZClothing.Skirt_ShortCheerleader","AuthenticZClothing.Shirt_Cheerleader","AuthenticZClothing.Authetic_PomPomBlue","AuthenticZClothing.Authetic_PomPomWhite","AuthenticZClothing.Authetic_PomPomBlack","AuthenticZClothing.Authetic_PomPomRed","AuthenticZClothing.Trousers_DesignerTINT","AuthenticZClothing.Trousers_UncleSam","AuthenticZClothing.Bag_SpiffoBackpackAZ","AuthenticZClothing.RaveMask","AuthenticZClothing.BunnyEars","AuthenticZClothing.Hat_StormtrooperHelmetAZ","AuthenticZClothing.Hat_DRLegoHead","AuthenticZClothing.Hat_MichaelMyers","AuthenticZClothing.Hat_StovePipe","AuthenticZClothing.Hat_Dimitrescu","AuthenticZClothing.Hat_WoolyHatWaldo","AuthenticZClothing.Hat_GhostFace","AuthenticZClothing.Hat_StormtrooperHelmetSparklesAZ","AuthenticZClothing.Hat_JackoLantern","AuthenticZClothing.Hat_HockeyMaskJason","AuthenticZClothing.Hat_JasonSack","AuthenticZClothing.Hat_PyromancerSkull","AuthenticZClothing.Hat_Gibus","AuthenticZClothing.Hat_WeddingVeilBlue","AuthenticZClothing.Hat_WeddingVeilPink","AuthenticZClothing.Hat_WeddingDressBlue","AuthenticZClothing.Hat_WeddingDressPink","AuthenticZClothing.AZ_HairStyle34","AuthenticZClothing.Hat_CheeseHat","AuthenticZClothing.Hat_Witchy_2","AuthenticZClothing.Hat_TrueEyeCult","AuthenticZClothing.Hat_Raccoon","AuthenticZClothing.Hat_CaptainSkipper","AuthenticZClothing.Hat_UncleSam","AuthenticZClothing.Hat_RuneDuel","AuthenticZClothing.Hat_ChickenHeadJacket","Base.SpiffoBig","Base.SpiffoSuit","Base.SpiffoTail","Base.Hat_Spiffo","Base.Hat_SpiffoEars","Base.Tie_Full_Spiffo","Base.Hat_Antlers","Base.Hat_FurryEars","Base.Hat_BunnyEarsWhite","Base.Hat_BunnyEarsBlack","Base.Hat_GoldStar","AuthenticZClothing.AuthenticlceStaff","AuthenticZClothing.Authentic_FeatherDuster","AuthenticZClothing.AuthenticFreeHugsSign","AuthenticZClothing.InflatableTube_AZ","AuthenticZClothing.Boilersuit_Halloween","AuthenticZClothing.Hat_Boater_Green","AuthenticZClothing.Hat_Boater_Blue","AuthenticZClothing.Hat_Boater_Purple","AuthenticZClothing.Hat_Boater_Red","AuthenticZClothing.Hat_Boater_Green","AuthenticZClothing.Hat_Boater_Yellow","AuthenticZClothing.Hat_Boater_Small","AuthenticZClothing.AuthenticBalloon_Blue","AuthenticZClothing.AuthenticBalloon_Green","AuthenticZClothing.AuthenticBalloon_Pink","AuthenticZClothing.AuthenticBalloon_Purple","AuthenticZClothing.AuthenticBalloon_Red","AuthenticZClothing.AuthenticBalloon_White","AuthenticZClothing.AuthenticBalloon_Yellow","AuthenticZClothing.AuthenticBalloonGroup_Blue","AuthenticZClothing.AuthenticBalloonGroup_Green","AuthenticZClothing.AuthenticBalloonGroup_Pink","AuthenticZClothing.AuthenticBalloonGroup_Purple","AuthenticZClothing.AuthenticBalloonGroup_Red","AuthenticZClothing.AuthenticBalloonGroup_White","AuthenticZClothing.AuthenticBalloon_Group_Yellow","AuthenticZClothing.AlienBody","AuthenticZClothing.MandoSpear","AuthenticZClothing.Chainsaw","AuthenticZClothing.Gloves_FreddyKreuger","AuthenticZClothing.Winslow_Spikes","AuthenticZClothing.Jacket_StraightJacket","AuthenticZClothing.Hat_WinslowHelmet","AuthenticZClothing.Hat_WrinklesMask","AuthenticZClothing.Rainboots_Yellow" }
    
    for count=0,ZombRand(1,2),1 do
        boxItems[availableItems[ZombRand(1,#availableItems+1)]] = 1
    end

    if ( ZombRand(0,100000) == 50000 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    return boxItems
end

function christmas()
    local boxItems = {}

    if ( ZombRand(0,100) == 50 ) then
        boxItems["Base.Charcoal"] = 1

        return boxItems
    end

    local availableItems = { "ivery.ivery_ChristmasTree","ivery.ivery_ColorfulOrnaments","ivery.ivery_GoldStringOrnaments","ivery.ivery_MetallicOrnaments","ivery.ivery_RedBowOrnaments","ivery.ivery_SilverStringOrnaments","ivery.ivery_StarOrnaments","ivery.ivery_SilverChristmasStar","ivery.ivery_ChristmasWreath","Base.CandyPackage","Base.RockCandy","Base.BowlofCandy","Base.BucketofCandyPopcorn","SapphCooking.RumFull","SapphCooking.ChurrosChocolate","SapphCooking.BowlofBeefStew","SapphCooking.ColaBottlewithMilk","Base.CandyFruitSlices","LootBoxes.Rifle_Loot_Box","LootBoxes.Shotgun_Loot_Box","LootBoxes.SMG_Loot_Box" }

    for count=1,#availableItems,1 do
        boxItems[availableItems[count]] = 1
    end

    if ( ZombRand(0,100) == 50 ) then
        boxItems["Base.ChallengeCoin"] = 1
    end

    if ( ZombRand(0,100) < 50 ) then
        boxItems["Base.Hat_SantaHatGreen"] = 1
    else
        boxItems["Base.Hat_SantaHat"] = 1
    end

    boxItems["Base.Candycane"] = ZombRand(2,6)
    boxItems["Base.CookiesChocolate"] = ZombRand(2,6)
    boxItems["Base.CookiesShortbread"] = ZombRand(2,6)
    boxItems["AuthenticSmokeBomb"] = 2

    return boxItems
end

function books()
    local boxItems = {}
    local availableItems = { "Literacy.BookAiming1","Literacy.BookAiming2","Literacy.BookAiming3","Literacy.BookAiming4","Literacy.BookAiming5","Literacy.BookAxes1","Literacy.BookAxes2","Literacy.BookAxes3","Literacy.BookAxes4","Literacy.BookAxes5","Literacy.BookFitness1","Literacy.BookFitness2","Literacy.BookFitness3","Literacy.BookFitness4","Literacy.BookFitness5","Literacy.BookLightfoot1","Literacy.BookLightfoot2","Literacy.BookLightfoot3","Literacy.BookLightfoot4","Literacy.BookLightfoot5","Literacy.BookLongBlade1","Literacy.BookLongBlade2","Literacy.BookLongBlade3","Literacy.BookLongBlade4","Literacy.BookLongBlade5","Literacy.BookBlunt1","Literacy.BookBlunt2","Literacy.BookBlunt3","Literacy.BookBlunt4","Literacy.BookBlunt5","Literacy.BookMaintenance1","Literacy.BookMaintenance2","Literacy.BookMaintenance3","Literacy.BookMaintenance4","Literacy.BookMaintenance5","Literacy.BookNimble1","Literacy.BookNimble2","Literacy.BookNimble3","Literacy.BookNimble4","Literacy.BookNimble5","Literacy.BookReloading1","Literacy.BookReloading2","Literacy.BookReloading3","Literacy.BookReloading4","Literacy.BookReloading5","Literacy.BookSmallBlade1","Literacy.BookSmallBlade2","Literacy.BookSmallBlade3","Literacy.BookSmallBlade4","Literacy.BookSmallBlade5","Literacy.BookSmallBlunt1","Literacy.BookSmallBlunt2","Literacy.BookSmallBlunt3","Literacy.BookSmallBlunt4","Literacy.BookSmallBlunt5","Literacy.BookSneak1","Literacy.BookSneak2","Literacy.BookSneak3","Literacy.BookSneak4","Literacy.BookSneak5","Literacy.BookSpear1","Literacy.BookSpear2","Literacy.BookSpear3","Literacy.BookSpear4","Literacy.BookSpear5","Literacy.BookSprinting1","Literacy.BookSprinting2","Literacy.BookSprinting3","Literacy.BookSprinting4","Literacy.BookSprinting5","Literacy.BookStrength1","Literacy.BookStrength2","Literacy.BookStrength3","Literacy.BookStrength4","Literacy.BookStrength5" }
    local books = {}
    local item
    local exists = false
    local count = 0
    
    for i=1,35,1 do
    
        item = availableItems[ZombRand(1,#availableItems+1)]
    
        for k,v in ipairs(books) do
            if v == item then
                exists = true
                while exists do
                    item = availableItems[ZombRand(1,#availableItems+1)]
                    count = 0
    
                    for x,y in ipairs(books) do
                        if y == item then
                            break
                        else
                            count = x
                        end
                    end
    
                    if count >= i-1 then
                        exists = false
                    end
                end
            end
        end
        books[i] = item
    end
    
    for k,v in ipairs(books) do
        boxItems[v] = 1
    end

    return boxItems
end