------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creating Views
function addScreenContent(windowName, screenNumber, x, y, width, height, PoolType)
	local windowCollect = CurrentUser().ScreenConfig:Ptr(1):Ptr(screenNumber)
	local win = windowCollect:Append()
	win.Name = windowName
	win.Display = screenNumber - 1
	win.MinH = 1
	win.MinW = 1
	win.X = x
	win.Y = y
	win.W = width
	win.H = height
	win.PresetPoolType = PoolType
	return win
end

local function GetScreenRows(display)
	local display = GetDisplayByIndex(display);
	local screen = display:FindRecursive("UiScreen", "UiScreen");
	local rows = screen.Rows;
	local columns = screen.Columns;
	return columns, rows, centerColumn, centerRow
end

local function CreateView_Presets(dispIndex, columns, rows, centerColumn, centerRow)
	--				  							  Window Name			Display		 X		 Y		 W		 H	PresetPoolType
	local ThreeDWin			=	addScreenContent("Window3D",			   1,		 0,		 0,		20,		15				)
								addScreenContent("WindowMatricks",		   1,		 0,		15,		20, 	 7				)
								addScreenContent("WindowSelectionView",	   1,		20,		10,		18,		12,		20		)
								addScreenContent("WindowPresetPool",	   1,		38,		16,		10,		 6				)
								addScreenContent("WindowGroupPool",		   1,		20,		 0,		14,		 8				)
								addScreenContent("WindowPresetPool",	   1,		34,		 0,		14,		 2, 	0		)
								addScreenContent("WindowPresetPool",	   1,		34,		 2,		14,		 6, 	1		)
								addScreenContent("WindowPresetPool",	   1,		38,		10,		10,		 2, 	2		)
								addScreenContent("WindowPresetPool",	   1,		20,		 8,		28,		 2, 	3		)
								addScreenContent("WindowPresetPool",	   1,		38,		12,		10,		 2, 	4		)
								addScreenContent("WindowPresetPool",	   1,		38,		14,		10,		 2, 	5		)
	coroutine.yield(0.5)
	local ThreeDWinSettings							= ThreeDWin["View3DSettings"]
		  ThreeDWinSettings["ShowTitleBar"]			= "No"
		  ThreeDWinSettings["MarkUnpatched"]		= "No"
		  ThreeDWinSettings["PointOfOrigin"]		= "No"
		  ThreeDWinSettings["ShowSelection"]		= "No"
		  ThreeDWinSettings["BeamIntensity"]		= "4194304.0000"
		  ThreeDWinSettings["SpotIntensity"]		= "4194304.0000"
		  ThreeDWinSettings["AmbientIntensity"]		= "0.0000"
		  ThreeDWinSettings["PointLightIntensity"]	= "4194304.0000"
		  ThreeDWinSettings["ShowToolBar"]			= "No"

	Cmd("Store View /Screen '" .. dispIndex .. "' 'Presets' ")
	Cmd("Assign View \"Presets\" At ViewButton 1.10")
end

local function CreateViews()
	-- Dummy IntVariable
	local i = 0

	-- Delete Default Views
	Cmd("Delete Screencontent Thru.Thru")
	Cmd("Store ViewButton 1.9 /nc");
	Cmd("Label ViewButton 1.9 \"Clear\"");
	Cmd("View \"Clear\"")

	local dispIndex = 1
	local rows
	local columns
	local centerRow
	local centerColumn
	
	columns, rows, centerColumn, centerRow = GetScreenRows(dispIndex)

	-- Create View 2 : Presets
	CreateView_Presets(dispIndex, columns, rows, centerColumn, centerRow)
	Cmd("View \"Clear\"")
end
------------------------------------------------------------------------------------------------------------------------------------------------------
local function main()
	CreateViews()
end

return main