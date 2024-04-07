--[ Define "Player" class ]-------------------------------------------------------------------------
local Player    = {}
Player.__index  = Player -- Fail safe mechanism to fall back to Class
Player.Name     = "NaN"
Player.X        = 0
Player.Y        = 0

--[ Define a constructor that initializes default values for "Player" Objects ]---------------------
Player.new = function( A, B, C )
    local self = setmetatable( {}, Player )
    self.Name  = A
    self.X     = B
    self.Y     = C
    return self
end

--[ Define further methods ]------------------------------------------------------------------------
function Player:GetCoordinates()
    print( "Player " .. self.Name .. " is at ( " .. self.X .. ", " .. self.Y .. " )" )
end

function Player:GetName()
    print( "Player's Name: " .. self.Name )
end

function Player:SetName( NewName )
    self.Name = NewName
end
----------------------------------------------------------------------------------------------------
-- Creating a new Object, "LC" of class "Player"; aka, "LC" is an instance of "Player"
local LC = Player.new( "Luke", 2, 4 )
LC:GetCoordinates()

-- Since Y-coordinate is not mentioned for Object-YB, the value from contructor, 0, is taken here.
local YB = Player.new( "Yuri", 2 )
YB:GetCoordinates()

----------------------------------------------------------------------------------------------------
LC:GetName()
LC:SetName( "Chikkala" )
LC:GetName()