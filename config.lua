local _, cfg = ... --import config
local addon, ns = ... --get addon namespace

local MediaPath = "Interface\\AddOns\\!BobSkins\\media\\" --Set the media path

cfg.statusbar_texture = MediaPath.."statusbar" --Set the Bar Texture
cfg.backdrop = "Interface\\Buttons\\WHITE8x8" --backdrop image
cfg.font = "Fonts\\ARIALN.ttf" --BobUI's base font
cfg.style = "THINOUTLINE" 	--OUTLINE, MONOCHROME, or nil

--Backdrop colors
cfg.bColor = { .0, .0, .0, 0.5 }--Set  backround color r,b,g,alpha

--Border config
cfg.pixelbordersize = 2 --only shows if !Beautycase is disabled
cfg.border = { --!Beautycase border config
	size = { --adjustable border sizes
		large = 12,
		medium = 10,
		small = 8, --smaller frames like the nameplates
	},
	texture = "default", --default, white [[This function does not support aura frames]]
	color = { 1, 1, 1 }, --Colors work best with the white layout [[This function does not support aura frames]]
}