--dCore - Commissar Dinxy's Personal API
--Version 0.0.1 Alpha
--Last updated 2018-11-12

--Clears screen and sets cursor position to 1, 1.
function clearScrn()
    term.clear()
    term.setCursorPos(1, 1)
end

--Exits program and clears screen.
function cExit()
    print("Exiting...")
    sleep(1)
    clearScrn()
    error()
end
--Moves cursor position down by 1.
function newLine()
    xPos, yPos = term.getCursorPos()
    term.setCursorPos(1, (yPos + 1))
end
--Scans each side for a peripheral and returns the side as string. If no side is found, returns "false". Modified version of function from willwac.
function prFind(device)
    local sides = {"top", "bottom", "left", "right", "front", "back"}
    local trueSide = 0
    local device
    for s=1, 6 do
        if peripheral.getType(sides[s]) == device then
            trueSide = sides[s]
    end
end
    if trueSide ~=0 then
        return trueSide
    else
        return "false"
    end
end

--Centres cursor position. Full credit to Pharap.
monitorprintcentred = function(text, side)
    local monitor = peripheral.wrap(side)
    local maxw, maxh = monitor.getSize() --screen dimensions
    local curx, cury = monitor.getCursorPos() --cursor pos
    
    monitor.setCursorPos((maxw-#text)/2,cury) --set it to the point where write will make the text centred
    monitor.write(text) --write the text
    monitor.setCursorPos(curx,cury+1) --return the cursor to the same position on the next line
    end