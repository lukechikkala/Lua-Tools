-- Test 1: LC

local function main()
    ----------------------------------------------------------------------------------------------------
    local startMem = collectgarbage("count")
    ----------------------------------------------------------------------------------------------------
    Cmd( "Call Plugin 3" )
    ----------------------------------------------------------------------------------------------------
    local start_time = os.clock()
    ----------------------------------------------------------------------------------------------------
    local MySequence = DataPool().Sequences[ 1 ]
    local x          = 1
    ----------------------------------------------------------------------------------------------------
    local SendSequOn  = true
    local SendSequOff = true
    ----------------------------------------------------------------------------------------------------
    while x < 1000 do
        if MySequence:HasActivePlayback() == true then      -- Sequ is ON
            if SendSequOn == true then
                Echo( "Sequ is ON" )
                SendSequOn = false
            else
                SendSequOff = true
            end
        elseif MySequence:HasActivePlayback() == false then -- Sequ is OFF
            if SendSequOff == true then
                Echo( "Sequ is Off" )
                SendSequOff = false
            else
                SendSequOn = true
            end
        end
        coroutine.yield( { root = 10 } )
        ----------------------------------------------------------------------------------------------------
        x = x + 1
        ----------------------------------------------------------------------------------------------------
    end
    ----------------------------------------------------------------------------------------------------
    local end_time = os.clock()
    Printf( "LC Plugin Test " .. GetVar(UserVars(), "RunNumber"))
    Printf("Elapsed time: " .. (end_time - start_time) .. " seconds")
    ----------------------------------------------------------------------------------------------------
    SetVar(UserVars(), "RunNumber", GetVar(UserVars(), "RunNumber") + 1)
    ----------------------------------------------------------------------------------------------------
    local endMem = collectgarbage("count")
    Printf("Memory used: " .. (endMem - startMem) .. " Kbytes")
    ----------------------------------------------------------------------------------------------------

end

return main