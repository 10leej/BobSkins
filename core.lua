local _, cfg = ... --import config
local addon, ns = ... --get addon namespace

--[[
This started out as a place to dump all my !Beautycase Skins in BobUI
 --10leej
]]

local function CreateBackdrop(frame)
	frame:SetBackdrop({bgFile = cfg.backdrop, edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = cfg.pixelbordersize, 
		insets = {top = 2, left = 2, bottom = 2, right = 2}})
	frame:SetBackdropColor(unpack(cfg.bColor))
	frame:SetBackdropBorderColor(unpack(cfg.bColor))
	if isBeautiful then
		frame:CreateBeautyBorder(cfg.border.size.large)
		frame:SetBeautyBorderTexture(cfg.border.texture)
		frame:SetBeautyBorderColor(unpack(cfg.border.color))
	end
end

if cfg.debug then
	print("!BobSkins: LOADED")
end
local f = CreateFrame('Frame')
f:RegisterEvent('VARIABLES_LOADED')
f:RegisterEvent('ADDON_LOADED')
f:RegisterEvent('PLAYER_ENTERING_WORLD')

f:SetScript('OnEvent', function(self)
--[[
    if (IsAddOnLoaded('Omen')) then
		print("!BobSkins: Omen skin is in open beta there may be errors -10leej")
        if (not OmenBarList.beautyBorder) then
            OmenBarList:CreateBeautyBorder(cfg.border.size.large)
            OmenBarList:SetBeautyBorderTexture(cfg.border.texture)
            OmenBarList:SetBeautyBorderPadding(2)
        end
    end
]]
    if (IsAddOnLoaded('DBM-Core')) then
		if cfg.debug then
			print("!BobSkins: DBM skin is in open beta there may be errors -10leej")
		end
        hooksecurefunc(DBT, 'CreateBar', function(self)
            for bar in self:GetBarIterator() do
                local frame = bar.frame
                local tbar = _G[frame:GetName()..'Bar']
                local spark = _G[frame:GetName()..'BarSpark']
                local texture = _G[frame:GetName()..'BarTexture']
                local icon1 = _G[frame:GetName()..'BarIcon1']
                local icon2 = _G[frame:GetName()..'BarIcon2']
                local name = _G[frame:GetName()..'BarName']
                local timer = _G[frame:GetName()..'BarTimer']

                spark:SetTexture(nil)

                timer:ClearAllPoints()
                timer:SetPoint('RIGHT', tbar, 'RIGHT', -4, 0)
                timer:SetFont('Fonts\\ARIALN.ttf', 22)
                timer:SetJustifyH('RIGHT')

                name:ClearAllPoints()
                name:SetPoint('LEFT', tbar, 4, 0)
                name:SetPoint('RIGHT', timer, 'LEFT', -4, 0)
                name:SetFont('Fonts\\ARIALN.ttf', 15)

                tbar:SetHeight(24)
                tbar:CreateBeautyBorder(cfg.border.size.large)
                tbar:SetBeautyBorderTexture(cfg.border.texture)
                tbar:SetBeautyBorderPadding(tbar:GetHeight() + 3, 2, 2, 2, tbar:GetHeight() + 3, 2, 2, 2)
                tbar:SetBackdrop({bgFile = 'Interface\\Buttons\\WHITE8x8'})
                tbar:SetBackdropColor(0, 0, 0, 0.5)

                icon1:SetTexCoord(0.07, 0.93, 0.07, 0.93)
                icon1:SetSize(tbar:GetHeight(), tbar:GetHeight() - 1)

                icon2:SetTexCoord(0.07, 0.93, 0.07, 0.93)
                icon2:SetSize(tbar:GetHeight(), tbar:GetHeight() - 1)
            end
        end)
    end

    if (IsAddOnLoaded('TinyDPS')) then
		if cfg.debug then
			print("!BobSkins: TinyDPS skin is in open beta there may be errors -10leej")
		end
        if (not tdpsFrame.beautyBorder) then
            tdpsFrame:CreateBeautyBorder(cfg.border.size.large)
            tdpsFrame:SetBeautyBorderTexture(cfg.border.texture)
            tdpsFrame:SetBeautyBorderPadding(2)
            tdpsFrame:SetBackdrop({
                bgFile = 'Interface\\Buttons\\WHITE8x8',
                insets = { left = 0, right = 0, top = 0, bottom = 0 },
            })
            tdpsFrame:SetBackdropColor(0, 0, 0, 0.5)
        end
    end

    if (IsAddOnLoaded('Recount')) then
		if cfg.debug then
			print("!BobSkins: Recount skin is in open beta there may be errors -10leej")
		end
        if (not Recount.MainWindow.beautyBorder) then
            Recount.MainWindow:CreateBeautyBorder(cfg.border.size.large)
            Recount.MainWindow:SetBeautyBorderTexture(cfg.border.texture)
            Recount.MainWindow:SetBeautyBorderPadding(2, -10, 2, -10, 2, 2, 2, 2)
            Recount.MainWindow:SetBackdrop({
                bgFile = 'Interface\\Buttons\\WHITE8x8',
                insets = { left = 0, right = 0, top = 10, bottom = 0 },
            })
            Recount.MainWindow:SetBackdropColor(0, 0, 0, 0.5)
        end
    end

    if (IsAddOnLoaded('Skada')) then
		if cfg.debug then
			print("!BobSkins: Skada skin is in open beta there may be errors -10leej")
		end
        local OriginalSkadaFunc = Skada.PLAYER_ENTERING_WORLD
        function Skada:PLAYER_ENTERING_WORLD()
            OriginalSkadaFunc(self)

            if (SkadaBarWindowSkada and not SkadaBarWindowSkada.beautyBorder) then
                SkadaBarWindowSkada:CreateBeautyBorder(cfg.border.size.large)
                SkadaBarWindowSkada:SetBeautyBorderTexture(cfg.border.texture)
                SkadaBarWindowSkada:SetBeautyBorderPadding(3)
                SkadaBarWindowSkada:SetBackdrop({
                    bgFile = 'Interface\\Buttons\\WHITE8x8',
                    insets = { left = 0, right = 0, top = 10, bottom = 0 },
                })
                SkadaBarWindowSkada:SetBackdropColor(0, 0, 0, 0.5)
            end
        end
    end
end)