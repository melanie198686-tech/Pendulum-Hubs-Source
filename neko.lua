local NotificationBindable = Instance.new("BindableFunction")

loadstring(game:HttpGet("https://raw.githubusercontent.com/melanie198686-tech/Pendulum-Hubs-Source/refs/heads/main/Reanimation.lua"))()

local SongID = "http://www.roblox.com/asset/?id=198665867"
Bypass = "death"
if not Bypass then Bypass = "limbs" end
HumanDied = false

CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..CountSCIFIMOVIELOL
	local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..CountSCIFIMOVIELOL
	local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..CountSCIFIMOVIELOL
	AttachmentC.Orientation = Angle
	AttachmentA.Position = Position
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentC;
	AlignOri.Attachment0 = AttachmentD;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1

end


local CloneChar = workspace.non







ArtificialHB = Instance.new('BindableEvent', script)
ArtificialHB.Name = 'Heartbeat'
script:WaitForChild('Heartbeat')
frame = 1 / 60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService('RunService').Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
local makesound = function(soundid,speed,volume,parent)
	local sound = Instance.new("Sound")
	sound.SoundId = soundid
	sound.RollOffMaxDistance = 100
	sound.PlaybackSpeed =speed 
	sound.Volume = volume
	sound.Parent = parent
	return sound
end
local Callerp = function(Start,End,Percent)
	return (Start - (End - Start) * Percen)
end
function swait(t)
	game:GetService('RunService').Stepped:wait()
end

local TweenService = game:GetService("TweenService")
local CF = CFrame.new
local CFA = CFrame.Angles
local head = CloneChar:WaitForChild("Head")
local tors = CloneChar:WaitForChild("Torso")
local huma = CloneChar:WaitForChild("Humanoid")
huma.DisplayName = " "
local neck = Instance.new("Weld",tors)
neck.Part0 = tors
neck.Part1 = head
neck.C0 = CF(0,1.5,0)
local nek = neck.C1
neck.Enabled = true
local root = CloneChar.HumanoidRootPart.RootJoint.C0
local rs = tors["Right Shoulder"].C0
local ls = tors["Left Shoulder"].C0
local rh = tors["Right Hip"].C0
local lh = tors["Left Hip"].C0
local RootPart = CloneChar:WaitForChild("HumanoidRootPart")
local Humanoid = CloneChar.Humanoid
local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
Humanoid.JumpPower = 80
local Attacking = false
local AttackANVal = 1
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(1000,0,1000)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
rayCast = function(Pos, Dir, Max, Ignore)

	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), (CloneChar and game.Players.LocalPlayer.Character))
end
Spawn(function()
	for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
		if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
			s = game:GetService("RunService").Heartbeat:connect(function()
				v.Velocity = Vector3.new(0,35,0)
				wait(0.3)
			end)
		end
	end
end)
spawn(function()
	repeat
		wait()
	until Humanoid.Health < 0.1
	s:Disconnect()
end)
if Tail ~= nil then
	TailWeld = Tail.AccessoryWeld

else
	TailWeld = Instance.new("Weld",workspace)
end
local TC0 = TailWeld.C0 * CFrame.new(0,0,0.4)
local Song = Instance.new("Sound",RootPart)
Song.SoundId = SongID
Song.Looped = true
Song:Play()
local Running = false

local MakeTween = function(timetack,easingstyle,easingdirection,repeats,flipflop)
	local newtween = TweenInfo.new(
		timetack, 
		easingstyle, 
		easingdirection, 
		repeats, 
		flipflop, 
		0 
	)
	return newtween
end
local DOTWEEN = function(Part,tim,value)
	local Tween = MakeTween(tim,Enum.EasingStyle.Circular,Enum.EasingDirection.InOut,0,false)
	TweenService:Create(Part,Tween,{C0= value}):Play()
end
local LerpStyle = function(lerpmagnet,easingstyle,easingdirection)
	local newstyle = TweenService:GetValue(lerpmagnet,easingstyle,easingdirection)
	return newstyle
end

local SpinKick  = function()
	if Attacking == false then
		Attacking = true 
		for i = 0,60,1 do
			swait()
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(30),math.rad(0),math.rad(0)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20 + -10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-30 - -6)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
		end 
		bambam.Location = game.Players.LocalPlayer.Character.Torso.Position
		game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character.Torso.Position
		RootPart.Anchored = true
		for i = 0,60,1 do
			swait()
			RootPart.Position = RootPart.Position + Vector3.new(0,0.6,0)
			bambam.Location = game.Players.LocalPlayer.Character["Right Leg"].Position
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character.Torso.Position
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-20 + -36*i),math.rad(0),math.rad(0)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.0,0,0) * CFA(math.rad(0),math.rad(30),math.rad(40)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(-30),math.rad(-40)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(50)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
		end 
		RootPart.Anchored = false
		Attacking = false
	end
end


local ComboCont = 1
local Attack = function()
	if Attacking == false then
		Attacking = true
		if ComboCont == 1 then
			for i = 0,10,1 do
				swait()
				bambam.Location = game.Players.LocalPlayer.Character["Right Arm"].Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character["Right Arm"].Position
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-30),math.rad(0),math.rad(80)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.5,0,-1.2) * CFA(math.rad(0),math.rad(90),math.rad(90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 

			for i = 0,15,1 do
				swait()
				bambam.Location = game.Players.LocalPlayer.Character["Right Arm"].Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character["Right Arm"].Position
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,-3,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.5,0,0) * CFA(math.rad(0),math.rad(-85),math.rad(90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(40)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end
			ComboCont = 2


		elseif ComboCont == 2 then
			for i = 0,10,1 do
				swait()
				bambam.Location = game.Players.LocalPlayer.Character["Left Arm"].Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character["Left Arm"].Position
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(90),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-30),math.rad(0),math.rad(90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-12)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 

			for i = 0,10,1 do
				swait()
				bambam.Location = game.Players.LocalPlayer.Character["Left Arm"].Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character["Left Arm"].Position
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(-90),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,-3,0) * CFA(math.rad(0),math.rad(0),math.rad(-90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-12)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0.5) * CFA(math.rad(0),math.rad(90),math.rad(-90)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(30)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 
			ComboCont = 3
		elseif ComboCont == 3 then
			for i = 0,10,1 do
				swait()
				bambam.Location = game.Players.LocalPlayer.Character["Right Leg"].Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character["Left Arm"].Position
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(10),math.rad(0),math.rad(-50)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-5)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(8)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(-50),math.rad(-98)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(20),math.rad(0)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 

			for i = 0,15,1 do
				swait()
				bambam.Location = game.Players.LocalPlayer.Character["Right Leg"].Position
				game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character["Left Arm"].Position
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(90),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,-3,0) * CFA(math.rad(-40),math.rad(0),math.rad(90)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-5)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(8)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(90),math.rad(-90+40)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(-90),math.rad(0)),LerpStyle(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
			end 
			ComboCont = 1
		end
		Attacking = false
	end
end
local Mouse = game.Players.LocalPlayer:GetMouse()
local B1Hold = false
Mouse.Button1Down:Connect(function()
	B1Hold = true 
	while B1Hold == true do
		wait()
		Attack()
	end
end)
local Running = false
Mouse.Button1Up:Connect(function()
	B1Hold = false
end)
Mouse.KeyDown:Connect(function(key)
	if key == "z" then
		SpinKick()
	else
		if key == "t" and Attacking == false then
			Attacking = true
			makesound("rbxassetid://6433451653",1,1,tors):Play()
			for i=0,100 do
				swait()
				neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad( -15 + math.rad(math.sin(time()*16)*15)),0,0),LerpStyle(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut))
				RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(-10 +  math.sin(time()*16)*10),math.rad(0),math.rad(0)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0.4 + math.sin(time()*17)*0.4,0) * CFA(0,math.rad(90),math.rad(123)),LerpStyle(0.07*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(10),0,math.rad(-90)),LerpStyle(0.07*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(-30 + math.sin(time()*17)*20),math.rad(-10 +  math.sin(time()*16)*10)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(10 +  math.sin(time()*16)*-10)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
				TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(-20 + math.sin(-time()*3.83)*-20),math.rad(-math.sin(time()*3.83/2)*24),0),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			end
			Attacking = false
		else
			if key == "r" and Attacking == false then
				Attacking = true
				while game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude < 0.1 do
					swait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.Position = tors.Position
					neck.C1 = neck.C1:Lerp(nek * CF(0,-0.4,0) * CFA(math.rad(-90),math.rad(-math.cos(time()*3)*30),0),LerpStyle(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut))
					RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,-2.5) * CFA(math.rad(78),math.rad(math.sin(time()*3)*12),math.rad(math.rad(math.sin(time()*3)*40))),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.3,0.4 +0.4+math.sin(time()*3)*0.2,-0.4 -0.2+math.sin(time()*3)*0.2) * CFA(math.rad(-45)+math.rad(math.sin(time()*3)*12),math.rad(0),math.rad(180 - 10+math.cos(time()*3)*5)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(-0.3,0.4+0.4-math.sin(time()*3)*0.2,-0.4 -0.2+math.sin(time()*3)*0.2) * CFA(math.rad(-45)-math.rad(math.sin(time()*3)*12),math.rad(0),math.rad(-180 + 10 +math.cos(time()*3)*5)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(-math.sin(time()*3)*12),math.rad(math.sin(time()*3)*30),math.rad(-12 - 50 + math.cos(time()*3)*30)),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(-math.sin(time()*3)*12),math.rad(math.sin(time()*3)*30),math.rad(12 + 50 + math.cos(time()*3)*30)),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
					TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(0),0,math.rad(math.cos(time()*3)*40)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))

				end
				Attacking = false
			else if key == "f" then
					if Running == false then
						Running = true 
						Humanoid.WalkSpeed = 40
					else
						Running = false
						Humanoid.WalkSpeed = 20
					end
				elseif key == "x" and Attacking == false and Mouse.Target.Parent:FindFirstChildWhichIsA("Humanoid") ~= nil then
					Attacking = true
					Camera = workspace.CurrentCamera
					Camera.CameraType = "Scriptable"
					local Target = Mouse.Target.Parent
					for i = 0,200,1 do
						swait()
						Camera.CFrame = Camera.CFrame:Lerp(CFrame.new((head.CFrame * CFrame.new(0,0,-5)).Position,head.CFrame.Position),1)
						neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,-0.5,0) * CFA(math.rad(-25),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,-0.5,0) * CFA(math.rad(-25),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20+ -40)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20+ -4)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
					end

					for i = 0,20,1 do
						swait()
						Camera.CFrame = Camera.CFrame:Lerp(CFrame.new((head.CFrame * CFrame.new(0,0,-3)).Position,head.CFrame.Position),1)
						neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,-0.5,0) * CFA(math.rad(-40),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,-0.5,0) * CFA(math.rad(-40),math.rad(0),math.rad(00)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20+ -40)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20+ -4)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
					end
					RootPart.CFrame = Target.HumanoidRootPart.CFrame * CFrame.new(0,0,-8)
					for i = 0,100,1 do
						swait()
						game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Target.HumanoidRootPart.Position
						Camera.CFrame = Camera.CFrame:Lerp(CFrame.new((head.CFrame * CFrame.new(-3,0,0)).Position,Target.HumanoidRootPart.CFrame.Position),0.2)
						neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,0) * CFA(math.rad(20),math.rad(0),math.rad(0)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,-0.5,0) * CFA(math.rad(-80),math.rad(0),math.rad(-20)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,-0.5,0) * CFA(math.rad(-80),math.rad(0),math.rad(20)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(20+ -40)),LerpStyle(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
						tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,0,0) * CFA(math.rad(0),math.rad(0),math.rad(-20+ -4)),LerpStyle(0.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out))
					end
					Attacking = false
					Camera.CameraType = "Custom"
				end
			end
		end
	end
end)
local RLA = CFrame.new(0,0,0)

local Anim = "Idle"
power = 60000 -- The lower the number, the more stable the torso is, but less fling power.

game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
end)

wait(.1)
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.Torso
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.Torso.Position


Humanoid.WalkSpeed = 20
while true do
	swait()
	hitfloor = rayCast(RootPart.Position, CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 0.5, 0)).lookVector, 4, CloneChar)
	local torvel = (game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Vector3.new(1, 0, 1)).magnitude
	local velderp = RootPart.Velocity.y
	if RootPart.Velocity.y > 0 and hitfloor == nil then
		Anim = "Jumping"

	elseif RootPart.Velocity.y < 0 and hitfloor == nil then
		Anim = "Falling"
	elseif torvel < .5 and hitfloor ~= nil  then
		Anim = "Idle"
	elseif torvel > .5 and  hitfloor ~= nil  then
		Anim = "Walking"
	end
	local W1 = game.Players.LocalPlayer.Character.Humanoid.MoveDirection* RootPart.CFrame.LookVector
	local W2 = game.Players.LocalPlayer.Character.Humanoid.MoveDirection* RootPart.CFrame.RightVector
	WVA = W1.X+W1.Z
	RLV = W2.X+W2.Z


	if Attacking == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.Position = tors.Position
		if Anim == "Falling" then
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0.3) * CFA(math.rad(20),0,0),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF(0,0,0) * CFA(0,0,0),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(math.rad(-40),0,math.rad(5)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(math.rad(-40),0,math.rad(-5)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0.4,0.8,0) * CFA(0,0,math.rad(10)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0.4,0.5,0)  * CFA(0,0,math.rad(50)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
		elseif Anim == "Jumping" then
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0.3) * CFA(math.rad(-20),0,0),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF(0,0,0) * CFA(0,0,0),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0,0,0) * CFA(0,math.rad(-40),math.rad(-20)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0,0,0) * CFA(0,math.rad(40),math.rad(20)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0.4,0.8,0) * CFA(0,0,math.rad(-10)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0.4,0.5,0)  * CFA(0,0,math.rad(-50)),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
		elseif Anim == "Idle" then
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(7+math.cos(time()*3.83)*-5 + (-6 + math.sin(time()*3.83)*6 )),math.rad(-24) + math.rad( math.sin((time()*3.83)/2)*10),math.rad(-math.cos((time()*3.83)/2)*13)),LerpStyle(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root * CF(0,0,math.cos((time()*3.83))/10) * CFA(math.rad(0),math.rad(0),math.rad(0)),LerpStyle(0.4*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(-0.1,math.cos((time()*3.83))/10,0) * CFA(math.rad(-5)- -math.sin((-time()*3.83))/8.7,math.rad(0),math.rad(5)+math.cos((-time()*3.83))/8.7),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(0.1,math.cos((time()*3.83))/10,0) * CFA(math.rad(-5)- -math.sin((-time()*3.83))/8.7,math.rad(0),math.rad(-5)-math.cos((-time()*3.83))/8.7),LerpStyle(0.3*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,-math.cos((time()*3.83))/8,0) * CFA(math.rad(-4),math.rad(-12),math.rad(8)),LerpStyle(0.4*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,-math.cos((time()*3.83))/8,0) * CFA(math.rad(-1),math.rad(7),math.rad(2)),LerpStyle(0.4*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(-20 + math.sin(-time()*3.83)*-20),math.rad(-math.sin(time()*3.83/2)*24),0),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
		elseif Anim == "Walking" and Running == false then
			RLA =  CFrame.new((math.sin((time()*8))/1)*0.5 *WVA,0.3*(1-WVA),(math.sin((time()*8))/1)*0.5 *RLV) * CFrame.Angles((-math.sin((time()*8))/1.5)*RLV,0,(math.sin((time()*8))/1.2)*WVA)
			LLA =  CFrame.new((math.sin((time()*8))/1)*0.5 *WVA,0.3*(1-WVA),(math.sin((time()*8))/1)*0.5 *RLV) * CFrame.Angles((-math.sin((time()*8))/1.5)*RLV,0,(math.sin((time()*8))/1.2)*WVA)
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(math.rad(7),math.clamp(math.cos((time()*8))*0.2 + math.rad(-RootPart.RotVelocity.Y*8),math.rad(-85),math.rad(85)),math.rad(-RootPart.RotVelocity.Y*0.4)),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF(0,-math.sin((time()*8*2))/3.2,-math.sin((time()*8*2))/3) * CFA(math.rad( -15 + 10 + WVA*15) + -math.rad(math.sin(time() *(8*2))*10),math.clamp( math.rad(0) - -RootPart.RotVelocity.Y/50,math.rad(-20),math.rad(20)),math.cos((time()*8))*0.2),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(-math.sin((time()*8))/4.5,0,0) * CFA(math.rad(-5),-math.sin((time()*8))*0.1 + math.rad(RootPart.RotVelocity.Y*3),-math.sin((time()*8))*0.4),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(-math.sin((time()*8))/4.5,0,0) * CFA(math.rad(-5),-math.sin((time()*8))*0.1 + math.rad(RootPart.RotVelocity.Y*3),-math.sin((time()*8))*0.4),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0,(math.cos((time()*8))/8),0) * RLA * CFA(0, (-math.sin((time()*8))*0.5)*WVA,math.rad( -15 + 10 + WVA*15) + -math.rad(math.sin(time() *(8*2))*10)),LerpStyle(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(0,(-math.cos((time()*8))/8),0) * LLA * CFA(0, (-math.sin((time()*8))*0.5)*WVA,-math.rad( -15 + 10 + WVA*15) + math.rad(math.sin(time() *(8*2))*10)),LerpStyle(0.2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.Angles(math.rad(-30 + math.sin(-time()*8)*-20),0,-math.rad(-math.sin(time()*8/2)*20 + RLV*2)),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
		elseif Anim == "Walking" and Running == true then
			RLA =  CFrame.new(0,(0.5 + math.cos(time()*15)*0.5)*WVA+ 0.2,(0.5 - math.cos(time()*15)*0.5)*RLV+ 0.2) * CFrame.Angles(0,-math.rad(math.sin(time()*15)*80)*RLV,math.rad(math.sin(time()*15)*80)*WVA)
			LLA =  CFrame.new(0,(0.5 + math.cos(time()*15)*0.5)*WVA- 0.2,(-0.5 + math.cos(time()*15)*0.5)*RLV- 0.2) * CFrame.Angles(0,-math.rad(math.sin(time()*15)*80)*RLV,math.rad(-math.sin(time()*15)*80)*WVA)
			RAA = CFrame.new(0,0.8 + math.sin(time()*15)*0.9*WVA,math.sin(time()*15)*0.9*RLV) * CFrame.Angles(0,math.rad(-math.cos(time()*15)*85)*RLV,math.rad(math.cos(time()*15)*85)*WVA)
			LAA = CFrame.new(0,0.8 + math.sin(time()*15)*0.9*WVA,math.sin(time()*15)*0.9*-RLV) * CFrame.Angles(0,math.rad(-math.cos(time()*15)*85)*RLV,math.rad(-math.cos(time()*15)*85)*WVA)
			neck.C1 = neck.C1:Lerp(nek * CF(0,0,0) * CFA(0,math.rad(-RootPart.RotVelocity.Y*5),0),LerpStyle(0.4,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			RootPart.RootJoint.C0 = RootPart.RootJoint.C0:Lerp(root *CF((-1 - math.sin(time()*15)*2)*RLV,(-1 - math.sin(time()*15)*2)*WVA,-1 + 0.5 -math.sin(time()*15)*0.8) * CFA(math.rad(80 - math.cos(time()*15)*20),0,0),LerpStyle(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Shoulder"].C0 = tors["Right Shoulder"].C0:Lerp(rs * CF(0.6+ math.sin(time()*15)*1,0,-0.6)* RAA * CFA(math.rad(-10 - -math.cos(time()*15*2)*10),0,math.rad(80)),LerpStyle(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Left Shoulder"].C0 = tors["Left Shoulder"].C0:Lerp(ls * CF(-0.6+ -math.sin(time()*15)*1,0,-0.6) * LAA * CFA(math.rad(-10 - -math.cos(time()*15*2)*10),0,math.rad(-80)),LerpStyle(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.InOut))
			tors["Right Hip"].C0 = tors["Right Hip"].C0:Lerp(rh * CF(0.4 + -math.cos(time()*15)*0.9,0,0) * RLA * CFA(0, 0,math.rad(50)),LerpStyle(0.6,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			tors["Left Hip"].C0 = tors["Left Hip"].C0:Lerp(lh * CF(-0.4+ math.cos(time()*15)*0.9,0,0) * LLA * CFA(0, 0,math.rad(-80)),LerpStyle(0.6,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
			TailWeld.C0 = TailWeld.C0:Lerp(TC0 * CFrame.new(0,0.7,0.3) * CFrame.Angles(math.rad(-110 + math.sin(-time()*15)*-20),-math.rad(RLV*30),0),LerpStyle(0.1*1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut))
		end
	end
end



