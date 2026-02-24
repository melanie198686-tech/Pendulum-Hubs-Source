--local SongID = "http://www.roblox.com/asset/?id=198665867" -- deleted song, i commented out the song playing code

--REANIM START

-- Made by @emperrrr (Discord)
-- Discord server: https://discord.gg/UJ7YtqadPJ
-- ^^^ do not remove these credits and make sure they're visible please <3

do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local MouseButton1 = Enum.UserInputType.MouseButton1

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil
	
	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Offset = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end
			
			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}
			
			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				
				tableclear(Tools)
				
				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)
					
					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end
				
				UnequipTools(Humanoid)
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)
			
			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")
				
				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end
			
			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end
	
	local OnInputBegan = function(InputObject)
		if InputObject.UserInputType == MouseButton1 then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character
						
						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end
						
						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end
	
	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end
	
	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints
			
			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		--{ MeshId = "", Name = "", Offset = CFrame.identity, TextureId = "" },

		{ MeshId = "137702817952968", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "135650240593878" },--84451219120140
		{ MeshId = "137702817952968", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "135650240593878" },--72292903231768

		{ MeshId = "137702817952968", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "73798034827573" },--108186273151388
		{ MeshId = "137702817952968", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "73798034827573" },--139904067056008

		{ MeshId = "12344207333", Names = { "Left Arm", "Right Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "12344207341" },--12344545199
		{ MeshId = "12344206657", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "12344206675" },--12344591101

		{ MeshId = "11449386931", Names = { "Left Arm", "Right Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "11439439606" },--11449687315
		{ MeshId = "11449388499", Names = { "Right Arm", "Left Arm" }, Offset = CFrame.Angles(- 2.094, 0, 0), TextureId = "11439439606" },--11449703382

		{ MeshId = "12652772399", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.identity, TextureId = "12652775021" },--12652786974

		{ MeshId = "11263221350", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "11263219250" },--11263254795
		{ MeshId = "11159370334", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "11159284657" },--11159410305
		{ MeshId = "11159370334", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "11159285454" },--11159483910

		{ MeshId = "105141400603933", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "71060417496309" },--102599402682100
		{ MeshId = "99608462237958", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "130809869695496" },--140395948277978

		{ MeshId = "90736849096372", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "79186624401216" },--90960046381276
		{ MeshId = "139733645770094", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "130809869695496" },--82942681251131

		{ MeshId = "125405780718494", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--85392395166623
		{ MeshId = "125405780718494", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--131385506535381

		{ MeshId = "125405780718494", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--106249329428811
		{ MeshId = "125405780718494", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "136752500636691" },--129462518582032

		{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },--14255556501
		{ MeshId = "14255522247", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },--14255554762

		{ MeshId = "17374767929", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },--17374851733
		{ MeshId = "17374767929", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },--17374846953

		{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255544465" },--14255560646
		{ MeshId = "14255522247", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255544465" },--14255562939

		{ MeshId = "18640914129", Names = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" }, Offset = CFrame.identity, TextureId = "18640914168" },--18641142410
		{ MeshId = "18640914129", Names = { "Right Arm", "Left Arm", "Right Leg", "Left Leg" }, Offset = CFrame.identity, TextureId = "18640914168" },--18641077392

		{ MeshId = "18640901641", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.identity, TextureId = "18640901676" },--18641187217
		{ MeshId = "18640901641", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.identity, TextureId = "18640901676" },--18641157833

		{ MeshId = "17387586286", Names = { "Left Leg", "Right Leg", "Left Arm", "Right Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },--17387616772
		{ MeshId = "17387586286", Names = { "Right Leg", "Left Leg", "Right Arm", "Left Arm" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },--17393641992

		{ MeshId = "3030546036", Names = { "Left Arm", "Left Leg", "Right Arm", "Right Leg" }, Offset = CFrame.Angles(- 1.57, 0, 0), TextureId = "" },
		{ MeshId = "4324138105", Names = { "Left Arm", "Left Leg", "Right Arm", "Right Leg" }, Offset = CFrame.Angles(- 1.57, 0, 0), TextureId = "" },

		{ MeshId = "18640899369", Name = "Torso", Offset = CFrame.identity, TextureId = "18640899481" },--18641046146
		{ MeshId = "14241018198", Name = "Torso", Offset = CFrame.identity, TextureId = "14251599953" },--14255528083
		{ MeshId = "110684113028749", Name = "Torso", Offset = CFrame.identity, TextureId = "70661572547971" },--138364679836274
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.Angles(0, 0, -0.249), TextureId = "4819722776" },--4819740796
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },--95290698984301
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = false,
	DefaultFlingOptions = {
		HatFling = true,--{ MeshId="", TextureId = ""},
		Highlight = true,
		PredictionFling = true,
		Timeout = 1,
		ToolFling = true,--"Boombox",
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, - 30, 0),
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})

wait(1 / 60)
Effects = { }
local Player = game.Players.localPlayer
local Character = game.Workspace.non
local Humanoid = Character.Humanoid
local mouse = Player:GetMouse()
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Head = Character.Head
local Torso = Character.Torso
local cam = game.Workspace.CurrentCamera
local RootPart = Character.HumanoidRootPart
local RootJoint = RootPart.RootJoint
local equipped = true
local attack = false
local Anim = 'Idle'
local idle = 0
local attacktype = 1
local Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local velocity = RootPart.Velocity.y
local sine = 0
local change = 1
local grabbed = false
local cn = CFrame.new
local mr = math.rad
local angles = CFrame.Angles
local ud = UDim2.new
local c3 = Color3.new
local dir = {w = 0, s = 0, a = 0, d = 0} 
Climbanim = false
Runkey=false
firemode = false
inair = false
blocking=false
humHsave=0
humDsave=0
extralock=true
lasthit = nil
IKM = false
HMDX = Humanoid.MoveDirection.X/3
HMDZ = Humanoid.MoveDirection.Z/3
local s = Instance.new("Sound",Character)
	s.Name = "BumperCarSound"
	s.SoundId = "http://www.roblox.com/asset/?id=532147820"
	s.Pitch = .7
	s.Volume = .5
	s.Looped = true
	s.archivable = false
	s.Parent = Character
	s:play()
	
sflon = true
bg2 = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
game:GetService("RunService"):BindToRenderStep("ew", 0, function()
	if attack == true then
		bg2.D = 0
		bg2.P = 0
		bg2.maxTorque = Vector3.new(0,0,0)
	end
	if attack == false then
		bg2.D = 100
		bg2.P = 9999
		bg2.maxTorque = Vector3.new(1e+005,1e+000,1e+005)*math.huge
bg2.CFrame  = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position ,Vector3.new(game.Workspace.CurrentCamera.CoordinateFrame.p.x,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y,game.Workspace.CurrentCamera.CoordinateFrame.p.z)) * CFrame.Angles(0,math.rad(180),0)
		 
end
end)--]]


New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end
	
BumperCar = New("Model",Workspace,"BumperCar",{})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.099999845, 0.199999988, 0.299999952),CFrame = CFrame.new(-5.95999956, 9.90000057, -36.2131157, 1, 7.64274186e-15, 0, 7.64274186e-15, -1, -8.74227766e-08, 0, 8.74227766e-08, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.5, 0.100000001, 0.100000001),CFrame = CFrame.new(-4.02177143, 11.8595181, -40.6349945, -0.466506243, -0.129409313, 0.87500006, -0.741025686, -0.482962549, -0.466506183, 0.482962519, -0.866025567, 0.129409432),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Dark stone grey"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.099999994, 3.9000001, 3.9000001),CFrame = CFrame.new(-5.16500664, 8.05000019, -38.9131165, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 0.999999821),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.388235, 0.372549, 0.384314),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(2.79999995, 0.800000072, 0.800000072),CFrame = CFrame.new(-5.81500626, 8.5, -34.7631149, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
SwHandle = New("Part",BumperCar,"Handle",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(4, 0.899999976, 4),CFrame = CFrame.new(-5.16500664, 7.55000019, -36.9631157, 1, 0, 0, 0, 1, 0, 0, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Olive"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.099999845, 0.699999988, 0.699999988),CFrame = CFrame.new(-5.81500578, 8.5, -33.4031143, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.756863, 0.745098, 0.258824),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.899999976, 4, 4),CFrame = CFrame.new(-5.16500664, 7.55000019, -34.9631157, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 0.999999821),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.799999952, 0.599999964, 1.49999952),CFrame = CFrame.new(-6.46000004, 8.85000038, -39.5131149, 4.37113883e-08, -1, -1.19248771e-08, 8.74227695e-08, 1.19248798e-08, -0.99999994, 1, 4.37113883e-08, 8.74227766e-08),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.099999845, 1, 0.299999952),CFrame = CFrame.new(-4.35999966, 9.60000038, -36.2131157, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.199999958, 1, 0.999999523),CFrame = CFrame.new(-3.50999951, 8.60000038, -36.8631134, 1, 0, 1.74845553e-07, 0, 1, 0, -1.74845553e-07, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(2.89999986, 1.99999988, 1.99999988),CFrame = CFrame.new(-5.15999985, 8.5, -34.9000015, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(1.49999976, 0.0999999866, 0.109999947),CFrame = CFrame.new(-5.15999985, 9.95000076, -36.4081154, -1, -1.52854837e-14, 8.74227766e-08, 7.64274186e-15, -1, -8.74227766e-08, 8.74227766e-08, -8.74227766e-08, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.199999958, 1, 0.999999523),CFrame = CFrame.new(-6.80999947, 8.60000038, -36.8631134, 1, 0, 1.74845553e-07, 0, 1, 0, -1.74845553e-07, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.200000048, 1.60000002, 0.999999523),CFrame = CFrame.new(-6.80999947, 8.90000057, -38.5631142, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.49999988, 0.200000003, 0.200000003),CFrame = CFrame.new(-4.52999973, 10.6799994, -40.1199951, -0.258819044, 3.08638382e-09, 0.965925813, -0.933012724, -0.258818835, -0.25, 0.249999776, -0.965925872, 0.0669872463),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.899999976, 4, 4),CFrame = CFrame.new(-5.16500664, 7.55000019, -38.9631157, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 0.999999821),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(1.69999993, 0.100000024, 0.0999999493),CFrame = CFrame.new(-5.15999985, 10.0500002, -36.4131165, 1, 0, 1.74845553e-07, 0, 1, 0, -1.74845553e-07, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.200000048, 1.60000002, 0.999999523),CFrame = CFrame.new(-3.50999975, 8.90000057, -38.5631142, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.200000048, 1, 3.89999962),CFrame = CFrame.new(-3.50999975, 8.60000038, -37.1131134, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.399999857, 0.300000012, 0.300000012),CFrame = CFrame.new(-4.67235041, 10.1668425, -39.9824944, -0.258819044, 3.08638382e-09, 0.965925813, -0.933012724, -0.258818835, -0.25, 0.249999776, -0.965925872, 0.0669872463),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.5, 0.0500000007, 0.0500000007),CFrame = CFrame.new(-3.11038089, 12.7026892, -41.3446198, -0.774519205, -0.353553116, 0.524519026, -0.408493787, -0.353553116, -0.841506362, 0.482962519, -0.866025567, 0.129409432),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.999999881, 2.0999999, 2.0999999),CFrame = CFrame.new(-5.15999985, 8.69999981, -40.1499977, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.799999952, 0.600000024, 0.299999565),CFrame = CFrame.new(-5.85999918, 9.45000076, -39.5131149, 4.37113883e-08, 1, 1.19248771e-08, 7.10542736e-15, -1.19248762e-08, 0.99999994, 1, -4.37113883e-08, 6.06292123e-15),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.899999857, 2.20000005, 2.20000005),CFrame = CFrame.new(-5.15999985, 8.69999981, -40.0999985, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.799999952, 0.600000024, 0.199999571),CFrame = CFrame.new(-4.46000051, 9.70000076, -39.5131149, -1.31134158e-07, 1, 1.19248691e-08, 8.74227695e-08, 1.19248798e-08, -0.99999994, -1, -1.31134158e-07, -8.74227766e-08),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.400000006, 0.300000012, 2.9000001),CFrame = CFrame.new(-5.15999985, 9.55000019, -34.9131165, 1, 0, 1.74845553e-07, 0, 1, 0, -1.74845553e-07, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.0999999046, 1, 0.299999952),CFrame = CFrame.new(-5.96000004, 9.60000038, -36.2131157, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.799999952, 0.600000024, 1.49999952),CFrame = CFrame.new(-3.8599999, 8.85000038, -39.5131149, -1.31134158e-07, 1, 1.19248691e-08, 8.74227695e-08, 1.19248798e-08, -0.99999994, -1, -1.31134158e-07, -8.74227766e-08),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.799999952, 0.600000024, 0.199999571),CFrame = CFrame.new(-5.85999918, 9.70000076, -39.5131149, 4.37113883e-08, -1, -1.19248771e-08, 8.74227695e-08, 1.19248798e-08, -0.99999994, 1, 4.37113883e-08, 8.74227766e-08),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(2.5999999, 1.20000005, 1.20000005),CFrame = CFrame.new(-4.51500654, 8.19999981, -34.8631134, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(3.34999967, 0.0999999866, 2.69999981),CFrame = CFrame.new(-5.1150074, 8.15000057, -37.7131157, 1, 0, 0, 0, 1, 0, 0, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(2.5999999, 1.20000005, 1.20000005),CFrame = CFrame.new(-5.81500626, 8.19999981, -34.8631134, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.400000006, 0.300000012, 0.200000092),CFrame = CFrame.new(-5.15999985, 9.55000019, -33.3631172, -1, 0, -2.62268316e-07, 0, 1, 0, 2.62268316e-07, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.099999845, 0.199999988, 0.299999952),CFrame = CFrame.new(-4.35999966, 9.90000057, -36.2131157, 1, 7.64274186e-15, 0, 7.64274186e-15, -1, -8.74227766e-08, 0, 8.74227766e-08, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Medium blue"),Material = Enum.Material.SmoothPlastic,Transparency = 0.5,Transparency = 0.5,Size = Vector3.new(1.49999988, 0.980000019, 0.279999942),CFrame = CFrame.new(-5.16000032, 9.59000015, -36.2031174, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.431373, 0.6, 0.792157),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Dark stone grey"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(3.8499999, 0.099999994, 4),CFrame = CFrame.new(-5.16500711, 8.05000019, -36.9631157, 1, 0, 0, 0, 1, 0, 0, 0, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.388235, 0.372549, 0.384314),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.799999952, 0.600000024, 0.299999565),CFrame = CFrame.new(-4.45999908, 9.45000076, -39.5131149, -1.31134158e-07, -1, -1.19248771e-08, 7.10542736e-15, -1.19248762e-08, 0.99999994, -1, 1.31134158e-07, -5.0204151e-15),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(1.69999993, 0.100000024, 0.299999952),CFrame = CFrame.new(-5.15999985, 10.0500002, -36.2131157, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.400000006, 1.4000001, 0.200000092),CFrame = CFrame.new(-5.15999985, 8.69999981, -33.3631172, 1, 8.74227766e-08, 2.62268316e-07, 8.74227766e-08, -1, 2.29282247e-14, 2.62268316e-07, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(1, 1, 2),CFrame = CFrame.new(-4.15999985, 8.60000038, -35.3631172, -1.19248806e-08, 1, -1.04250613e-15, 1, 1.19248806e-08, 8.74227766e-08, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Dark stone grey"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.099999994, 3.9000001, 3.9000001),CFrame = CFrame.new(-5.16500664, 8.05000019, -35.0131149, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 0.999999821),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.388235, 0.372549, 0.384314),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.199999958, 1, 3.89999962),CFrame = CFrame.new(-6.80999994, 8.60000038, -37.1131134, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.099999845, 0.199999988, 0.0999999493),CFrame = CFrame.new(-4.35999966, 9.90000057, -36.4131165, -1, -1.52854837e-14, 8.74227766e-08, 7.64274186e-15, -1, -8.74227766e-08, 8.74227766e-08, -8.74227766e-08, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(3.5, 1, 1.19999993),CFrame = CFrame.new(-5.15999985, 8.60000038, -35.7631149, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(1, 1, 2),CFrame = CFrame.new(-6.15999985, 8.60000038, -35.3631172, 9.9347659e-08, -1, 8.68524799e-15, -1, -9.9347659e-08, -8.74227766e-08, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(3, 1, 1.99000001),CFrame = CFrame.new(-5.15999985, 8.60000038, -35.3581161, -1, 0, -8.74227766e-08, 0, 1, 0, 8.74227766e-08, 0, -1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(3.5, 0.600000024, 1.59999955),CFrame = CFrame.new(-5.15999985, 8.90000057, -39.3631134, -1, 0, -8.74227766e-08, 8.74227766e-08, 1.19248806e-08, -1, 1.04250613e-15, -1, -1.19248806e-08),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.799999833, 2.29999995, 2.29999995),CFrame = CFrame.new(-5.15999985, 8.69999981, -40.0499992, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Olive"),Material = Enum.Material.Neon,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.099999845, 0.699999988, 0.699999988),CFrame = CFrame.new(-4.51500607, 8.5, -33.4031143, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.756863, 0.745098, 0.258824),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.899999857, 2.39999986, 2.39999986),CFrame = CFrame.new(-5.15999985, 8.69999981, -39.5, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(1.99999988, 1.60000002, 1.60000002),CFrame = CFrame.new(-5.15999985, 9.05000019, -39.9999962, -2.08616257e-07, 0, 1, -1, 1.19248806e-08, -2.08616257e-07, -1.19248806e-08, -1, -2.48772391e-15),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.699999809, 2.0999999, 2.0999999),CFrame = CFrame.new(-5.15999985, 8.55000019, -35.5999985, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(0.71999979, 2.19999981, 2.19999981),CFrame = CFrame.new(-5.15999985, 8.60000038, -36.0099983, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})
Part = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Black"),Material = Enum.Material.SmoothPlastic,Shape = Enum.PartType.Cylinder,Size = Vector3.new(2.79999995, 0.800000072, 0.800000072),CFrame = CFrame.new(-4.51500654, 8.5, -34.7631149, -2.08616257e-07, 0, 1, 0, 1, 0, -1, 0, -2.08616257e-07),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.105882, 0.164706, 0.207843),})
Wedge = New("WedgePart",BumperCar,"Wedge",{BrickColor = BrickColor.new("Maroon"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(0.099999845, 0.199999988, 0.0999999493),CFrame = CFrame.new(-5.95999956, 9.90000057, -36.4131165, -1, -1.52854837e-14, 8.74227766e-08, 7.64274186e-15, -1, -8.74227766e-08, 8.74227766e-08, -8.74227766e-08, 1),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.458824, 0, 0),})




FrontPart = New("Part",BumperCar,"Part",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.SmoothPlastic,Size = Vector3.new(6, 6, 6),CFrame = CFrame.new(-5.16500664, 7.55000019, -34.9631157, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 0.999999821),Anchored = true,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),Transparency = 1,})
















local all,last = {}
function scan(p)
	for _,v in pairs(p:GetChildren()) do
		if (v:IsA("BasePart")) then
			if (last) then
				local w = Instance.new("Weld")
				w.Part0,w.Part1 = last,v
				w.C0 = v.CFrame:toObjectSpace(last.CFrame):inverse()
				w.Parent = last
			end
			table.insert(all,v)
			last = v
		end
		scan(v)
	end
end
scan(BumperCar)


for _,v in pairs(all) do v.Anchored = false v.CanCollide = false  end 
BumperCar.Parent = Character


local Services = {


SoundService = game:GetService("SoundService");
Players = game:GetService("Players");
Debris = game:GetService("Debris");
Workspace = game:GetService("Workspace");
Lighting = game:GetService("Lighting");
HttpService = game:GetService("HttpService");
InsertService = game:GetService("InsertService");
	
}   

local NeckCF = cn(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
Humanoid.Animator:Destroy()
Character.Animate:Destroy()

local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)



SWW = Instance.new("Weld")
SWW.Name = "SWW"
SWW.Part0 = Torso 
SWW.C0 = cn(0, -2.6, -1)*angles(math.rad(-0),math.rad(-180),math.rad(0))
SWW.C1 = cn(0, 0, 0) 
SWW.Part1 = SwHandle
SWW.Parent = Torso 

RSH, LSH = nil, nil 

RW = Instance.new("Weld") 
LW = Instance.new("Weld")

RH = Torso["Right Hip"]
LH = Torso["Left Hip"]

RSH = Torso["Right Shoulder"] 
LSH = Torso["Left Shoulder"] 

RSH.Parent = nil 
LSH.Parent = nil 

RW.Name = "RW"
RW.Part0 = Torso 
RW.C0 = cn(1.5, 0.5, 0)
RW.C1 = cn(0, 0.5, 0) 
RW.Part1 = RightArm
RW.Parent = Torso 

LW.Name = "LW"
LW.Part0 = Torso 
LW.C0 = cn(-1.5, 0.5, 0)
LW.C1 = cn(0, 0.5, 0) 
LW.Part1 = LeftArm
LW.Parent = Torso 

function clerp(a, b, t) 
	local qa = {
		QuaternionFromCFrame(a)
	}
	local qb = {
		QuaternionFromCFrame(b)
	} 
	local ax, ay, az = a.x, a.y, a.z 
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t)) 
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
			local recip = 0.5 / s
			return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip 
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
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1 / math.sin(theta) 
			startInterp = math.sin((1 - t) * theta) * invSinTheta 
			finishInterp = math.sin(t * theta) * invSinTheta  
		else 
			startInterp = 1 - t 
			finishInterp = t 
		end 
	else 
		if (1 + cosTheta) > 0.0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1 / math.sin(theta) 
			startInterp = math.sin((t - 1) * theta) * invSinTheta 
			finishInterp = math.sin(t * theta) * invSinTheta 
		else 
			startInterp = t - 1 
			finishInterp = t 
		end 
	end 
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp 
end

function swait(num)
	if num == 0 or num == nil then
		game:service'RunService'.RenderStepped:wait(0)
	else
		for i = 0, num do
			game:service'RunService'.RenderStepped:wait(0)
		end
	end
end

local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
	
function CreatePart(FormFactor, Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part"){
		formFactor = FormFactor,
		Parent = Parent,
		Reflectance = Reflectance,
		Transparency = Transparency,
		CanCollide = false,
		Locked = true,
		BrickColor = BrickColor.new(tostring(BColor)),
		Name = Name,
		Size = Size,
		Material = Material,
	}
	RemoveOutlines(Part)
	return Part
end
	
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	local Msh = Create(Mesh){
		Parent = Part,
		Offset = OffSet,
		Scale = Scale,
	}
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
	
function CreateWeld(Parent, Part0, Part1, C0, C1)
	local Weld = Create("Weld"){
		Parent = Parent,
		Part0 = Part0,
		Part1 = Part1,
		C0 = C0,
		C1 = C1,
	}
	return Weld
end

function rayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

function CreateSound(id, par, vol, pit) 
	coroutine.resume(coroutine.create(function()
		local sou = Instance.new("Sound", par or workspace)
		sou.Volume = vol
		sou.Pitch = pit or 1
		sou.SoundId = id
		wait() 
		sou:play() 
		game:GetService("Debris"):AddItem(sou, 6)
	end))
end
function CreateSong(id, par, vol, pit) 
	coroutine.resume(coroutine.create(function()
	 sou2 = Instance.new("Sound", par or workspace)
		sou2.Volume = vol
		sou2.Pitch = 1
		sou2.SoundId = id
		wait() 
		sou2:play() 
		sou2.Looped = true		
	end))
end

local function getclosest(obj, distance)
	local last, lastx = distance + 1
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA'Model' and v ~= Character and v:findFirstChild('Humanoid') and v:findFirstChild('Torso') and v:findFirstChild('Humanoid').Health > 0 then
			local t = v.Torso
			local dist = (t.Position - obj.Position).magnitude
			if dist <= distance then
				if dist < last then
					last = dist
					lastx = v
				end
			end
		end
	end
	return lastx
end

function Damage(hit, damage, cooldown, Color1, Color2, HSound, HPitch)
	for i, v in pairs(hit:GetChildren()) do 
		if v:IsA("Humanoid") and hit.Name ~= Character.Name then
			local find = v:FindFirstChild("Hitz")
			if not find then
				if v.Parent:findFirstChild("Head") then
					local BillG = Create("BillboardGui"){
						Parent = v.Parent.Head,
						Size = UDim2.new(1, 0, 1, 0),
						Adornee = v.Parent.Head,
						StudsOffset = Vector3.new(math.random(-3, 3), math.random(3, 5), math.random(-3, 3)),
					}
					local TL = Create("TextLabel"){
						Parent = BillG,
						Size = UDim2.new(3, 3, 3, 3),
						BackgroundTransparency = 1,
						Text = tostring(damage).."-",
						TextColor3 = Color1.Color,
						TextStrokeColor3 = Color2.Color,
						TextStrokeTransparency = 0,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						FontSize = Enum.FontSize.Size18,
						Font = "ArialBold",
					}
					coroutine.resume(coroutine.create(function()
						wait(1)
						for i = 0, 1, .1 do
							wait(.1)
							BillG.StudsOffset = BillG.StudsOffset + Vector3.new(0, .1, 0)
						end
						BillG:Destroy()
					end))
				end
				v.Health = v.Health - -math.huge
				local bool = Create("BoolValue"){
					Parent = v,
					Name = 'Hitz',
				}
				if HSound ~= nil and HPitch ~= nil then
					CreateSound(HSound, hit, 1, HPitch) 
				end
				game:GetService("Debris"):AddItem(bool, cooldown)
			end
		end
	end
end


function BlockEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	if Type == 1 or Type == nil then
		table.insert(Effects, {
			prt,
			"Block1",
			delay,
			x3,
			y3,
			z3,
			msh
		})
	elseif Type == 2 then
		table.insert(Effects, {
			prt,
			"Block2",
			delay,
			x3,
			y3,
			z3,
			msh
		})
	elseif Type == 3 then
		table.insert(Effects, {
			prt,
			"Block3",
			delay,
			x3,
			y3,
			z3,
			msh
		})
	end
end

function SphereEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "nil", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {
		prt,
		"Cylinder",
		delay,
		x3,
		y3,
		z3,
		msh
	})
end

function RingEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.new(x1, y1, z1)
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "264766957", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {
		prt,
		"Cylinder",
		delay,
		x3,
		y3,
		z3,
		msh
	})
end

function CylinderEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {
		prt,
		"Cylinder",
		delay,
		x3,
		y3,
		z3,
		msh
	})
end

function WaveEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace,"Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "264766957", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {
		prt,
		"Cylinder",
		delay,
		x3,
		y3,
		z3,
		msh
	})
end

function SpecialEffect(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	local prt = CreatePart(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "24388358", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {
		prt,
		"Cylinder",
		delay,
		x3,
		y3,
		z3,
		msh
	})
end

function BreakEffect(brickcolor, cframe, x1, y1, z1)
	local prt = CreatePart(3, workspace, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "nil", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	local num = math.random(10, 50) / 1000
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {
		prt,
		"Shatter",
		num,
		prt.CFrame,
		math.random() - math.random(),
		0,
		math.random(50, 100) / 100
	})
end


	

	for i = 0, 1, 0.05 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(5), math.rad(0), math.rad(0)), .1)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(5), math.rad(0), math.rad(5)), 0.1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
		if Torsovelocity > 2 then
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-50 * math.cos(sine / 4)), math.rad(0), math.rad(4 * math.cos(sine / 4))), .2)
		RH.C0 = clerp(RH.C0, cn(1, -1 + .1 * math.cos(sine / 5), 0) * RHCF * angles(math.rad(-2), math.rad(0), math.rad(30 * math.cos(sine / 4))), .3)
		LH.C0 = clerp(LH.C0, cn(-1, -1 + .1 * math.cos(sine / 5), 0) * LHCF * angles(math.rad(-2), math.rad(0), math.rad(30 * math.cos(sine / 4))), .3)
		elseif Torsovelocity < 1 then
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, -.1) * angles(math.rad(5), math.rad(0), math.rad(5)), 0.1)
		RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-2), math.rad(5), math.rad(0)), .1)
		LH.C0 = clerp(LH.C0, cn(-1, -1, 0) * LHCF * angles(math.rad(-2), math.rad(5), math.rad(0)), .1)
		end
	end
	attack = false



game:GetService'RunService'.Stepped:connect(function()
	Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
	velocity = RootPart.Velocity.y
	sine = sine + change
	local hit, pos = rayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, Character)
	if equipped == true or equipped == false then
		if RootPart.Velocity.y > -1 and hit == nil then 
			Anim = "Jump"
			inair = true
			if attack == false then
					s.Pitch = 1
	s.Volume = 1
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(15), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-15)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(15)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)	
			end
			
		elseif RootPart.Velocity.y < -1 and hit == nil then 
			Anim = "Fall"
			inair = true
			if attack == false then
	s.Pitch = .7
	s.Volume = .5				
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(-5), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(180 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(45)), 0.05)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(180 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-45)), 0.05)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)	
			end
		elseif Torsovelocity < 1 and hit ~= nil then
			Anim = "Idle"
	
			inair = false
		if attack == false then
	s.Pitch = .7
	s.Volume = .5			
				change = 0.8
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1, -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)			
			end --]]

		elseif Torsovelocity > 1 and hit ~= nil then
			Anim = "Walk"
inair = false	

			if attack == false and Runkey == true then
	s.Pitch = 1
	s.Volume = .9
	
								change = 1
								Humanoid.WalkSpeed = 85
								Humanoid.JumpPower = 55
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(-45), math.rad(0) + RootPart.RotVelocity.Y/40, math.rad(2 * math.cos(sine / 1))), .4)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(35 - 1 * math.cos(sine / 4)), math.rad(0),  math.rad(-0) + RootPart.RotVelocity.Y/20), .2)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(25 - 1 * math.cos(sine / 4)), math.rad(0), math.rad(-45)), 0.2)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(25 + 1 * math.cos(sine / 4)), math.rad(0), math.rad(45)), 0.2)
					RH.C0 = clerp(RH.C0, cn(.6, -1, 0) * RHCF * angles(math.rad(6), math.rad(0), math.rad(45 + .05 * math.cos(sine / 25))), .4)
					LH.C0 = clerp(LH.C0, cn(-.6, -1, -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-45 + .05 * math.cos(sine / 25))), .4)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1,1) * angles(math.rad(-45),math.rad(-180),math.rad(0)), 0.4)	
			end
			if attack == false and Runkey == false then
	s.Pitch = .8
	s.Volume = .6
			change = 0.65
			Humanoid.WalkSpeed = 13 --* math.cos(sine / 2)
			Humanoid.JumpPower = 50
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(0), math.rad(0), math.rad(.5 * math.cos(sine / 1))), .3)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0) + RootPart.RotVelocity.Y/20), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1, -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)		
			end
			
			
			
			
	function onClimbing(speed)
		if attack == false then
		attack = true
		Climbanim= true
		Humanoid.WalkSpeed = 14
while Climbanim == true do
	for i = 0, 0, 0.1 do
        swait()
	
	change = 0.5	
	
	
	
	if RootPart.Velocity.y > .01 then
			s.Pitch = .9
	s.Volume = .5
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 1, -1.1) * angles(math.rad(-90), math.rad(0), math.rad(0)), .3)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)	
	end	
			
			
			
			
	if RootPart.Velocity.y < .5 and RootPart.Velocity.y > -0.5  then
			s.Pitch = .7
	s.Volume = .5
					  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 1, -1.1) * angles(math.rad(-90), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)	
				end				
			
			
		if RootPart.Velocity.y < -1 then
				s.Pitch = .9
	s.Volume = .5
			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 1, -1.1) * angles(math.rad(-90), math.rad(0), math.rad(180)), .3)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-1 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)				end			
			
	end	
	if  Torsovelocity > 1  then
	Climbanim = false
	end
end	
attack = false	
	end
	end
	Humanoid.Climbing:connect(onClimbing)
					
			
			
		end
	end

	
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame+Vector3.new(0,-.0,0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[1].CFrame  * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))+Vector3.new(0,.15,0)
							local Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]							
						elseif Thing[2] == "Cylinder" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							local Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, .5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							local Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
end)


	Effects = {
Block = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	if Type == 1 or Type == nil then
		table.insert(Effects, {prt, "Block1", delay, x3, y3, z3, msh})
	else
		if Type == 2 then
			table.insert(Effects, {prt, "Block2", delay, x3, y3, z3, msh})
		else
			table.insert(Effects, {prt, "Block3", delay, x3, y3, z3, msh})
		end
	end
end
}
, 
Sphere = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Cylinder = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Wave = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://431164262", Vector3.new(0, 0, 0), Vector3.new(x1/60, y1/60, z1/60))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3/60, y3/60, z3/60, msh})
end
}
, 
Ring = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Break = {Create = function(brickcolor, cframe, x1, y1, z1)
	
	local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	local num = math.random(10, 50) / 1000
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Shatter", num, prt.CFrame, math.random() - math.random(), 0, math.random(50, 100) / 100})
end
}
}



	RemoveOutlines = function(part)
	
	part.TopSurface = 10
end

	CreatePart = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	
	local Part = Create("Part")({Parent = Parent, Reflectance = Reflectance, Transparency = Transparency, CanCollide = false, Locked = true, BrickColor = BrickColor.new(tostring(BColor)), Name = Name, Size = Size, Material = Material})
	RemoveOutlines(Part)
	return Part
end

	CreateMesh = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end

	CreateWeld = function(Parent, Part0, Part1, C0, C1)
	
	local Weld = Create("Weld")({Parent = Parent, Part0 = Part0, Part1 = Part1, C0 = C0, C1 = C1})
	return Weld
end




WSHM = {'White',"Pastel light red"}
WSH = WSHM[math.random(1,#WSHM)]


IcePartFunk = function(HPart,aria,Min,Max)
	
IcePart = Instance.new("Part",HPart)
IcePart.Size = Vector3.new(math.random(Min, Max),math.random(Min, Max),math.random(Min, Max))
IcePart.CanCollide = false
IuW = Instance.new("Weld")
IuW.Name = "GuW"
IuW.Part0 = HPart 
IuW.C0 = cn(math.random(-aria, aria),math.random(-aria, aria),math.random(-aria, aria))*angles( math.random(-180, 180),math.random(-180, 180),math.random(-180, 180))
IuW.C1 = cn(0, math.random(-aria/2, aria/2), 0) 
IuW.Part1 = IcePart
IuW.Parent = HPart 
IcePart.Transparency = .85
IcePart.Material= "Neon"
WSH = WSHM[math.random(1,#WSHM)]
IcePart.BrickColor = BrickColor.new(""..WSH)

RemoveOutlines(IcePart)
game:GetService("Debris"):AddItem(IuW, 4)
game:GetService("Debris"):AddItem(IcePart, 6)


end
--[[
GroundPartFunk2 = function(Hit,HPart,color,aria,Min,Max)
	
IcePart2 = Instance.new("Part",HPart)
IcePart2.Size = Vector3.new(math.random(Min, Max),math.random(Min, Max),math.random(Min, Max))
IcePart2.CanCollide = false
RemoveOutlines(IcePart2)
IcePart2.Anchored = true



IcePart2.CFrame=CFrame.new(Hit.Position* Vector3.new(math.random(-aria, aria),math.random(-aria, aria),math.random(-aria, aria)))






IcePart2.Transparency = .85
IcePart2.Material= "Neon"

IcePart2.BrickColor = BrickColor.new(""..color)



game:GetService("Debris"):AddItem(IcePart2, 6)


end
--]]
GroundPartFunk2 = function(Hit,HPart,color,aria,Min,Max,num)
	
IcePart2 = Instance.new("Part",HPart)
IcePart2.Size = Vector3.new(math.random(Min, Max),math.random(Min, Max),math.random(Min, Max))
IcePart2.CanCollide = false
RemoveOutlines(IcePart2)
IcePart2.Anchored = true
game:GetService("Debris"):AddItem(IcePart2, .4)
IcePart2.Transparency = .3
IcePart2.Material= "Neon"
IcePart2.BrickColor = BrickColor.new(""..color)

IcePart2.CFrame=CFrame.new(Hit.Position+ Vector3.new(math.random(-aria, aria),math.random(-aria, 0),math.random(-aria, aria)))*angles(math.rad(math.random(-45, 45)),math.rad(math.random(-45, 45)),math.rad(math.random(-45, 45)))
for i = 0,num do
if num > 1 then
GroundPartFunk2(Hit,HPart,color,aria,Min,Max,0)	
end
end











end





SpikeMeshId = 1033714
local CreateSpike = function(Parent, Name, Color, Size, Material, Transparency, Scale)


local Part = Instance.new("Part", Parent)
Part.Name = Name
Part.BrickColor = BrickColor.new(Color)
Part.Size = Size
Part.Material = Material
Part.Transparency = Transparency
Part.CanCollide = false
RemoveOutlines(Part)

local Mesh = Instance.new("SpecialMesh", Part)
Mesh.MeshType = "Sphere"
Mesh.Scale = Scale

return Mesh and Part

end








	CFuncs = {
Part = {Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	
	local Part = Create("Part")({Parent = Parent, Reflectance = Reflectance, Transparency = Transparency, CanCollide = false, Locked = true, BrickColor = BrickColor.new(tostring(BColor)), Name = Name, Size = Size, Material = Material})
	RemoveOutlines(Part)
	return Part
end
}
, 
Mesh = {Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
}
, 
Mesh = {Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
}
, 
Weld = {Create = function(Parent, Part0, Part1, C0, C1)
	
	local Weld = Create("Weld")({Parent = Parent, Part0 = Part0, Part1 = Part1, C0 = C0, C1 = C1})
	return Weld
end
}
, 
Sound = {Create = function(id, par, vol, pit)
	
	coroutine.resume(coroutine.create(function()
		
		local S = Create("Sound")({Volume = vol, Pitch = pit or 1, SoundId = id, Parent = par or workspace})
		wait()
		S:play()
		game:GetService("Debris"):AddItem(S, 6)
	end
))
end
}
, 
ParticleEmitter = {Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
	
	local fp = Create("ParticleEmitter")({Parent = Parent, Color = ColorSequence.new(Color1, Color2), LightEmission = LightEmission, Size = Size, Texture = Texture, Transparency = Transparency, ZOffset = ZOffset, Acceleration = Accel, Drag = Drag, LockedToPart = LockedToPart, VelocityInheritance = VelocityInheritance, EmissionDirection = EmissionDirection, Enabled = Enabled, Lifetime = LifeTime, Rate = Rate, Rotation = Rotation, RotSpeed = RotSpeed, Speed = Speed, VelocitySpread = VelocitySpread})
	return fp
end
}
}





	Damagefunc = function(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	
	if hit.Parent == nil then
		return 
	end
	local h = hit.Parent:FindFirstChild("Humanoid")
	for _,v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil and hit.Parent.DebounceHit.Value == true then
			return 
		end
		local c = Create("ObjectValue")({Name = "creator", Value = game:service("Players").LocalPlayer, Parent = h})
		game:GetService("Debris"):AddItem(c, 0.5)
		if HitSound ~= nil and HitPitch ~= nil then
			CreateSound(HitSound, hit, 1, HitPitch)
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil and block.className == "IntValue" and block.Value > 0 then
			blocked = true
			block.Value = block.Value - 1
			print(block.Value)
		end
		if blocked == false then
			h.Health = h.Health - Damage
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		else
			h.Health = h.Health - Damage / 2
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		end
if hit.Parent:FindFirstChild("Torso") ~= nil then	
lasthit = hit.Parent.Torso
end
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
		
		swait(.2)
		HHumanoid.PlatformStand = false
	end
), hum)
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
			local bodvol = Create("BodyVelocity")({velocity = angle * knockback, P = 50, maxForce = Vector3.new(80000, 80000, 80000), Parent = hit})
			local rl = Create("BodyAngularVelocity")({P = 3000, maxTorque = Vector3.new(5000, 5000, 5000) * 50, angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)), Parent = hit})
			game:GetService("Debris"):AddItem(bodvol, 0.1)
			game:GetService("Debris"):AddItem(rl, 0.1)
		elseif Type == "Normal" then
					local vp = Create("BodyVelocity")({P = 500, maxForce = Vector3.new(math.huge, 0, math.huge), velocity = Property.CFrame.lookVector * knockback})
					if knockback > 0 then
						vp.Parent = hit.Parent.Torso
					end
					game:GetService("Debris"):AddItem(vp, 0.5)
					elseif Type == "Impale" then

local Spike = CreateSpike(Services.Workspace, "Ice Spike", "Really red", Vector3.new(1,2,1), "Neon", .2, Vector3.new(.5,25,.5))	
Spike.Anchored = true
Spike.Rotation = Vector3.new(math.random(-45,45), 0 , math.random(-45,45))
Spike.Position = hit.Parent.Torso.Position 

Services.Debris:AddItem(Spike, 4)




	

CFuncs.Sound.Create("http://www.roblox.com/asset/?id=268249319", Spike, .8, 2)	
			hit.Parent.Humanoid.PlatformStand = true
			
		
		swait(1)
		hit.Parent.Humanoid.PlatformStand = false
				elseif Type == "Up" then
							local bodyVelocity = Create("BodyVelocity")({velocity = Vector3.new(0, 20, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
							game:GetService("Debris"):AddItem(bodyVelocity, 0.1)
							local bodyVelocity = Create("BodyVelocity")({velocity = Vector3.new(0, 20, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
							game:GetService("Debris"):AddItem(bodyVelocity, .1)
				
				
				
	elseif Type == "UltSlice" then			
				
BlockEffect( BrickColor.new("Really red"), SwHandle.CFrame * cn(0, 1.8, 0), 16, 141, .5, 0,0,0,          0.01,2)	
BlockEffect( BrickColor.new("Really red"), Head.CFrame, 21, 21, 21, 0,0,0,          0.01,2)	
BlockEffect( BrickColor.new("Really red"), Torso.CFrame, 41, 41, 21, 0,0,0,           0.01,2)	
BlockEffect( BrickColor.new("Really red"), RightArm.CFrame, 21, 41, 21, 0,0,0,           0.01,2)	
BlockEffect( BrickColor.new("Really red"), LeftArm.CFrame, 21, 41, 21, 0,0,0,           0.01,2)	
BlockEffect( BrickColor.new("Really red"), RightLeg.CFrame, 21, 41, 21, 0,0,0,          0.01,2)	
BlockEffect( BrickColor.new("Really red"), LeftLeg.CFrame, 21, 41, 21, 0,0,0,           0.01,2)					
				
								
		elseif Type == "Slice" then
									local bp2 = Create("BodyPosition")({P = 900, D = 1000, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Head.Position, Parent = hit.Parent.Torso})
									game:GetService("Debris"):AddItem(bp2, 1)
	
if hit.Parent:FindFirstChild("HumanoidRootPart") ~= nil then	
			for i = 1,10 do
Effects.Break.Create	(BrickColor.new("Really red"), hit.Parent.HumanoidRootPart.CFrame, 10, .5, .5)
			
	
			end	
			end
		
			
			
			
						elseif Type == "Snare" then
									local bp = Create("BodyPosition")({P = 900, D = 1000, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
									game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Slowness" then
					local	SpeedSave=hit.Parent.Humanoid.WalkSpeed	
							
							for i = 1,25 do
hit.Parent.Humanoid.WalkSpeed = 4		
IcePartFunk(hit.Parent.Torso,.55,0.1,1)
end	
						wait(4)
						hit.Parent.Humanoid.WalkSpeed = SpeedSave	
		elseif Type == "Firedmg" then
			
			for i = 1,math.random(1, 6) do
				if hit.Parent:FindFirstChild("Torso") ~= nil then	
										BlockEffect( BrickColor.new("Really red"), hit.Parent.Torso.CFrame, 20, 20, 20, 1.5, 1.5, 1.5, 0.05,3)
						BlockEffect(BrickColor.new("Gold"), hit.Parent.Torso.CFrame, 20, 20, 20, 2, 2, 2, 0.05,3)
						BlockEffect(BrickColor.new("Really black"), hit.Parent.Torso.CFrame, 0, 0, 0, 2, 2, 2, 0.035,3)
						
			
			
			wait(.1)
			end
			end
			
						elseif Type == "Freeze" then
									local bp = Create("BodyPosition")({P = 900, D = 1000, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
									game:GetService("Debris"):AddItem(bp, 4)
for i=1,25 do
	IcePartFunk(hit.Parent.Torso,1,1.5,2)	
	end														
								elseif Type == "Freeze2" then
											local BodPos = Create("BodyPosition")({P = 50000, D = 1000, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
											local BodGy = Create("BodyGyro")({maxTorque = Vector3.new(400000, 400000, 400000) * math.huge, P = 20000, Parent = hit.Parent.Torso, cframe = hit.Parent.Torso.CFrame})
											hit.Parent.Torso.Anchored = true
											coroutine.resume(coroutine.create(function(Part)
		
		swait(1.5)
		Part.Anchored = false
	end
), hit.Parent.Torso)
											game:GetService("Debris"):AddItem(BodPos, 3)
											game:GetService("Debris"):AddItem(BodGy, 3)
										end
											local debounce = Create("BoolValue")({Name = "DebounceHit", Parent = hit.Parent, Value = true})
											game:GetService("Debris"):AddItem(debounce, Delay)
											c = Instance.new("ObjectValue")
											c.Name = "creator"
											c.Value = Player
											c.Parent = h
											game:GetService("Debris"):AddItem(c, 0.5)
										end
									end

	ShowDamage = function(Pos, Text, Time, Color)
	
	local Rate = 0.033333333333333
	if not Pos then
		local Pos = Vector3.new(0, 0, 0)
	end
	local Text = Text or ""
	local Time = Time or 2
	if not Color then
		local Color = Color3.new(1, 0, 1)
	end
	local EffectPart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui")({Size = UDim2.new(3, 0, 3, 0), Adornee = EffectPart, Parent = EffectPart})
	local TextLabel = Create("TextLabel")({BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = Text, TextColor3 = Color, TextScaled = true, Font = Enum.Font.ArialBold, Parent = BillboardGui})
	game.Debris:AddItem(EffectPart, Time + 0.1)
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		
		local Frames = Time / Rate
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = Frame / Frames
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end
)
end

	MagniDamage = function(Part, magni, mindam, maxdam, knock, Type)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= magni and c.Name ~= Player.Name then
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "http://www.roblox.com/asset/?id=231917784", 1.2)
				end
			end
		end
	end
end
	MagniKILL = function(Part, magni, knock, Type)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= magni and c.Name ~= Player.Name then
					hum.Health = 0
				end
			end
		end
	end
end
	EffectModel = Instance.new("Model", Character)
	EffectModel.Name = "Effects"

	BlockEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	
	local prt = CreatePart(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	if Type == 1 or Type == nil then
		table.insert(Effects, {prt, "Block1", delay, x3, y3, z3, msh})
	else
		if Type == 2 then
			table.insert(Effects, {prt, "Block2", delay, x3, y3, z3, msh})
	else
		if Type == 3 then
			table.insert(Effects, {prt, "Block3", delay, x3, y3, z3, msh})			
		end
	end
end
end
	CreateSound = function(id, par, vol, pit)
	
	coroutine.resume(coroutine.create(function()
		
		local sou = Instance.new("Sound", par or workspace)
		sou.Volume = vol
		sou.Pitch = pit or 1
		sou.SoundId = id
		swait()
		sou:play()
		game:GetService("Debris"):AddItem(sou, 6)
	end
))
end

	Laser = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "Neon"
	local msh = CreateMesh("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 6, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh)
end

	 shoottraildd = function(mouse, partt, SpreadAmount)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount/10, SpreadAmount/10), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = mouse + Vector3.new(0, 6, 0)+RootPart.CFrame.lookVector*-2
	local MainPos2 = mouse + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 100
	local num = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new("Really red"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 0, mag * (speed / (speed / 2)), 0, -0, 0, -0, 10)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil then
						
					
						
						GroundPartFunk2(refpart,EffectModel,"Really red",1,.1,2,2)
						BlockEffect( BrickColor.new("Really red"), refpart.CFrame, 70, 70, 70, -.5, -.5, -.5, 0.05)
--						BlockEffect(BrickColor.new("Gold"), refpart.CFrame, 1, 1, 1, 7, 7, 7, 0.07)
--						BlockEffect(BrickColor.new("Gold"), refpart.CFrame, 1, 1, 1, 7, 7, 7, 0.07)
						MagniDamage(refpart, 6, 10, 25, 0, "Slice")
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end

	shoottraildd2 = function(mouse, partt, SpreadAmount)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 1000
	local num = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new("Gold"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -8.175, 0, -8.175, 0.15)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil then
						CreateSound("http://www.roblox.com/asset/?id=514867425", refpart, 2, 1)
						BlockEffect( BrickColor.new("Really red"), refpart.CFrame, 1, 1, 1, 86.5, 86.5, 86.5, 0.05)
						BlockEffect(BrickColor.new("Gold"), refpart.CFrame, 1, 1, 1, 87, 87, 87, 0.05)
						BlockEffect(BrickColor.new("Gold"), refpart.CFrame, 1, 1, 1, 87, 87, 87, 0.05)
						MagniKILL(refpart, 80, 0, "Normal")
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
	end
	
	shoottraildd3 = function(mouse, partt, SpreadAmount, dmg)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 200
	local num = 0
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new("White"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.375, 0, -0.375, 0.05)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				BlockEffect(BrickColor.new("Pastel light red"), refpart.CFrame, 1, 1, 1, 7, 7, 7, 0.05)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil then
						CreateSound("http://www.roblox.com/asset/?id=514867425", refpart, 2, 1)
						BlockEffect(BrickColor.new("White"), refpart.CFrame, 1, 1, 1, 6.5, 6.5, 6.5, 0.05)
						BlockEffect(BrickColor.new("Pastel light red"), refpart.CFrame, 1, 1, 1, 7, 7, 7, 0.05)
						
							
						MagniDamage(refpart, 6, dmg, dmg, 0, "Slowness")
						
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
	end
	
	 shoottraildd4 = function(mouse, partt, SpreadAmount, dmg)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 150
	local num = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new("Gold"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -1.175, 0, -1.175, 0.15)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = CreatePart(EffectModel, "Neon", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil then
						CreateSound("http://www.roblox.com/asset/?id=514867425", refpart, 2, 1)
						BlockEffect( BrickColor.new("Really red"), refpart.CFrame, 1, 1, 1, 6.5, 6.5, 6.5, 0.05)
						BlockEffect(BrickColor.new("Gold"), refpart.CFrame, 1, 1, 1, 7, 7, 7, 0.05)
						BlockEffect(BrickColor.new("Gold"), refpart.CFrame, 1, 1, 1, 7, 7, 7, 0.05)
						MagniDamage(refpart, 6, dmg, dmg, 0, "Normal")
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end
	
	
	
	
	


HitpartFunk3 = function(HPart3,Xv,Yv,Zv)
	
Hitpart3 = Instance.new("Part",HPart3)
RemoveOutlines(Hitpart3)
Hitpart3.Size = Vector3.new(1,1,1)
Hitpart3.CanCollide = false
HuW3 = Instance.new("Weld")
HuW3.Name = "GuW"
HuW3.Part0 = HPart3 
HuW3.C0 = cn(Xv, Yv, Zv)
HuW3.C1 = cn(0, 0, 0) 
HuW3.Part1 = Hitpart3
HuW3.Parent = HPart3
Hitpart3.Transparency = 1
game:GetService("Debris"):AddItem(Hitpart3, 20)
end

HitpartFunk2 = function(HPart2,Xv,Yv,Zv)
	
Hitpart2 = Instance.new("Part",HPart2)
RemoveOutlines(Hitpart2)
Hitpart2.Size = Vector3.new(1,1,1)
Hitpart2.CanCollide = false
HuW2 = Instance.new("Weld")
HuW2.Name = "GuW"
HuW2.Part0 = HPart2 
HuW2.C0 = cn(Xv, Yv, Zv)
HuW2.C1 = cn(0, 0, 0) 
HuW2.Part1 = Hitpart2
HuW2.Parent = HPart2
Hitpart2.Transparency = 1
game:GetService("Debris"):AddItem(Hitpart2, 20)
end


HitpartFunk = function(HPart,Min,Max,Xv,Yv,Zv,atype,kb)
	
Hitpart = Instance.new("Part",HPart)
RemoveOutlines(Hitpart)
Hitpart.Size = Vector3.new(1,1,1)
Hitpart.CanCollide = false
HuW = Instance.new("Weld")
HuW.Name = "GuW"
HuW.Part0 = HPart 
HuW.C0 = cn(Xv, Yv, Zv)
HuW.C1 = cn(0, 0, 0) 
HuW.Part1 = Hitpart
HuW.Parent = HPart 
Hitpart.Transparency = 1
game:GetService("Debris"):AddItem(Hitpart2, 20)
MagniDamage(Hitpart, 4.5, Min, Max, kb, atype)

end
HitpartFunk4 = function(HPart,Min,Max,Xv,Yv,Zv,atype,kb)
	
Hitpart4 = Instance.new("Part",HPart)
RemoveOutlines(Hitpart4)
Hitpart4.Size = Vector3.new(1,1,1)
Hitpart4.CanCollide = false
HuW4 = Instance.new("Weld")
HuW4.Name = "HuW4"
HuW4.Part0 = HPart 
HuW4.C0 = cn(Xv, Yv, Zv)
HuW4.C1 = cn(0, 0, 0) 
HuW4.Part1 = Hitpart4
HuW4.Parent = HPart 
Hitpart4.Transparency = 1
game:GetService("Debris"):AddItem(Hitpart4, 1.5)
MagniDamage(Hitpart4, 6.5, Min, Max, kb, atype)

end


HitboxFunction = function(Pose,lifetime,siz1,siz2,siz3,Radie,Min,Max,kb,atype)
	
Hitboxpart = Instance.new("Part",Character)
RemoveOutlines(Hitboxpart)
Hitboxpart.Size = Vector3.new(siz1,siz2,siz3)
Hitboxpart.CanCollide = false
Hitboxpart.Transparency = 1
Hitboxpart.Anchored = true
Hitboxpart.CFrame = Pose
game:GetService("Debris"):AddItem(Hitboxpart, lifetime)
MagniDamage(Hitboxpart, Radie, Min, Max, kb, atype)

end


wait2 = false


combo = 1




duljump = false
duljump2 = false
jumpatck = false
		mouse.KeyDown:connect(function(k)
if k == "0" then	
	
Runkey = true

end 










 if k == "e" and attack == false then	
attack = true
	
Humanoid.WalkSpeed = 0	

							CreateSound("http://www.roblox.com/asset/?id=135305162", Torso, 2, 1)

for i = 0, 2, 0.1 do
        swait()

			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-30 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(135 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.2)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(135 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.2)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)		
		

		
end	

for i = 0, 4, 0.1 do
        swait()

			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-0 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(25)), 0.05)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-25)), 0.05)
					RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1, -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)		
		

		
end	
for i = 0, 1 do
for i = 0, 1, 0.1 do
        swait()

			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-30 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 ,0)* LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)		
		

		
end	
for i = 0, 1, 0.1 do
        swait()

			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 0, -1.1) * angles(math.rad(0), math.rad(0), math.rad(0)), .1)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-15 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.1)
					RH.C0 = clerp(RH.C0, cn(1, -1, 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1, -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.8) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.1)		
		

		
end		
end

Humanoid.WalkSpeed = 16	

attack = false




end

















end)	
hitwait = false 
function onTouch(part)

local humanoid = part.Parent:findFirstChild("Humanoid")
local model = part.Parent
local torso = part.Parent:FindFirstChild("Torso")
local head = part.Parent:findFirstChild("Head")
local leftleg = part.Parent:findFirstChild("Left Leg")
local rightleg = part.Parent:findFirstChild("Right Leg")
local leftarm = part.Parent:findFirstChild("Left Arm")
local rightarm = part.Parent:findFirstChild("Right Arm")

	if hitwait == false and attack == false and model.Name == "Effects" == false and Runkey == true then
	
hitwait = true			


	

if (humanoid ~=nil) and humanoid.Health >0.01 and  Torsovelocity > 1 then

	 if IKM == true then
Effects.Sphere.Create(BrickColor.new("Really black"), FrontPart.CFrame * cn(0, -0, 0), 50, 50, 50, 40,40,40, 0.1)	
Effects.Sphere.Create(BrickColor.new("Really red"), FrontPart.CFrame * cn(0, -0, 0), 50, 50, 50, 20,20,20, 0.05)		
model:BreakJoints() 

else
Effects.Sphere.Create(BrickColor.new("White"), FrontPart.CFrame * cn(0, -0, 2), 100, 100, .1, 12,12,0, 0.1)	
Effects.Sphere.Create(BrickColor.new("White"), FrontPart.CFrame * cn(0, -0, 2), 100, 100, 20, 1,1,1, 0.08)	
MagniDamage(FrontPart, 6.5, 6, 6, .3, "Knockdown")

	end

attack = true
Humanoid.WalkSpeed = 0	
							local bodyVelocity2 = Create("BodyVelocity")({velocity = Vector3.new(0, 1, 0)-RootPart.CFrame.lookVector*1500, P = 50000, maxForce = Vector3.new(80000, 80000, 80000), Parent = Torso})

							game:GetService("Debris"):AddItem(bodyVelocity2, 0.11)
							
for i = 0, .5, 0.1 do
        swait()

			  		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cn(0.05, 1, -0.5) * angles(math.rad(1), math.rad(0), math.rad(0)), .2)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-30 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(-0)), .1)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.01 * math.cos(sine / 8), -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.2)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.01 * math.cos(sine / 8) , -.0) * angles(math.rad(45 - 1 * math.cos(sine / 8)), math.rad(0), math.rad(0)), 0.2)
					RH.C0 = clerp(RH.C0, cn(1, -1 - 0.1 * math.cos(sine / 8), 0) * RHCF * angles(math.rad(-6), math.rad(0), math.rad(90 + .05 * math.cos(sine / 25))), .1)
					LH.C0 = clerp(LH.C0, cn(-1, -1 - 0.1 * math.cos(sine / 8), -.0) * LHCF * angles(math.rad(6), math.rad(-0), math.rad(-90 + .05 * math.cos(sine / 25))), .1)
SWW.C0 = clerp(SWW.C0, CFrame.new(0,-1.5,-.3) * angles(math.rad(-0),math.rad(-180),math.rad(0)), 0.3)		
		

		
end	

	
Humanoid.WalkSpeed = 16	
end
attack = false
wait(.08)
hitwait = false	
	end
	
	end
FrontPart.Touched:connect(onTouch)



				mouse.KeyUp:connect(function(k)
if k == "0"then	
Runkey = false

end 


			
		


				end)
				
humHsave = Humanoid.Health 				
function GainCharge(Humanoid)
if	Humanoid.Health == 0 then		
			equipped = false
			end
if blocking == true then

humDsave = Humanoid.Health
humDsave = humHsave - humDsave
if humDsave >0.01 then

CFuncs.Sound.Create("http://www.roblox.com/asset/?id=260433850", Torso, 1, .5)	
BlockEffect( BrickColor.new("Really red"), Torso.CFrame, 42, 42, 22, 0.1,0.1,0.1,              0.02,2)	
BlockEffect( BrickColor.new("Really red"), RightArm.CFrame, 22, 42, 22, 0.1,0.1,0.1,          0.02,2)	
BlockEffect( BrickColor.new("Really red"), LeftArm.CFrame, 22, 42, 22, 0.1,0.1,0.1,           0.02,2)	
BlockEffect( BrickColor.new("Really red"), RightLeg.CFrame, 22, 42, 22, 0.1,0.1,0.1,           0.02,2)	
BlockEffect( BrickColor.new("Really red"), LeftLeg.CFrame, 22, 42, 22, 0.1,0.1,0.1,            0.02,2)	
humDsave = humDsave/3
end
if humDsave <0 then


Effects.Sphere.Create(BrickColor.new("Lime green"), RootPart.CFrame * cn(0, -2.97, 0), 10, 5, 10, 15,-.1,15, 0.05)
--[[
BlockEffect( BrickColor.new("Lime green"), Torso.CFrame, 41, 41, 21, 0,0,0,             0.1,2)	
BlockEffect( BrickColor.new("Lime green"), RightArm.CFrame, 21, 41, 21, 0,0,0,          0.1,2)	
BlockEffect( BrickColor.new("Lime green"), LeftArm.CFrame, 21, 41, 21, 0,0,0,           0.1,2)	
BlockEffect( BrickColor.new("Lime green"), RightLeg.CFrame, 21, 41, 21, 0,0,0,          0.1,2)	
BlockEffect( BrickColor.new("Lime green"), LeftLeg.CFrame, 21, 41, 21, 0,0,0,           0.1,2)	
--]]
humDsave = humDsave*2.5
end

humHsave = humHsave - humDsave




end

end

 Humanoid.HealthChanged:connect(function() GainCharge(Humanoid) end) 				
				
				
	OnDeath = function()			

		equipped = false
		
			
				
		end		
			
Humanoid.Died:connect(function()OnDeath(Character)end)

					
				
				print('Created By Draconix')
for i,v in pairs ((game:GetService("Workspace").non.BumperCar:GetChildren())) do
	if v:IsA("Part") or v:IsA("Instance") or v:IsA("Wedge") or v:IsA("Handle") then
		v.Transparency = 1
	end

end
