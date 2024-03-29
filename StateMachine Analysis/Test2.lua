-- Test 2: YB

local function send_midi_message(state)
    if state then
        Echo('sequence is on')
    else
        Echo('sequence is off')
    end    
end

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
    local last_status = MySequence:HasActivePlayback()
    while x < 1000 do
        local current_status = MySequence:HasActivePlayback()
        if last_status ~= current_status then
            last_status = current_status
            send_midi_message(last_status)
        end
        coroutine.yield( { root = 10 } )
        x = x + 1
    end
    ----------------------------------------------------------------------------------------------------
    local end_time = os.clock()
    Printf( "YB Plugin Test " .. GetVar(UserVars(), "RunNumber"))
    Printf("Elapsed time: " .. (end_time - start_time) .. " seconds")
    ----------------------------------------------------------------------------------------------------
    SetVar(UserVars(), "RunNumber", GetVar(UserVars(), "RunNumber") + 1)
    ----------------------------------------------------------------------------------------------------
    local endMem = collectgarbage("count")
    Printf("Memory used: " .. (endMem - startMem) .. " Kbytes")
    ----------------------------------------------------------------------------------------------------
end

return main