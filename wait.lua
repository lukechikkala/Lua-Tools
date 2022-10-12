local function wait( seconds )
    local time_init = os.clock() + seconds
	while true do
		if os.clock() >= time_init then break end
	end
end

while true do
	print("Hello")
	wait(1)
end