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
    if (IsAddOnLoaded('Aurora')) then
		if cfg.debug then
			print("!BobSkins: Aurora has been skinned")
		end
		local style = {}

		AURORA_CUSTOM_STYLE = style

		style.apiVersion = "6.0"

		local F, C = unpack(Aurora)

		style.functions = {
			["CreateBD"] = function(f, a)
				f:SetBackdrop({
					bgFile = cfg.backdrop,
					edgeFile = nil,
					edgeSize = 1,
				})
				f:SetBackdropColor(unpack(cfg.bColor))
				f:SetBackdropBorderColor(unpack(cfg.border.color))
				f:CreateBeautyBorder(cfg.border.size)
				f:SetBeautyBorderTexture(cfg.border.texture)
				f:SetBeautyBorderColor(unpack(cfg.border.color))
				if not a then tinsert(C.frames, f) end
				if cfg.debug then
					print("!BobSkins: Aurora called function 'CreateBD' reapplying skin!")
				end

			end,
			["Reskin"] = function(f, noHighlight)
				f:SetNormalTexture("")
				f:SetHighlightTexture("")
				f:SetPushedTexture("")
				f:SetDisabledTexture("")

				if f.Left then f.Left:SetAlpha(0) end
				if f.Middle then f.Middle:SetAlpha(0) end
				if f.Right then f.Right:SetAlpha(0) end
				if f.LeftSeparator then f.LeftSeparator:Hide() end
				if f.RightSeparator then f.RightSeparator:Hide() end

				F.CreateBD(f, .0)
			end,
		}
		style.classcolors = {
			["HUNTER"] = { r = 0.58, g = 0.86, b = 0.49 },
			["WARLOCK"] = { r = 0.6, g = 0.47, b = 0.85 },
			["PALADIN"] = { r = 0, g = 1, b = 1 },
			["PRIEST"] = { r = 0.8, g = 0.87, b = .9 },
			["MAGE"] = { r = 0, g = 0.76, b = 1 },
			["MONK"] = {r = 0.0, g = 1.00 , b = 0.59},
			["ROGUE"] = { r = 1, g = 0.91, b = 0.2 },
			["DRUID"] = { r = 1, g = 0.49, b = 0.04 },
			["SHAMAN"] = { r = 0, g = 0.6, b = 0.6 };
			["WARRIOR"] = { r = 0.9, g = 0.65, b = 0.45 },
			["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23 },
		}

		style.highlightColor = {r = 0, g = 1, b = 0}

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, addon)
			if addon == "Aurora" then
				F, C = unpack(Aurora)

				self:UnregisterEvent("ADDON_LOADED")
			end
		end)
	end
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