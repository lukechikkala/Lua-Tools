local function TextBox( title )
	if type( title ) == "string" then
		local Title_Length = string.len( title )
		print( "Length: " .. Title_Length )
		print( "╭─" .. string.rep( "─", Title_Length ) .. "─╮" )
		print( "│ " .. title .. " │" )
		print( "╰─" .. string.rep( "─", Title_Length ) .. "─╯" )
	end
end

TextBox( "9" )
