-- MIT License

-- Copyright (c) 2021 MediQ

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-- Discord     :       MediQ#0001
-- Github      :       https://github.com/Niobiyd
-- Steam       :       https://steamcommunity.com/profiles/76561198843899799/

local PLUGIN = PLUGIN
PLUGIN.name = "Custom cursor"
PLUGIN.author = "MediQ"
PLUGIN.description = "Add some custom cursors for helix framework"
PLUGIN.version = 1.0

IX_CURSOR_MATERIAL = Material("example.png") -- Your own material for cursor

if CLIENT then

	-- Draw the new cursor
	function draw.CustCursor( material )
		local pos_x, pos_y = input.GetCursorPos()

		if vgui.CursorVisible() then
			surface.SetDrawColor(color_white)
			surface.SetMaterial(material)
			surface.DrawTexturedRect(pos_x, pos_y, ScreenScale(15), ScreenScale(15))
		end
	end

	-- Post draw cursor
	function PLUGIN:PostRenderVGUI()
		draw.CustCursor(IX_CURSOR_MATERIAL)
	end

	-- [[ Credit from the DroDa, Thank you! ]]

	-- Delete default windows cursor
	-- Bug: Cursor is visible if you press ESC
	function PLUGIN:Think()
		local hover_panel = vgui.GetHoveredPanel()
		if !IsValid(hover_panel) then return end

		hover_panel:SetCursor("blank")
	end
end