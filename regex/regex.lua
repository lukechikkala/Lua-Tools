--[[

    Author   : Luke Chikkala
    Function : regex_LC ( File_Location, Qualifier, PreText, PostText )
        File_Location : Absolute path of the file including 'filename' and the 'file extension'.
        Qualifier     : This regex expression will filter all the lines that qualify to the regex.
        PreText       : This regex expression will select all the text before our desired text.
        PostText      : This regex expression will select all the text after our desired text.
    Return   : table

]]--

local function regex_LC ( File_Location, Qualifier, PreText, PostText )
    local line, text, key, value, df, i
    local matches = {}

    for line in io.lines( File_Location ) do
        for text in line:gmatch( Qualifier ) do
            matches[ #matches + 1 ] = text:gsub( PostText, "" )
        end
    end

    i = 1
    for key, value in pairs( matches ) do
        matches[ i ] = value:gsub( PreText, "" )
        i = i+ 1
    end

    i = 1
    for key, value in pairs( matches ) do
        if type( value ) == "string" then
            matches[ i ] = value
            i = i + 1
        end
    end
    return matches
end

--[[ Example ]]-------------------------------------------------------------------------------------

local MyFile      = "C:\\dev\\Lua\\Lua-Tools\\regex\\SampleText.xml"
local MyQualifier = "\" ID=.*"
local MyPreText   = ".* ID=\""
local MyPostText  = "\" Attribute=.*"

local REG_THIS = regex_LC ( MyFile, MyQualifier, MyPreText, MyPostText )