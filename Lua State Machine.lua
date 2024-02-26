-- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- Author & Concept Designer: Luke Chikkala
-- ------------------------------------------------------------------------------------------------------------------------------------------------------
-- A lua state machine is a mechanism that checks the state of a value until it's changed.
-- When the state is changed, it prints the state it has been changed to once.
-- ------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                      ┌────────────────────────┐
--                                                      │ Player_Active = true ? │
--                                                      └────┬──────────────┬────┘
--                                                           │              │
--                               ┌───────────────────────────┘              └───────────────────────────┐
--                               │                                                                      │   
--                            ┌──┴──┐                                                                ┌──┴──┐
--                            │ Yes │                                                                │ No  │
--                            └──┬──┘                                                                └──┬──┘
--                               │                                                                      │
--                ┌──────────────┴───────────────┐                                       ┌──────────────┴──────────────┐
--                │ Player_Alive_Status = true ? │                                       │ Player_Dead_Status = true ? │
--                └──────────┬─────────┬─────────┘                                       └──────────┬─────────┬────────┘
--                           │         │                                                            │         │               
--                 ┌─────────┘         └─────────┐                                        ┌─────────┘         └─────────┐   
--                 │                             │                                        │                             │   
--              ┌──┴──┐                       ┌──┴──┐                                  ┌──┴──┐                       ┌──┴──┐
--              │ Yes │                       │ No  │                                  │ Yes │                       │ No  │
--              └──┬──┘                       └──┬──┘                                  └──┬──┘                       └──┬──┘
--                 │                             │                                        │                             │   
--  ┌──────────────┴─────────────┐      ┌────────┴────────────────────┐     ┌─────────────┴──────────────┐      ┌───────┴─────────────────────┐
--  │ print( "Player :: Alive" ) │      │ Player_Dead_Status = true   │     │ print( "Player :: Dead" )  │      │ Player_Alive_Status = true  │
--  └──────────────┬─────────────┘      └─────────────────────────────┘     └──────────────┬─────────────┘      └─────────────────────────────┘
--                 │                                                                       │               
-- ┌───────────────┴─────────────┐                                          ┌──────────────┴──────────────┐
-- │ Player_Alive_Status = false │                                          │ Player_Dead_Status = false  │
-- └─────────────────────────────┘                                          └─────────────────────────────┘
-- ------------------------------------------------------------------------------------------------------------------------------------------------------

return function()
    local MySequence  = DataPool().Sequences[ 1 ]
    local SendSequOn  = true
    local SendSequOff = true

    while true do
        if MySequence:HasActivePlayback() == true then             -- Sequ :: ON
            if SendSequOn  == true then
                Echo( "Sequ :: ON" )
                SendSequOn  = false
            else
                SendSequOff = true
            end
        elseif MySequence:HasActivePlayback() == false then        -- Sequ :: OFF
            if SendSequOff == true then
                Echo( "Sequ :: OFF" )
                SendSequOff = false
            else
                SendSequOn  = true
            end
        end
    end
end
