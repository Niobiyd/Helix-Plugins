local PANEL = {}

function PANEL:Init()

	self.scrW, self.scrH = ScrW(), ScrH()

	self:SetSize(self.scrW * 0.50, self.scrH * 0.31)	
	self:MakePopup()
	self:Center()
	self:SetTitle("")
	self:ShowCloseButton( false )
	self:SetDraggable( false )

	--[[local buttonWimg, buttonHimg = self.scrW * 0.45, self.scrH * 0.15
	local buttonXimg, buttonYimg = (self.scrW * 0.25) - (buttonWimg * 0.5), self.scrH * 0.035

	self.sleepimg = self:Add( "DImage" )
	self.sleepimg:SetSize( buttonWimg, buttonHimg )
	self.sleepimg:SetPos( buttonXimg, buttonYimg )
	self.sleepimg:SetImage( "daui/sleep_kek_v4.png" )]]

	local thirdWyes, thirdHyes = self.scrW * 0.1, self.scrH * 0.0265
	local thirdXyes, thirdYyes = (self.scrW * 0.075) - (thirdWyes * 0.5), self.scrH * 0.01

	self.third = self:Add("DLabel")
	self.third:SetTextColor(Color(211, 211, 211))
	self.third:SetPos( thirdXyes, thirdYyes )
	self.third:SetSize( thirdWyes, thirdHyes )
	self.third:SetText("Сонливость: "..math.Round(LocalPlayer():GetCharacter():GetData("sleep_need", 0)).."%")
	self.third:SetFont("ixToolTipText")

	local buttonWlist, buttonHlist = self.scrW * 0.45, self.scrH * 0.035
	local buttonXlist, buttonYlist = (self.scrW * 0.25) - (buttonWlist * 0.5), self.scrH * 0.2

	self.listsleep = self:Add("DPanel")	
	self.listsleep:SetSize( buttonWlist, buttonHlist )
	self.listsleep:SetPos( buttonXlist, buttonYlist )	

	function self.listsleep:Paint( w, h )
		local material = Material("daui/noimg.png")
		surface.SetDrawColor(color_white) 
		surface.SetMaterial(material) 
		surface.DrawTexturedRect(0, 0, w, h) 
	end

	local buttonWhm, buttonHhm = self.scrW * 0.8, self.scrH * 0.015 --self.scrW * 0.445, self.scrH * 0.015
	local buttonXhm, buttonYhm = (self.scrW * 0.075) - (buttonWhm * 0.5), self.scrH * 0.01 --(self.scrW * 0.235) - (buttonWhm * 0.5), self.scrH * 0.01

	self.hmsleep = self.listsleep:Add("StalkerDNumSlider")
	self.hmsleep:SetPos( buttonXhm, buttonYhm )
	self.hmsleep:SetSize( buttonWhm, buttonHhm )
	self.hmsleep:SetMin( 0 )
	self.hmsleep:SetMax( 12 )
	self.hmsleep:SetDecimals( 0 )
	--self.hmsleep:SetConVar( "sleep_char_value" )
	self.hmsleep:SetValue(6)

 
	local buttonWyes, buttonHyes = self.scrW * 0.1, self.scrH * 0.0265
	local buttonXyes, buttonYyes = (self.scrW * 0.2) - (buttonWyes * 0.5), self.scrH * 0.265

	self.sleepconfirm = self:Add("DButton")
	function self.sleepconfirm:Paint(w,h)
		if self:IsHovered() then
			surface.SetDrawColor(Color(105, 105, 105, 100)) 
			surface.DrawTexturedRect(0, 0, w, h) 
			surface.DrawOutlinedRect(0, 0, w, h)
		end
	end
	self.sleepconfirm:SetDisabled(false)
	self.sleepconfirm:SetText(L("Sleep"))
	self.sleepconfirm:SetFont("ixToolTipText")
	self.sleepconfirm:SetTextColor(color_white)
	self.sleepconfirm:SetSize(buttonWyes, buttonHyes)	
	self.sleepconfirm:SetPos(buttonXyes, buttonYyes)	

	self.sleepconfirm.DoClick = function(client)
		if self.hmsleep:GetValue() < 0.5 then
			self:Close()
		else
			netstream.Start("start_sleep2", self.hmsleep:GetValue())
			self:Close()
		end
	end

	local third1Wyes, third1Hyes = self.scrW * 0.2, self.scrH * 0.0265
	local third1Xyes, third1Yyes = (self.scrW * 0.572) - (third1Wyes * 0.5), self.scrH * 0.011
	
	function self:Paint( w, h )
		local material = Material("daui/sleep_v2.png")
		surface.SetDrawColor(color_white) 
		surface.SetMaterial(material) 
		surface.DrawTexturedRect(0, 0, w, h) 

		draw.DrawText("Выбранное значение: "..math.Round(self.hmsleep:GetValue()).." секунд(ы)", "ixToolTipText", third1Xyes, third1Yyes, Color(211, 211, 211), TEXT_ALIGN_RIGHT )

		surface.SetDrawColor(255, 255, 255, 100) 
		surface.SetMaterial(Material("daui/sleep_kek_v3.png")) 
		surface.DrawTexturedRect((self.scrW * 0.25) - (self.scrW * 0.45 * 0.5), self.scrH * 0.035, self.scrW * 0.45, self.scrH * 0.15)
		surface.DrawOutlinedRect((self.scrW * 0.25) - (self.scrW * 0.45 * 0.5), self.scrH * 0.035, self.scrW * 0.45, self.scrH * 0.15)
	end

	local buttonWno, buttonHno = self.scrW * 0.1, self.scrH * 0.0265
	local buttonXno, buttonYno = (self.scrW * 0.305) - (buttonWno * 0.5), self.scrH * 0.265
	
	self.exitsleep = self:Add("DButton")
	
	function self.exitsleep:Paint(w,h)
		--[[if self:IsDown() then 
			local material = Material("daui/but_pressf.png") 
			surface.SetDrawColor(color_white) 
			surface.SetMaterial(material) 
			surface.DrawTexturedRect(0, 0, w, h) ]]
		if self:IsHovered() then
			surface.SetDrawColor(Color(105, 105, 105, 100)) 
			surface.DrawTexturedRect(0, 0, w, h) 
			surface.DrawOutlinedRect(0, 0, w, h)
		end
	end

	self.exitsleep:SetDisabled(false)
	self.exitsleep:SetText(L("Отменить"))
	self.exitsleep:SetFont("ixToolTipText")
	self.exitsleep:SetTextColor(color_white)
	self.exitsleep:SetSize(buttonWno, buttonHno)	
	self.exitsleep:SetPos(buttonXno, buttonYno)	

	self.exitsleep.DoClick = function()
		self:Close()
	end
end


vgui.Register("sleep", PANEL, "DFrame")

	netstream.Hook("sleep", function()
		noteRead1 = vgui.Create("sleep")
	end)