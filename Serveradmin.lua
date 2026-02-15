

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local function FindInstance(Parent, ClassName, Name)
	for _, Instance in pairs(Parent:GetChildren()) do
		if Instance:IsA(ClassName) and Instance.Name == Name then
			return Instance
		end
	end
end

local function WaitForClass(Parent, ClassName)
	local Instance = Parent:FindFirstChildOfClass(ClassName)

	while not Instance and Parent do
		Parent.ChildAdded:Wait()
		Instance = Parent:FindFirstChildOfClass(ClassName)
	end

	return Instance
end

local function WaitForClassOfName(Parent, ...)
	local Instance = FindInstance(Parent, ...)

	while not Instance and Parent do
		Parent.ChildAdded:Wait()
		Instance = FindInstance(Parent, ...)
	end

	return Instance
end

local Fling = { }
local Aligns = { }
local Blacklist = { }
local Accessories = { }
local Attachments = { }

local Instancenew = Instance.new

local taskwait = task.wait
local taskspawn = task.spawn
local taskdefer = task.defer

local mathabs = math.abs
local mathcos = math.cos
local mathrandom = math.random

local stringmatch = string.match

local osclock = os.clock

local tableinsert = table.insert
local tableclear = table.clear
local tablefind = table.find

local CFramenew = CFrame.new
local CFrameAngles = CFrame.Angles
local CFrameidentity = CFrame.identity

local Vector3new = Vector3.new
local Vector3zero = Vector3.zero

local Sleep = CFrameidentity
local Velocity = Vector3new(0, 16384, 0)
local Angular = 0
local Linear = 0

local Workspace = game:FindFirstChildOfClass("Workspace")
local CurrentCamera = Workspace.CurrentCamera

local Players = game:FindFirstChildOfClass("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local PostSimulation = game:FindFirstChildOfClass("RunService").PostSimulation

local Character = LocalPlayer.Character
local CharacterClone = Instancenew("Model")
 
local StarterGui = game:FindFirstChildOfClass("StarterGui")
local BindableEvent = Instancenew("BindableEvent")

local UserInputService = game:FindFirstChildOfClass("UserInputService")
local UserInputType = Enum.UserInputType

local MouseButton1 = UserInputType.MouseButton1
local Touch = UserInputType.Touch

local InputBegan = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	local Type = Input.UserInputType
	
	if not GameProcessed and ( Type == MouseButton1 or Type == Touch ) then
		local Target = Mouse.Target
		if Target and not Target.Anchored and not Target:IsDescendantOf(CharacterClone) and not Target:IsDescendantOf(Character) and not tablefind(Fling, Target) then
			local Parent = Target.Parent

			if Parent:IsA("Model") and Parent ~= Character and Parent:FindFirstChildOfClass("Humanoid") then
				local HumanoidRootPart = FindInstance(Parent, "BasePart", "HumanoidRootPart") or FindInstance(Parent, "BasePart", "Torso") or FindInstance(Parent, "BasePart", "Head")

				if HumanoidRootPart and not tablefind(Fling, HumanoidRootPart) then
					tableinsert(Fling, HumanoidRootPart)
					return
				end
			end

			tableinsert(Fling, Target)
		end
	end
end)

local function Part(Name, Size)
	local Part = Instancenew("Part")
	Part.Name = Name
	Part.Size = Size
	Part.Transparency = 1
	Part.Parent = CharacterClone

	return Part
end

local function Motor6D(Name, Part0, Part1, C0, C1)
	local Motor6D = Instancenew("Motor6D")
	Motor6D.Name = Name
	Motor6D.Part0 = Part0
	Motor6D.Part1 = Part1
	Motor6D.C0 = C0
	Motor6D.C1 = C1
	Motor6D.Parent = Part0

	return Motor6D
end

local function Attachment(Name, CFrame, Parent)
	local Attachment = Instancenew("Attachment")
	Attachment.Name = Name
	Attachment.CFrame = CFrame
	Attachment.Parent = Parent

	tableinsert(Attachments, Attachment)
	return Attachment
end

local LimbSize = Vector3new(1, 2, 1)
local TorsoSize = Vector3new(2, 2, 1)

local Head = Part("Head", Vector3new(2, 1, 1))
local Torso = Part("Torso", TorsoSize)
local LeftArm = Part("Left Arm", LimbSize)
local RightArm = Part("Right Arm", LimbSize)
local LeftLeg = Part("Left Leg", LimbSize)
local RightLeg = Part("Right Leg", LimbSize)
local HumanoidRootPart = Part("HumanoidRootPart", TorsoSize)

local FakeRA = Instance.new("Part")
FakeRA.Size = Vector3.new(1,2,1)
FakeRA.Transparency = 1
FakeRA.BrickColor = BrickColor.new("Institutional White")
FakeRA.Parent = RightArm

local FRAW = Instance.new("Weld")
FRAW.Part0 = RightArm
FRAW.Part1 = FakeRA
FRAW.C0 = CFrame.new(0, 0, 0)
FRAW.Parent = RightArm

local FakeLA = Instance.new("Part")
FakeLA.Size = Vector3.new(1,2,1)
FakeLA.Transparency = 1
FakeLA.BrickColor = BrickColor.new("Institutional White")
FakeLA.Parent = LeftArm

local FLAW = Instance.new("Weld")
FLAW.Part0 = LeftArm
FLAW.Part1 = FakeLA
FLAW.C0 = CFrame.new(0, 0, 0)
FLAW.Parent = LeftArm

local Part = nil

if Character then
	Part = FindInstance(Character, "BasePart", "HumanoidRootPart") or FindInstance(Character, "BasePart", "Head") or FindInstance(Character, "BasePart", "Torso") or FindInstance(Character, "BasePart", "UpperTorso")
end

if Part then
	HumanoidRootPart.CFrame = Part.CFrame
else
	local SpawnLocations = { }

	for _, SpawnLocation in pairs(Workspace:GetDescendants()) do
		if SpawnLocation:IsA("SpawnLocation") then
			tableinsert(SpawnLocations, SpawnLocation)
		end
	end

	local Amount = # SpawnLocations

	if Amount > 0 then
		local SpawnLocation = SpawnLocations[mathrandom(1, Amount)]
		HumanoidRootPart.CFrame = SpawnLocation.CFrame * CFramenew(0, SpawnLocation.Size.Y / 2 + 3, 0)
	else
		HumanoidRootPart.CFrame = CFrameidentity
	end
end

local face = Instancenew("Decal")
face.Name = "face"
face.Parent = Head

local AccessoryTable = { 
     -- Paid --
	{ Mesh = "14241018198", Texture = "14251599953", Instance = Torso },
	{ Mesh = "14255522247", Texture = "14255543546", Instance = RightArm, CFrame = CFrameAngles(0, 1.57, 1.57) },
	{ Mesh = "14255522247", Texture = "14255543546", Instance = LeftArm, CFrame = CFrameAngles(0, - 1.57, 1.57) },
	{ Mesh = "14768684979", Texture = "14768683674", Instance = RightLeg, CFrame = CFrameAngles(0, - 1.57, 1.57) },
	{ Mesh = "14768684979", Texture = "14768683674", Instance = LeftLeg, CFrame = CFrameAngles(0, 1.57, 1.57) },
	
	-- Paid (2) --
	{ Mesh = "14241018198", Texture = "14251599953", Instance = Torso },
	{ Mesh = "12344206657", Texture = "12344206675", Instance = RightArm, CFrame = CFrameAngles(-115, 0, 0) },
	{ Mesh = "12344207333", Texture = "12344207341", Instance = LeftArm, CFrame = CFrameAngles(-115, 0, 0) },
	{ Mesh = "11159370334", Texture = "11159284657", Instance = RightLeg, CFrame = CFrameAngles(0, - 1.57, 1.57) },
	{ Mesh = "11263221350", Texture = "11263219250", Instance = LeftLeg, CFrame = CFrameAngles(0, 1.57, 1.57) },
	
	-- Free --
	{ Mesh = "4819720316", Texture = "4819722776", Instance = Torso, CFrame = CFrameAngles(0, 0, 105) },
	{ Mesh = "3030546036", Texture = "3033903209", Instance = RightArm, CFrame = CFrameAngles(-90, 0, -89.5) },
	{ Mesh = "3030546036", Texture = "3360978739", Instance = LeftArm, CFrame = CFrameAngles(-90, 0, 89.5) },
	{ Mesh = "3030546036", Texture = "3409604993", Instance = RightLeg, CFrame = CFrameAngles(-90, 0, -89.5) },
	{ Mesh = "3030546036", Texture = "3033898741", Instance = LeftLeg, CFrame = CFrameAngles(-90, 0, 89.5) },
    
    -- Temporary --
    { Mesh = "14833036921", Texture = "14833036785", Instance = FakeRA, CFrame = CFramenew(0,-2.35, -0.80) * CFrameAngles(1.85, 0, 3.15) },
}

for _, Table in pairs(AccessoryTable) do
	if type(Table.Mesh) ~= "string" then
		Table.Mesh = ""
	end
	if type(Table.Texture) ~= "string" then
		Table.Texture = ""
	end
end

Motor6D("Right Shoulder", Torso, RightArm, CFramenew(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), CFramenew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0))
Motor6D("Left Shoulder", Torso, LeftArm, CFramenew(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), CFramenew(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0))
Motor6D("Right Hip", Torso, RightLeg, CFramenew(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), CFramenew(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0))
Motor6D("Left Hip", Torso, LeftLeg, CFramenew(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), CFramenew(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0))
Motor6D("Neck", Torso, Head, CFramenew(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), CFramenew(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0))
Motor6D("RootJoint", HumanoidRootPart, Torso, CFramenew(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), CFramenew(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0))

Attachment("HairAttachment", CFramenew(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Head)
Attachment("HatAttachment", CFramenew(0, 0.600000024, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Head)
Attachment("FaceFrontAttachment", CFramenew(0, 0, -0.600000024, 1, 0, 0, 0, 1, 0, 0, 0, 1), Head)
Attachment("FaceCenterAttachment", CFramenew(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Head)
Attachment("NeckAttachment", CFramenew(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("BodyFrontAttachment", CFramenew(0, 0, -0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("BodyBackAttachment", CFramenew(0, 0, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("LeftCollarAttachment", CFramenew(-1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("RightCollarAttachment", CFramenew(1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("WaistFrontAttachment", CFramenew(0, -1, -0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("WaistCenterAttachment", CFramenew(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("WaistBackAttachment", CFramenew(0, -1, 0.5, 1, 0, 0, 0, 1, 0, 0, 0, 1), Torso)
Attachment("LeftShoulderAttachment", CFramenew(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), LeftArm)
Attachment("LeftGripAttachment", CFramenew(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), LeftArm)
Attachment("RightShoulderAttachment", CFramenew(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), RightArm)
Attachment("RightGripAttachment", CFramenew(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), RightArm)
Attachment("LeftFootAttachment", CFramenew(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), LeftLeg)
Attachment("RightFootAttachment", CFramenew(0, -1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), RightLeg)
Attachment("RootAttachment", CFramenew(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), HumanoidRootPart)

local Humanoid = Instancenew("Humanoid", CharacterClone)
Instancenew("Animator", Humanoid)

Instancenew("LocalScript", CharacterClone).Name = "Animate"

CharacterClone.PrimaryPart = Head
CharacterClone.Parent = Workspace

local function DescendantAdded(Instance)
	if Instance:IsA("Accessory") then
		taskspawn(function()
			local Handle = WaitForClassOfName(Instance, "BasePart", "Handle")
			local Attachment = WaitForClass(Handle, "Attachment")

			local Clone = Instance:Clone()

			local CloneHandle = FindInstance(Clone, "BasePart", "Handle")
			CloneHandle.Transparency = 1
			CloneHandle:BreakJoints()

			local AccessoryWeld = Instancenew("Weld")
			AccessoryWeld.Name = "AccessoryWeld"
			AccessoryWeld.Part0 = CloneHandle
			AccessoryWeld.C0 = Attachment.CFrame

			local Name = Attachment.Name

			for _, TableAttachment in pairs(Attachments) do
				if TableAttachment.Name == Name then
					AccessoryWeld.Part1 = TableAttachment.Parent
					AccessoryWeld.C1 = TableAttachment.CFrame
				end
			end

			AccessoryWeld.Parent = CloneHandle
			Clone.Parent = CharacterClone

			tableinsert(Accessories, Clone)

			local IsAMeshPart = CloneHandle:IsA("MeshPart")
			local Mesh = IsAMeshPart and CloneHandle or WaitForClass(CloneHandle, "SpecialMesh")
			local Id = IsAMeshPart and "TextureID" or "TextureId"

			for _, Table in pairs(AccessoryTable) do
				local Instance = Table.Instance

				if Instance then
					if stringmatch(Mesh.MeshId, Table.Mesh) and stringmatch(Mesh[Id], Table.Texture) and not tablefind(Blacklist, Instance) then
						tableinsert(Blacklist, Instance)
						tableinsert(Aligns, { Handle, Instance, Table.CFrame or CFrameidentity })
						return
					end
				end
			end

			tableinsert(Aligns, { Handle, CloneHandle, CFrameidentity })
		end)
	elseif Instance:IsA("JointInstance") then
		taskspawn(function()
			taskwait()
			Instance:Destroy()
		end)
	end
end

local function CharacterAdded(Character)
	if Character ~= CharacterClone then		
		PostSimulation:Wait()

		local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack")

		if Backpack then
			Backpack:ClearAllChildren()
		end

		tableclear(Aligns)
		tableclear(Blacklist)

		for _, Accessory in pairs(Accessories) do
			Accessory:Destroy()
		end

		local CurrentCameraCFrame = CurrentCamera.CFrame

		LocalPlayer.Character = CharacterClone
		CurrentCamera.CameraSubject = CharacterClone.Head

		taskspawn(function()
			CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
			CurrentCamera.CFrame = CurrentCameraCFrame
		end)

		local CharacterHumanoidRootPart = WaitForClassOfName(Character, "BasePart", "HumanoidRootPart")

		for Index, Value in pairs(Fling) do
			local BasePart = nil

			if typeof(Value) == "Instance" then 
				if Value:IsA("BasePart") then
					BasePart = Value
				elseif Value:IsA("Humanoid") then
					local Model = Value.Parent

					if Model ~= Character and Model:IsA("Model") then
						BasePart = FindInstance(Model, "BasePart", "HumanoidRootPart") or FindInstance(Model, "BasePart", "Head") or Model:FindFirstChildOfClass("BasePart")
					end
				elseif Value:IsA("Model") and Value ~= Character then
					BasePart = FindInstance(Value, "BasePart", "HumanoidRootPart") or FindInstance(Value, "BasePart", "Head") or Value:FindFirstChildOfClass("BasePart")
				end
			end

			if BasePart then
				local clock = osclock()

				while CharacterHumanoidRootPart and BasePart and osclock() - clock <= 1 and BasePart.AssemblyLinearVelocity.Magnitude <= 60 do
					CharacterHumanoidRootPart.AssemblyAngularVelocity = Velocity
					CharacterHumanoidRootPart.AssemblyLinearVelocity = Velocity

					CharacterHumanoidRootPart.CFrame = BasePart.CFrame + Vector3new(0, - 1, 0)
					PostSimulation:Wait()
				end
			end
		end

		tableclear(Fling)

		if CharacterHumanoidRootPart then
			CharacterHumanoidRootPart.AssemblyAngularVelocity = Vector3zero
			CharacterHumanoidRootPart.AssemblyLinearVelocity = Vector3zero

			CharacterHumanoidRootPart.CFrame = CFramenew(HumanoidRootPart.Position + Vector3new(mathrandom(- 32, 32), 0, mathrandom(- 32, 32)))
			PostSimulation:Wait()
		end

		Character:BreakJoints()

		for _, Instance in pairs(Character:GetDescendants()) do
			DescendantAdded(Instance)
		end

		Character.DescendantAdded:Connect(DescendantAdded)
	end
end

local function Align(Part0, Part1, CFrame)
	if Part0.ReceiveAge == 0 and not Part0.Anchored and # Part0:GetJoints() == 0 then
		Part0.AssemblyAngularVelocity = Vector3new(0, Angular, 0)

		local Part1CFrame = Part1.CFrame
		local LinearVelocity = Part1.AssemblyLinearVelocity * Linear
		local Magnitude = LinearVelocity.Magnitude < Linear

		if Magnitude then
			local LookVector = Part1CFrame.LookVector * Linear
			Part0.AssemblyLinearVelocity = Vector3new(LookVector.X, Linear, LookVector.Z)
		else
			Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Linear, LinearVelocity.Z)
		end

		Part0.CFrame = Part1CFrame * ( Magnitude and Sleep or CFrameidentity ) * CFrame
	end
end

if Character then
	CharacterAdded(Character)
end

local Added = LocalPlayer.CharacterAdded:Connect(CharacterAdded)

local Connection = game:FindFirstChildOfClass("RunService").PostSimulation:Connect(function()
	local osclock = osclock()
	local Axis = 0.004 * mathcos(osclock * 17.5)

	Sleep = CFramenew(0, Axis, 0)
	Angular = mathcos(osclock)
	Linear = 26

	for _, Table in pairs(Aligns) do
		Align(Table[1], Table[2], Table[3])
	end

	if sethiddenproperty then
		sethiddenproperty(LocalPlayer, "SimulationRadius", 10000000)
	end

	StarterGui:SetCore("ResetButtonCallback", BindableEvent) -- This is if it gets overriden, just like in MyWorld testing place.
end)

local function Event()
	CharacterClone:Destroy()
end

BindableEvent.Event:Connect(Event)

CharacterClone:GetPropertyChangedSignal("Parent"):Connect(function()
	if not CharacterClone.Parent then
		Added:Disconnect()
		Connection:Disconnect()

		CharacterClone:Destroy()

		if BindableEvent then
			BindableEvent:Destroy()
		end

		StarterGui:SetCore("ResetButtonCallback", true)
	end
end)

BindableEvent:GetPropertyChangedSignal("Parent"):Connect(Event)

Player = game.Players.LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Character = Player.Character
Humanoid = Character.Humanoid
RootPart = Character.HumanoidRootPart
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
Mouse = Player:GetMouse()

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
local SC = false

--//=================================\\
--\\=================================//


--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
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

--//=================================\\
--\\=================================//

--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local function weldBetween(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end

function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end

function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "rbxassetid://"..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.CFrame = CF(EFFECT.Position)*ANGLES(RAD(ORI.X),RAD(ORI.Y),RAD(ORI.Z))
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	local Ignore = ((type(Ignore) == "table" and Ignore) or {Ignore})
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, DIRECTION * Distance), Ignore)
end

--Debree({Delay = 1.5,Variant = "",Location = Torso.Position,Color = C3(1,1,1),Size = 1,Distance = 1,Material = "Slate",Scatter = 1,Amount = 1,DebreeCount = 1})
function Debree(Table)
	local KindOf = (Table.Variant or "Ring")
	local Position = (Table.Location or Torso.Position)
	local Coloration = (Table.Color or C3(1,1,1))
	local Texture = (Table.Material or "Slate")
	local Fling = (Table.Scatter or 1)
	local Number = (Table.Amount or 1)
	local Rocks = (Table.DebreeCount or 1)
	local Range = (Table.Distance or 1)
	local Scale = (Table.Size or 1)
	local Timer = (Table.Delay or 1.5)
	coroutine.resume(coroutine.create(function()
		local ScaleVector = VT(Scale,Scale,Scale)
		local Boulders = {}
		Position = CF(Position)
		if KindOf == "Ring" or KindOf == "Both" then
			for RockValue = 1, Number do
				local LOCATION = Position * ANGLES(RAD(0), RAD((360/Number)*RockValue), RAD(0))*CF(0,MRANDOM(-math.ceil(Scale/4),math.ceil(Scale/4)),Range)
				local BOULDER = CreatePart(3, workspace, Texture, 0, 0, BRICKC("Pearl"), "Debree", ScaleVector, true)
				BOULDER.CanCollide = true
				BOULDER.CFrame = LOCATION*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				BOULDER.Color = Coloration
				table.insert(Boulders,BOULDER)
			end
		end
		if KindOf == "Loose" or KindOf == "Both" then
			for RockValue = 1, Rocks do
				local LOCATION = Position * ANGLES(RAD(0), RAD((360/Number)*RockValue), RAD(0))*CF(0,MRANDOM(-math.ceil(Scale-(Scale/2)),math.ceil(Scale-(Scale/2))),0.7)
				local BOULDER = CreatePart(3, workspace, Texture, 0, 0, BRICKC("Pearl"), "Debree", ScaleVector, false)
				BOULDER.CanCollide = true
				BOULDER.CFrame = LOCATION*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				BOULDER.Velocity = CF(BOULDER.Position-VT(0,4,0),BOULDER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,5,0).p).lookVector*MRANDOM(Fling-(Fling/1.5),Fling+(Fling/1.5))
				BOULDER.Color = Coloration
				table.insert(Boulders,BOULDER)
			end
		end
		if KindOf == "Random" then
			for RockValue = 1, Number do
				local LOCATION = Position * ANGLES(RAD(0), RAD((360/Number)*RockValue), RAD(0))*CF(0,MRANDOM(-math.ceil(Scale/4),math.ceil(Scale/4)),MRANDOM(0,Range))
				local BOULDER = CreatePart(3, workspace, Texture, 0, 0, BRICKC("Pearl"), "Debree", ScaleVector, true)
				BOULDER.CanCollide = true
				BOULDER.CFrame = LOCATION*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				BOULDER.Color = Coloration
				table.insert(Boulders,BOULDER)
			end
		end
		wait(Timer)
		for E = 1, 45 do
			Swait()
			for A = 1, #Boulders do
				Boulders[A].Transparency = Boulders[A].Transparency + 1/45
			end
		end
		for A = 1, #Boulders do
			Boulders[A]:Destroy()
		end
	end))
end

--//=================================\\
--||	   MUSIC AND COLORS
--\\=================================//

local BASECOLOR = C3(0,0,0)
local BMUSIC = IT("Sound",RootPart)
local VOLUME = 1
local PITCH = 1
local SONGID = 1442022177
local PLAYING = false
local INTRO = false
local SCREENS = {}
local SCREENWELDS = {}
local GUISTEXT = {}

--//=================================\\
--||			DAMAGING
--\\=================================//

function ApplyDamage(Humanoid,Damage)
end

function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
end

--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

local GLASSESWLD = nil
function IntroThing()
	ATTACK = true
	Rooted = true
	RootJoint.C0 = CF(0,250,0)
	CONNECT = Mouse.KeyDown:connect(function(NEWKEY)
		local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
		if HITFLOOR then
			CONNECT:Disconnect()
			local SOUND = CreateSound(606241996, Effects, 5, 1)
			coroutine.resume(coroutine.create(function()
				repeat Swait() SOUND.Parent = Effects until SOUND.Playing == false
				PLAYING = true
			end))
			for i=0, 0.4, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.31, -0.65 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(60), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0.5, -1.4) * ANGLES(RAD(65), RAD(0), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(-35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3 - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(20), RAD(90), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.1 - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(60), RAD(-90), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			for i = 1, 3 do
				WACKYEFFECT({EffectType = "Wave", Size = VT(0,5,0), Size2 = VT(i*12,5,i*12), Transparency = 0.6, Transparency2 = 1, CFrame = CF(HITPOS) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(MRANDOM(-5,5))), MoveToPos = nil, RotationX = 0.1, RotationY = 1, RotationZ = -0.1, Material = "Neon", Color = C3(1,1,1), SoundID = 765590102, SoundPitch = MRANDOM(5,15)/10, SoundVolume = 5, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
			end
			Debree({Delay = 4,Variant = "Ring",Location = HITPOS,Color = HITFLOOR.Color,Size = 3,Distance = 15,Material = HITFLOOR.Material,Scatter = 1,Amount = 30,DebreeCount = 8})
			for i=0, 0.85, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.31, -0.65 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(60), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0.5, -1.4) * ANGLES(RAD(65), RAD(0), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(-35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3 - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(20), RAD(90), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.1 - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(60), RAD(-90), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			for i=0, 1, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -0.31, -0.65 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(60), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-50 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.2 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0.5, -1.4) * ANGLES(RAD(65), RAD(0), RAD(-15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(-35)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3 - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(20), RAD(90), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.1 - 0.05 * COS(SINE / 12), -0.4) * ANGLES(RAD(60), RAD(-90), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			for i=0, 1, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(45), RAD(0), RAD(-45)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25, 0.5, 0.7) * ANGLES(RAD(-45), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			local GLASSES = CreatePart(3, Character, "Fabric", 0, 0, BRICKC("Pearl"), "Glasses", VT(0,0,0), false)
			CreateMesh("SpecialMesh", GLASSES, "FileMesh", "1577360", "1577349", VT(1, 1.3, 1), VT(0,0,0))
			local HELDWELD = CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, GLASSES, CF(0,-1.4,0) * ANGLES(RAD(90), RAD(0), RAD(180)), CF(0,0,0))
			CreateSound(147722227, GLASSES, 2, 1.3, false)
			for i=0, 0.25, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(45), RAD(0), RAD(-35)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.45, -0.1) * ANGLES(RAD(30), RAD(-5), RAD(35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			for i=0, 0.3, 0.1 / Animation_Speed do
				Swait()
				HELDWELD.C1 = Clerp(HELDWELD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(-35)), 0.1)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25, 0.2, -0.8) * ANGLES(RAD(160), RAD(-5), RAD(-46)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.15, -0.3) * ANGLES(RAD(160), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			HELDWELD.Part0 = Head
			HELDWELD.Parent = Head
			HELDWELD.C0 = CF(0,0.1,-0.15)
			HELDWELD.C1 = CF(0,0,0)
			for i = 1, 3 do
				for i=0, 0.4, 0.1 / Animation_Speed do
					Swait()
					HELDWELD.C1 = Clerp(HELDWELD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(-5)), 0.25)
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25, 0.2, -0.3) * ANGLES(RAD(160), RAD(-5), RAD(-12)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.1, -0.3) * ANGLES(RAD(160), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
				for i=0, 0.4, 0.1 / Animation_Speed do
					Swait()
					HELDWELD.C1 = Clerp(HELDWELD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(5)), 0.25)
					RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25, 0.1, -0.3) * ANGLES(RAD(160), RAD(-5), RAD(-12)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.2, -0.3) * ANGLES(RAD(160), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
					RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
					LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				end
			end
			for i = 1, 4 do
				Swait()
				local SCREEN = CreatePart(3, Effects, "Neon", 0, 1, BRICKC("Cyan"), "SCREEN", VT(2.5,0.8,0)*2, false)
				local SCREENWELD = CreateWeldOrSnapOrMotor("Weld", RootPart, RootPart, SCREEN, CF(0,0,0) * ANGLES(RAD(0),RAD((360/6)*i),RAD(0)) * CF(0,0,3+(i/1.5)), CF(0,0,0))
				table.insert(SCREENS,SCREEN)
				table.insert(SCREENWELDS,SCREENWELD)
				local GUI = IT("SurfaceGui",SCREEN)
				for i = 1, 5 do
					local SCREENFRAME = CreateFrame(GUI, 1, 2, UD2(0, 0, ((1/5)*i)-1/5, 0), UD2(1, 0, 1/5, 0), C3(0,0,0), C3(0,0,0), "TESTING.exe")
					local TEXT = CreateLabel(SCREENFRAME, "[BOOTING UP...]", C3(1,1,1), Enum.FontSize.Size48, "Code", 0.5, 1, 1, "RunningTests")
					TEXT.TextXAlignment = "Left"
					TEXT.TextWrapped = true
					table.insert(GUISTEXT,TEXT)
				end
			end
			for i=0, 1, 0.1 / Animation_Speed do
				Swait()
				HELDWELD.C1 = Clerp(HELDWELD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(0)), 0.4)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0.15, -0.25) * ANGLES(RAD(160), RAD(-5), RAD(12)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.35, 0.15, -0.25) * ANGLES(RAD(160), RAD(5), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			for i=0, 0.1, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(-5), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
			GLASSESWLD = HELDWELD
			ATTACK = false
			Rooted = false
		end
	end)
end
function Screening(Text,FinishesMoveEnd,WaitTillFinished)
	local SCREEN = CreatePart(3, Effects, "Neon", 0, 1, BRICKC("Cyan"), "SCREEN", VT(2.5,0.8,0)*1.5, false)
	local SCREENWELD = CreateWeldOrSnapOrMotor("Weld", RootPart, RootPart, SCREEN, CF(0,0,0) * ANGLES(RAD(-12),RAD(180),RAD(0)) * CF(0,0,1.5), CF(0,0,0))
	local GUI = IT("SurfaceGui",SCREEN)
	local SCREENFRAME = CreateFrame(GUI, 1, 2, UD2(0, 0, 0, 0), UD2(1, 0, 1, 0), C3(0,0,0), C3(0,0,0), "TESTING.exe")
	local TEXT = CreateLabel(SCREENFRAME, Text, C3(1,1,1), Enum.FontSize.Size48, "Code", 0.5, 1, 1, "RunningTests")
	TEXT.TextScaled = true
	coroutine.resume(coroutine.create(function()
		coroutine.resume(coroutine.create(function()
			for i = 1, 5 do
				Swait()
				SCREEN.Transparency = SCREEN.Transparency - 0.1/5
			end
		end))
		if WaitTillFinished == false then
			for i=0, 1.7, 0.1 / Animation_Speed do
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 7 * COS(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3, 0.45 + 0.1 * COS(SINE / 12), -0.2) * ANGLES(RAD(45), RAD(0), RAD(-15)) * ANGLES(RAD(0), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-44 - 1.5 * COS(SINE / 12)), RAD(0), RAD(45)) * ANGLES(RAD(0), RAD(-25), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
		elseif WaitTillFinished == true then
			repeat
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 7 * COS(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3, 0.45 + 0.1 * COS(SINE / 12), -0.2) * ANGLES(RAD(45), RAD(0), RAD(-15)) * ANGLES(RAD(0), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-44 - 1.5 * COS(SINE / 12)), RAD(0), RAD(45)) * ANGLES(RAD(0), RAD(-25), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			until ATTACK == false
		end
		coroutine.resume(coroutine.create(function()
			SCREENWELD:Remove()
			SCREEN.Anchored = true
			for i = 1, 5 do
				Swait()
				SCREEN.Transparency = SCREEN.Transparency + 0.1/5
			end
			SCREEN:Remove()
		end))
		if FinishesMoveEnd == true then
			ATTACK = false
			Rooted = false
		end
	end))
	return SCREEN,TEXT
end
local Fling = function()
	ATTACK = true
	Rooted = false
	Screening(";Fling",true,false)
	wait(0.25)
	RightShoulder.C0 = RightShoulder.C0 * CF(0,-0.12,0)
	CreateSound(138204323, RightArm, 2, 1.3, false)
	local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	if HITFLOOR then
		Debree({Delay = 4,Variant = "Ring",Location = HITPOS,Color = HITFLOOR.Color,Size = 4,Distance = 75,Material = HITFLOOR.Material,Scatter = 1,Amount = MRANDOM(75,85),DebreeCount = 8})
	end
	ApplyAoE(RootPart.Position-VT(0,4,0),75,5,12,550,false)
	WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(0,0,0), Size2 = VT(150,150,150), Transparency = 0.75, Transparency2 = 1, CFrame = CF(RootPart.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = 610359590, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 5})
end
local TpTo = function()
	ATTACK = true
	Rooted = true
	local SCR, TEXT = Screening("",false,true)
	for i = 1, 35 do
		Swait()
		local TPSPOT = "TPTO: ["..math.ceil(Mouse.Hit.p.X).."."..math.ceil(Mouse.Hit.p.Y+3.15).."."..math.ceil(Mouse.Hit.p.Z).."]"
		TEXT.Text = TPSPOT
	end
	RightShoulder.C0 = RightShoulder.C0 * CF(0,-0.12,0)
	CreateSound(138204323, RightArm, 2, 1.3, false)
	CreateSound(1127492102, Torso, 2, 1, false)
	RootPart.CFrame = CF(Mouse.Hit.p+VT(0,3.15,0)) * ANGLES(RAD(0), RAD(RootPart.Orientation.Y), RAD(0))
	wait(0.1)
	ATTACK = false
	Rooted = false
end
local Hurl = function()
	ATTACK = true
	Rooted = false
	local SCREEN = CreatePart(3, Effects, "Neon", 0, 1, BRICKC("Cyan"), "SCREEN", VT(2.5,0.8,0)*1.5, false)
	local SCREENWELD = CreateWeldOrSnapOrMotor("Weld", RootPart, RootPart, SCREEN, CF(0,0,0) * ANGLES(RAD(-12),RAD(180),RAD(0)) * CF(0,0,1.5), CF(0,0,0))
	local GUI = IT("SurfaceGui",SCREEN)
	local SCREENFRAME = CreateFrame(GUI, 1, 2, UD2(0, 0, 0, 0), UD2(1, 0, 1, 0), C3(0,0,0), C3(0,0,0), "TESTING.exe")
	local TEXT = CreateLabel(SCREENFRAME, "[COLLECTING DEBREE]", C3(1,1,1), Enum.FontSize.Size48, "Code", 0.5, 1, 1, "RunningTests")
	local ROCKS = {}
	coroutine.resume(coroutine.create(function()
		for i = 1, 5 do
			Swait()
			SCREEN.Transparency = SCREEN.Transparency - 0.1/5
		end
	end))
	for i = 1, 12 do
		local SPOT = CF(RootPart.Position) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0)) * CF(0,0,MRANDOM(4,15))
		local HITFLOOR,HITPOS = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
		if HITFLOOR then
			coroutine.resume(coroutine.create(function()
				local BOULDER = CreatePart(3, Effects, HITFLOOR.Material, 0, 0, BRICKC("Cyan"), "Debree", VT(1,1,1)*(MRANDOM(5,25)/10), true)
				BOULDER.Color = HITFLOOR.Color
				BOULDER.CFrame = CF(HITPOS-VT(0,5,0)) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))
				local CFRAME = SPOT*CF(0,MRANDOM(7,12),0)
				table.insert(ROCKS,BOULDER)
				for i = 1, 35 do
					Swait()
					BOULDER.CFrame = Clerp(BOULDER.CFrame,CFRAME,0.1)
				end
			end))
		end
	end
	for i=0, 1.7, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 7 * COS(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3, 0.75 + 0.1 * COS(SINE / 12), -0.1) * ANGLES(RAD(145), RAD(0), RAD(-15)) * ANGLES(RAD(0), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-44 - 1.5 * COS(SINE / 12)), RAD(0), RAD(45)) * ANGLES(RAD(0), RAD(-25), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	if #ROCKS > 0 then
		TEXT.Text = "[HURLING DEBREE]"
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 2
		GYRO.P = 20000
		GYRO.MaxTorque = VT(0,4000000,0)
		GYRO.CFrame = CF(RootPart.Position,Mouse.Hit.p)
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				GYRO.CFrame = CF(RootPart.Position,Mouse.Hit.p)
			until ATTACK == false
			GYRO:Remove()
		end))
		local THROWING = true
		coroutine.resume(coroutine.create(function()
			repeat
				Swait()
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(25)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15 - 7 * COS(SINE / 12)), RAD(0), RAD(-25)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3, 0.45 + 0.1 * COS(SINE / 12), -0.2) * ANGLES(RAD(90), RAD(0), RAD(25)) * ANGLES(RAD(0), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3, 0.45 + 0.1 * COS(SINE / 12), -0.2) * ANGLES(RAD(44 - 1.5 * COS(SINE / 12)), RAD(0), RAD(25)) * ANGLES(RAD(0), RAD(-25), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(50), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-100), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			until THROWING == false
		end))
		for E = 1, #ROCKS do
			wait(0.05)
			local ROCK = ROCKS[E]
			coroutine.resume(coroutine.create(function()
				ROCK.CFrame = CF(ROCK.Position,Mouse.Hit.p)
				CreateSound(147722227, ROCK, 2, 1.3, false)
				local KILL = false
				for i = 1, 70 do
					Swait()
					for i = 1, 4 do
						ROCK.CFrame = ROCK.CFrame * CF(0,0,-ROCK.Size.Z/2)
						local HIT,POS,NORMAL = Raycast(ROCK.Position,ROCK.CFrame.lookVector,ROCK.Size.Z/1.5,Character)
						if HIT then
							KILL = true
							CreateSound(174580476, ROCK, 2, 1.6, false)
							ApplyAoE(ROCK.Position,6*ROCK.Size.Z,25,35,12,false)
							for E = 1, 2 do
								for i = 1, 4 do
									WACKYEFFECT({Time = 50, EffectType = "Round Slash", Size = VT(0,0,0), Size2 = (VT(E,0,E)/15)*ROCK.Size.Z, Transparency = 0.8, Transparency2 = 1, CFrame = CF(ROCK.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 10})
								end
							end
							Debree({Delay = 0.8,Variant = "Loose",Location = ROCK.Position,Color = ROCK.Color,Size = ROCK.Size.Z/3,Distance = 75,Material = ROCK.Material,Scatter = 35,Amount = MRANDOM(75,85),DebreeCount = 8})
							break
						else
							WACKYEFFECT({Time = 6, EffectType = "Wave", Size = VT(0,0,0), Size2 = VT(3,1,3)*ROCK.Size.Z, Transparency = 0.97, Transparency2 = 1, CFrame = ROCK.CFrame*CF(0,0,-ROCK.Size.Z/2) * ANGLES(RAD(90), RAD(MRANDOM(0,360)), RAD(MRANDOM(-5,5))), MoveToPos = nil, RotationX = MRANDOM(-1,1), RotationY = MRANDOM(-1,1), RotationZ = MRANDOM(-1,1), Material = "Neon", Color = BRICKC"Cyan".Color, SoundID = nil, SoundPitch = MRANDOM(5,15)/10, SoundVolume = 5, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 25})
						end
					end
					if KILL == true then
						break
					end
				end
				ROCK.Transparency = 1
				Debris:AddItem(ROCK,5)
			end))
			wait(0.05)
		end
		THROWING = false
	end
	coroutine.resume(coroutine.create(function()
		SCREENWELD:Remove()
		SCREEN.Anchored = true
		for i = 1, 5 do
			Swait()
			SCREEN.Transparency = SCREEN.Transparency + 0.1/5
		end
		SCREEN:Remove()
	end))
	ATTACK = false
	Rooted = false
end
local Kill = function()
	local TARGET = Mouse.Target
	if TARGET ~= nil then
		if TARGET.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM = TARGET.Parent:FindFirstChildOfClass("Humanoid")
			local ROOT = HUM.Parent:FindFirstChild("HumanoidRootPart") or HUM.Parent:FindFirstChild("Torso")
			if ROOT and HUM.Health > 0 then
				local FOE = ROOT.Parent
				ATTACK = true
				Rooted = false
				Screening(";Kill",true,false)
				wait(0.25)
				RightShoulder.C0 = RightShoulder.C0 * CF(0,-0.12,0)
				CreateSound(138204323, RightArm, 2, 1.3, false)
				for index, CHILD in pairs(FOE:GetChildren()) do
					if CHILD:IsA("BasePart") then
						if CHILD.Name == "Head" then
							WACKYEFFECT({Time = MRANDOM(10,30), EffectType = "Box", Size = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z), Size2 = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z)*2, Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, SizeBoomerang = 0, Boomerang = 50})
						elseif CHILD.Name ~= "HumanoidRootPart" then
							WACKYEFFECT({Time = MRANDOM(10,30), EffectType = "Box", Size = CHILD.Size, Size2 = CHILD.Size*2, Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, SizeBoomerang = 0, Boomerang = 35})
						end
					end
				end
			end
		end
	end
end
local ATTAC = function()
	ATTACK = true
	Rooted = false
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(-5), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(5), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end
local LITTLEIDLE = false
function UniqueIdleAnimation()
	coroutine.resume(coroutine.create(function()
		for i=0, 0.1, 0.1 / Animation_Speed do
			Swait()
			if ATTACK == true or ANIM ~= "Idle" then
				break
			end
			GLASSESWLD.C1 = Clerp(GLASSESWLD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(0)), 0.25)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-45 - 1.5 * COS(SINE / 12)), RAD(0), RAD(-45)) * ANGLES(RAD(0), RAD(25), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.1, -0.3) * ANGLES(RAD(80), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 0.4, 0.1 / Animation_Speed do
			Swait()
			if ATTACK == true or ANIM ~= "Idle" then
				break
			end
			GLASSESWLD.C1 = Clerp(GLASSESWLD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(0)), 0.25)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-45 - 1.5 * COS(SINE / 12)), RAD(0), RAD(-45)) * ANGLES(RAD(0), RAD(25), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.1, -0.3) * ANGLES(RAD(160), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 1.3, 0.1 / Animation_Speed do
			Swait()
			if ATTACK == true or ANIM ~= "Idle" then
				break
			end
			GLASSESWLD.C1 = Clerp(GLASSESWLD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(5)), 0.2 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-45 - 1.5 * COS(SINE / 12)), RAD(0), RAD(-45)) * ANGLES(RAD(0), RAD(25), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.15, -0.3) * ANGLES(RAD(160), RAD(5), RAD(12)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			if ATTACK == true or ANIM ~= "Idle" then
				break
			end
			GLASSESWLD.C1 = Clerp(GLASSESWLD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(0)), 1 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-45 - 1.5 * COS(SINE / 12)), RAD(0), RAD(-45)) * ANGLES(RAD(0), RAD(25), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.05, -0.3) * ANGLES(RAD(160), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 0.1, 0.1 / Animation_Speed do
			Swait()
			if ATTACK == true or ANIM ~= "Idle" then
				break
			end
			GLASSESWLD.C1 = Clerp(GLASSESWLD.C1, CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(0)), 0.25)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-45 - 1.5 * COS(SINE / 12)), RAD(0), RAD(-45)) * ANGLES(RAD(0), RAD(25), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.1, -0.3) * ANGLES(RAD(80), RAD(5), RAD(12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		LITTLEIDLE = false
	end))
end

local COLOR = C3(1,1,1)
local SKILLFONT = "Legacy"
local SIZE = 2.5
local MOUSE = 2097542191
local MELEE = 2097543015
local BODY = 2097543382
local PROJECTILE = 2097544084
local AOE = 2097544884
local ULTIMATE = 2097545381

local ATTACKS = {{"Switch ScreenBehaviour","m"},{";Fling","z",AOE,Fling},{";TpTo","x",BODY,TpTo},{";Hurl","c",PROJECTILE,Hurl},{";Kill","v",MOUSE,Kill}}
local GUIS = {}

for i = 1, #ATTACKS do
	local SKILLFRAME = CreateFrame(WEAPONGUI, 0.8, 2, UD2(1-(0.3*(SIZE/5)), 0, 1-((0.08*(SIZE/5))*i), 0), UD2(0.3*(SIZE/5), 0, 0.06*(SIZE/4), 0), C3(0,0,0), COLOR, "Skill Frame")
	local SKILLTEXT = CreateLabel(SKILLFRAME, "["..ATTACKS[i][1].."]", COLOR, SIZE, SKILLFONT, 0, 2, 0, "Skill text")
	SKILLTEXT.TextXAlignment = "Right"
	local BUTTONDISPLAY = CreateLabel(SKILLFRAME, "["..string.upper(ATTACKS[i][2]).."]", COLOR, SIZE-1, SKILLFONT, 0, 2, 0, "Skill text")
	BUTTONDISPLAY.TextXAlignment = "Left"
	if ATTACKS[i][3] then
		local IMAGETODISPLAY = IT("ImageLabel",SKILLFRAME)
		IMAGETODISPLAY.Image = "rbxassetid://"..ATTACKS[i][3]
		IMAGETODISPLAY.Size = UD2(0.2,0,1,0)
		IMAGETODISPLAY.Position = UD2(0.065,0,0,0)
		IMAGETODISPLAY.BackgroundTransparency = 1
		IMAGETODISPLAY.ZIndex = 0
	end
	table.insert(GUIS,SKILLTEXT)
end

Mouse.Button1Down:connect(function(NEWKEY)

end)
Mouse.Button1Up:connect(function(NEWKEY)

end)
Mouse.KeyDown:connect(function(NEWKEY)
	KEYHOLD = true
	if NEWKEY == "m" then
		if SC == false then
			SC = true
		else
			SC = false
		end
	end
	if ATTACK == false then
		for E = 1, #ATTACKS do
			if ATTACKS[E][4] ~= nil then
				if NEWKEY == ATTACKS[E][2] then
					ATTACKS[E][4]()
				end
			end
		end
	end
end)
Mouse.KeyUp:connect(function(NEWKEY)
	KEYHOLD = false
end)

function unanchor()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c ~= RootPart then
			c.Anchored = false
		end
	end
	if UNANCHOR == true then
		RootPart.Anchored = false
	else
		RootPart.Anchored = true
	end
end

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

local MOVINGSCREENS = false
local TIMESTAMP = 0
while true do
	Swait()
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
		v:Stop();
	end
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	local WALKSPEEDVALUE = 8 / (Humanoid.WalkSpeed / 16)
	if ANIM == "Walk" and TORSOVELOCITY > 1 then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0.1 * COS(SINE / (WALKSPEEDVALUE/2))) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 0.875 - 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0.25 * SIN(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10+50 * COS(SINE / WALKSPEEDVALUE))), 0.6 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 0.875 + 0.125 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.25 * SIN(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-10+50 * COS(SINE / WALKSPEEDVALUE))), 0.6 / Animation_Speed)
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.7 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.7 / Animation_Speed)
	end
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(25 + 10 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(-25 - 10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4, -0.6) * ANGLES(RAD(1), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(45 + 10 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(-45 - 10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.7) * ANGLES(RAD(-25 + 5 * SIN(SINE / 12)), RAD(90), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.8, -0.3) * ANGLES(RAD(-10), RAD(-80), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		if ATTACK == false then
			if MRANDOM(1,650) == 1 and LITTLEIDLE == false then
				LITTLEIDLE = true
				UniqueIdleAnimation()
			end
			if LITTLEIDLE == false then
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * COS(SINE / 24), 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0 - 2.5 * COS(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(3 - 7 * COS(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-45 - 1.5 * COS(SINE / 12)), RAD(0), RAD(-45)) * ANGLES(RAD(0), RAD(25), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.1, 0.35 + 0.1 * COS(SINE / 12), 0.2) * ANGLES(RAD(-44 - 1.5 * COS(SINE / 12)), RAD(0), RAD(45)) * ANGLES(RAD(0), RAD(-25), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 + 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-2 - 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.035 * COS(SINE / 24) - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(-2 + 2.5 * COS(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.05) * ANGLES(RAD(5), RAD(0), RAD(-7 * COS(SINE / (WALKSPEEDVALUE)))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(7 * COS(SINE / (WALKSPEEDVALUE)))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(60 * COS(SINE / WALKSPEEDVALUE)), RAD(-5), RAD(5)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-60 * COS(SINE / WALKSPEEDVALUE)), RAD(5), RAD(-5)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-85), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
	end
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	BMUSIC.SoundId = "rbxassetid://"..SONGID
	BMUSIC.Looped = true
	BMUSIC.Pitch = PITCH
	BMUSIC.Volume = VOLUME
	BMUSIC.Playing = PLAYING
	BMUSIC.EmitterSize = 50
	if BMUSIC.Parent ~= RootPart then
		print("Fixing music")
		BMUSIC = IT("Sound",RootPart)
		BMUSIC.SoundId = "rbxassetid://"..SONGID
		BMUSIC.Looped = true
		BMUSIC.Pitch = PITCH
		BMUSIC.Volume = VOLUME
		BMUSIC.Playing = true
		BMUSIC.EmitterSize = 50
		BMUSIC.TimePosition = TIMESTAMP
		FIXING = true
	else
		if FIXING == false then
			TIMESTAMP = BMUSIC.TimePosition
		else
			FIXING = false
		end
	end
	if Head:FindFirstChild("face") then
		Head.face.Texture = "rbxassetid://62682458"
	end
	if INTRO == false and ATTACK == false then
		INTRO = true
		coroutine.resume(coroutine.create(function()
			IntroThing()
		end))
	end
	if #SCREENS > 0 then
		for E = 1, #SCREENS do
			SCREENS[E].Transparency = MRANDOM(90,99)/100
		end
	end
	if #SCREENWELDS > 0 then
		if SC == true then
			if MRANDOM(1,75) == 1 and MOVINGSCREENS == false then
				MOVINGSCREENS = true
				coroutine.resume(coroutine.create(function()
					wait(1)
					MOVINGSCREENS = false
				end))
				for E = 1, #SCREENWELDS do
					coroutine.resume(coroutine.create(function()
						local MATH1 = MRANDOM(-25,25)/10+1
						local MATH2 = MRANDOM(-45,45)
						for i = 1, 55 do
							Swait()
							SCREENWELDS[E].C0 = Clerp(SCREENWELDS[E].C0, CF(0,MATH1,0) * ANGLES(RAD(0), RAD(MATH2+180), RAD(0)) * CF(0,0,3+(E/1.5)),0.1)
						end
					end))
				end
			end
		elseif SC == false then
			for E = 1, #SCREENWELDS do
				if E == 1 then
					SCREENWELDS[E].C0 = Clerp(SCREENWELDS[E].C0, CF(0,-1 + 0.05 * COS(SINE / 12),0) * ANGLES(RAD(0), RAD(-40+180), RAD(0)) * CF(0,0,3.4),0.1)
				elseif E == 2 then
					SCREENWELDS[E].C0 = Clerp(SCREENWELDS[E].C0, CF(0,-1 + 0.05 * SIN(SINE / 12),0) * ANGLES(RAD(0), RAD(40+180), RAD(0)) * CF(0,0,3.4),0.1)
				elseif E == 3 then
					SCREENWELDS[E].C0 = Clerp(SCREENWELDS[E].C0, CF(0,1.3 + 0.05 * SIN(SINE / 12),0) * ANGLES(RAD(0), RAD(-38+180), RAD(0)) * CF(0,0,3.4),0.1)
				elseif E == 4 then
					SCREENWELDS[E].C0 = Clerp(SCREENWELDS[E].C0, CF(0,1.3 + 0.05 * COS(SINE / 12),0) * ANGLES(RAD(0), RAD(38+180), RAD(0)) * CF(0,0,3.4),0.1)
				end
			end
		end
	end
	local SECONDS = math.floor(workspace.DistributedGameTime)
	local MINUTES = math.floor(workspace.DistributedGameTime/60)
	local HOURS = math.floor(workspace.DistributedGameTime/60/60)
	local SECONDS = SECONDS - (MINUTES * 60)
	local MINUTES = MINUTES - (HOURS * 60)
	if #GUISTEXT > 0 then
		for E = 1, #GUISTEXT do
			local TXT = GUISTEXT[E]
			if E == 1 then
				TXT.Text = "SERVER STATS;"
			elseif E == 2 then
				TXT.Text = "SERVER TIME = ["..SECONDS..":"..MINUTES..":"..HOURS.."]"
			elseif E == 3 then
				TXT.Text = "WORKSPACE GRAVITY = ["..workspace.Gravity.."]"
			elseif E == 4 then
				TXT.Text = "SERVER JOBID = ["..game.JobId.."]"
			elseif E == 5 then
				TXT.Text = "SERVER VERSION = ["..game.PlaceVersion.."]"
			end
		end
	end
	local SPACEJECTS = {}
	for index, CHILD in pairs(workspace:GetChildren()) do
		table.insert(SPACEJECTS,CHILD)
	end
	table.insert(SPACEJECTS,game.Lighting)
	table.insert(SPACEJECTS,game.Workspace)
	local MALWARE = {"BlurEffect","BloomEffect","Fire","ParticleEmitter","Smoke"}
	if #GUISTEXT > 0 then
		if MRANDOM(1,125) == 1 then
			for E = 1, #GUISTEXT do
				local TXT = GUISTEXT[E]
				local TEXT = ""
				local DOINGS = {"MONITORING","CHECKING"}
				local OLDTEXT = string.sub(TXT.Text,3)
				if E > 5 then
					if E <= 15 then
						if MRANDOM(1,3) == 1 then
							repeat
								local MONITORME = SPACEJECTS[MRANDOM(1,#SPACEJECTS)]
								if MRANDOM(1,2) == 1 then
									TEXT = DOINGS[MRANDOM(1,#DOINGS)].."; ["..MONITORME.Name.."]..."
									for Z = 1, #MALWARE do
										if MONITORME:FindFirstChildOfClass(MALWARE[Z]) then
											TEXT = "!FOUND MALICIOUS CONTENT IN ["..MONITORME.Name.."]; FOUND: ["..MALWARE[Z].."]"
											if TEXT ~= OLDTEXT then
												CreateSound(136075117, TXT.Parent.Parent, 0.6, MRANDOM(8,12)/10)
											end
											TXT.TextColor3 = C3(1,0,0)
											break
										else
											TXT.TextColor3 = C3(1,1,1)
										end
									end
									break
								end
								if MRANDOM(1,6) == 1 and TXT.TextColor3 == C3(1,1,1) then
									local ES = {"SUCCES.","!FAILURE!"}
									TEXT = "TESTING FILE #"..MRANDOM(100,999).." ["..ES[MRANDOM(1,#ES)].."]"
								end
							until TEXT ~= ""
							local DESIREDTEXT = ">>"..TEXT
							TXT.Text = DESIREDTEXT
						end
					elseif E > 15 then
						local N = E-15
						local POP = 0
						repeat
							for index, CHILD in pairs(game:GetService("Players"):GetChildren()) do
								POP = POP + 1
								if POP == N then
									TEXT = "MONITORING USER; ".."["..CHILD.Name.."]..."
									break
								else
									TEXT = "NOP"
								end
							end
						until TEXT ~= ""
						if TEXT ~= "NOP" then
							local DESIREDTEXT = ">>"..TEXT
							TXT.Text = DESIREDTEXT
						else
							TXT.Text = ""
						end
					end
				end
			end
		end
	end
end
