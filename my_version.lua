-- video explanation is HERE: https://www.youtube.com/watch?v=Arn8ExQ2Gjg
-- note that some of the code has changed since then (it works better now!)
-- Though, I have since abandoned luamacros, in favor of Interception... which i will abandon in favor of QMK.
-- get luamacros HERE: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
-- plug in your 2nd keyboard, load this script into LUAmacros, and press the triangle PLAY button.
-- Then, press any key on that keyboard to assign logical name ('MACROS') to macro keyboard
clear() --clear the console from last run
local keyboardIdentifier = '3466C14C'
local settingMode = 'true'
local toggleLock = 'locked'
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end


--You need to get the identifier code for the keyboard with name "MACROS"
--This appears about halfway through the SystemID item and looks like 1BB382AF or some other alphanumeric combo.
-- It's usually 7 or 8 characters long.
--Once you have this identifier, replace the value of keyboardIdentifier with it

--Don't ask for keyboard assignment help if the user has manually entered a keyboard identifier
if keyboardIdentifier == '0000AAA' then
	lmc_assign_keyboard('MACROS');
else lmc_device_set_name('MACROS', keyboardIdentifier);
end
--This lists connected keyboards
dev = lmc_get_devices()
for key,value in pairs(dev) do
  print(key..':')
  for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end
print('You need to get the identifier code for the keyboard with name "MACROS"')
print('Then replace the first 0000AAA value in the code with it. This will prevent having to manually identify keyboard every time.')
-- Hide window to tray to keep taskbar tidy
lmc.minimizeToTray = true
--lmc_minimize()


--Start Script
sendToAHK = function (key)
      --print('It was assigned string:    ' .. key)
       local file = io.open("PATH\\keypressed.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!
      --If you didn't put your AutoHotKey scripts into C:/AHK, Make sure to substitute the path that leads to your own "keypressed.txt" file, using the double backslashes.
	  --print("we are inside the text file")
      file:write(key)
      file:flush() --"flush" means "save." Lol.
      file:close()
      lmc_send_keys('{F24}')  -- This presses F24. Using the F24 key to trigger AutoHotKey is probably NOT the best method. Feel free to program something better!

      stringabc = 'abcdefghijklmnopqrstuvwxyz1234567890'
      if string.match(stringabc, key) then
         local myfile = 'PATH\\AllText.txt'
         local file2 = io.open(myfile, "a")
         file2:write(key)
         file2:flush() --"flush" means "save." Lol.
         file2:close()
      end

      stringOneTwoThree =  '1234567890'
      EvaluateKeysNeeded = {"semicolon","singlequote","period","1","0","2","3","4","5","6","7","8","9","minus","equals","leftbracket","rightbracket","backslash"}
      if has_value(EvaluateKeysNeeded, key) then
         GetMode = io.open("PATH\\Mode1.txt", "r")
         io.input(GetMode)
         TheObtainedMode = io.read()
         if TheObtainedMode == 'Evaluate!' then
            StringIWantToAdd = ""
            if string.match(stringOneTwoThree, key) then
               StringIWantToAdd = key
            end
            if key == "minus" then
               StringIWantToAdd = "-"
            end
            if key == "equals" then
               StringIWantToAdd = "+"
            end
            if key == "leftbracket" then
               StringIWantToAdd = "*"
            end
            if key == "rightbracket" then
               StringIWantToAdd = "/"
            end
            if key == "semicolon" then
               StringIWantToAdd = "("
            end
            if key == "singlequote" then
               StringIWantToAdd = ")"
            end
            if key == "period" then
               StringIWantToAdd = "."
            end
            if key == "backslash" then
               local myfileEval = 'PATH\\MACROKEYBOARD\\Evaluating.txt'
               local file2Eval = io.open(myfileEval, "w")
               file2Eval:write("")
               file2Eval:flush()
               file2Eval:close()
            else
               local myfileEval2 = 'PATH\\MACROKEYBOARD\\Evaluating.txt'
               local file2Eval2 = io.open(myfileEval2, "a")
               file2Eval2:write(StringIWantToAdd)
               file2Eval2:flush()
               file2Eval2:close()

            end
         end
         io.close(GetMode)

      end

      --
      if toggleLock == "locked" then
         Thefile = io.open("PATH\\MACROKEYBOARD\\Mode1.txt", "r")
         io.input(Thefile)
         readthetext = io.read()
         print(readthetext)
         if readthetext=='Locked!unlocked' then
            toggleLock = 'unlocked'
         end
         io.close(Thefile)
      else
          if settingMode == 'true' then
             if key == "delete" then
                sendtoAHKMode("Locked!")
                toggleLock = 'locked'
             end
          end
      end

      if (key == "tab" and toggleLock == "unlocked") then
         if settingMode == 'false' then
            settingMode = 'true'
            print('You can set the mode now!')
            sendtoAHKToggle("True!")
         else
             settingMode = 'false'
             print('You cannot set the mode now :(')
             sendtoAHKToggle("False!")
         end
      end

      if (settingMode == 'true'and toggleLock == "unlocked") then
         if key == "escape" then
            sendtoAHKMode("Windows!")
         end
         if key == "F1" then
            sendtoAHKMode("Word!")
         end
         if key == "F2" then
            sendtoAHKMode("Desmos!")
         end
         if key == "F3" then
            sendtoAHKMode("Symbols!")
         end
         if key == "F4" then
            sendtoAHKMode("Tileman!")
         end
         if key == "F5" then
            sendtoAHKMode("Youtube!")
         end
         if key == "F6" then
            sendtoAHKMode("Evaluate!")
         end

      end

end


sendtoAHKMode = function (key)

      local file = io.open("PATH\\MACROKEYBOARD\\Mode1.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!

      file:write(key)
      file:flush()
      file:close()
      --
      local myfile = 'PATH\\MACROKEYBOARD\\AllText.txt'
      local file2 = io.open(myfile, "w")
      file2:write('')
      file2:flush() --"flush" means "save." Lol.
      file2:close()
end
sendtoAHKToggle = function (key)

      local file = io.open("PATH\\MACROKEYBOARD\\Toggle.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!

      file:write(key)
      file:flush()
      file:close()
end

local config = {
	[45]  = "insert",
	[36]  = "home",
	[33]  = "pageup",
	[46]  = "delete",
	[35]  = "end",
	[34]  = "pagedown",
	[27]  = "escape",
	[112] = "F1",
	[113] = "F2",
	[114] = "F3",
	[115] = "F4",
	[116] = "F5",
	[117] = "F6",
	[118] = "F7",
	[119] = "F8",
	[120] = "F9",
	[121] = "F10",
	[122] = "F11",
	[123] = "F12",
	[8]   = "backspace",
	[220] = "backslash",
	[13]  = "enter",
	[16]  = "rShift",
	[17]  = "rCtrl",
	[38]  = "up",
	[37]  = "left",
	[40]  = "down",
	[39]  = "right",
	[32]  = "space",
	[186] = "semicolon",
	[222] = "singlequote",
	[190] = "period",
	[191] = "slash",
	[188] = "comma",
	[219] = "leftbracket",
	[221] = "rightbracket",
	[189] = "minus",
	[187] = "equals",
	[96]  = "num0",
	[97]  = "num1",
	[98]  = "num2",
	[99]  = "num3",
	[100] = "num4",
	[101] = "num5",
	[102] = "num6",
	[103] = "num7",
	[104] = "num8",
	[105] = "num9",

	[106] = "numMult",
    [107] = "numPlus",
    [108] = "numEnter", --sometimes this is different, check your keyboard
	[109] = "numMinus",
    [110] = "numDelete",
	[111] = "numDiv",
    [144] = "numLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects

    [192] = "`",  --this is the tilde key just before the number row
    [9]   = "tab",
    [20]  = "capslock",
    [18]  = "alt",


	[string.byte('Q')] = "q",
	[string.byte('W')] = "w",
	[string.byte('E')] = "e",
	[string.byte('R')] = "r",
	[string.byte('T')] = "t",
	[string.byte('Y')] = "y",
	[string.byte('U')] = "u",
	[string.byte('I')] = "i",
	[string.byte('O')] = "o",
	[string.byte('P')] = "p",
	[string.byte('A')] = "a",
	[string.byte('S')] = "s",
	[string.byte('D')] = "d",
	[string.byte('F')] = "f",
	[string.byte('G')] = "g",
	[string.byte('H')] = "h",
	[string.byte('J')] = "j",
	[string.byte('K')] = "k",
	[string.byte('L')] = "l",
	[string.byte('Z')] = "z",
	[string.byte('X')] = "x",
	[string.byte('C')] = "c",
	[string.byte('V')] = "v",
	[string.byte('B')] = "b",
	[string.byte('N')] = "n",
	[string.byte('M')] = "m",

    [string.byte('0')] = "0",
	[string.byte('1')] = "1",
	[string.byte('2')] = "2",
	[string.byte('3')] = "3",
	[string.byte('4')] = "4",
	[string.byte('5')] = "5",
    [string.byte('6')] = "6",
    [string.byte('7')] = "7",
    [string.byte('8')] = "8",
    [string.byte('9')] = "9",

	--[255] = "printscreen" --these keys do not work
}

sendtoAHKMode("Locked!")
sendtoAHKToggle("True!")
-- define callback for whole device
lmc_set_handler('MACROS', function(button, direction)
	--Ignoring upstrokes ensures keystrokes are not registered twice, but activates faster than ignoring downstrokes. It also allows press and hold behaviour
        if (direction == 0) then return end -- ignore key upstrokes.
	if type(config[button]) == "string" then
                print(' ')
                print('Your key ID number is:   ' .. button)
				print('It was assigned string:    ' .. config[button])
				sendToAHK(config[button])
	else
                print(' ')
                print('Not yet assigned: ' .. button)
	end
end)

