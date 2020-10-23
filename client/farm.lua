-- Rüstest eine Spitzhacke und Hacke aus die im ersten und zweitem Slot liegen.
function equip()

    turtle.select(1)
    turtle.equipLeft()
    turtle.select(2)
    turtle.equipRight()
	
end

-- Baut den Boden ab sofern es sich um keine Erde handelt und erstellt eine Farm.
function createFarm()
	for p=1,feldX do
		for i=1,feldY do
		
			turtle.select(1)
			turtle.digDown(right)
			checkAndSelectDirt()
			turtle.placeDown()
			turtle.forward()
			
		end
		
		if p < feldX then
			if p % 2 == 0 then
			
				turtle.turnLeft()
				turtle.forward()	
				turtle.turnLeft()	
				turtle.forward()
				
			else
			
				turtle.turnRight()
				turtle.forward()
				turtle.turnRight()
				turtle.forward()
				
			end
		end
	end
	
	turtle.up()
	turtle.turnLeft()
	turtle.turnLeft()
	turtle.forward()
	
	for p=1,feldX do
		for i=1,feldY do
			
			turtle.digDown(left)
			turtle.select(15)
			turtle.placeDown()			
			turtle.forward()
			
		end
		
		if p < feldX then
			if feldX % 2 then
				if p % 2 == 0 then
				
					turtle.turnRight()
					turtle.forward()
					turtle.turnRight()
					turtle.forward()
					
				else
					
					turtle.turnLeft()
					turtle.forward()	
					turtle.turnLeft()	
					turtle.forward()				
			
				end
			else
				if p % 2 == 0 then
					
					turtle.turnLeft()
					turtle.forward()	
					turtle.turnLeft()	
					turtle.forward()	
					
				else			
				
					turtle.turnRight()
					turtle.forward()
					turtle.turnRight()	
					turtle.forward()	
					
				end
			end		
		else
			
			turtle.turnLeft()
			turtle.turnLeft()
			turtle.down()
			
		end
	end
	
	turtle.select(1)
	
end

-- Zum nachfüllen vom Fuel
function getFuel()

    slot = turtle.getSelectedSlot()
	
    for i=1,16 do
	
        turtle.select(i)
        turtle.refuel()
		
    end
	
    turtle.select(slot)
	
end

function checkFuel()
	while turtle.getFuelLevel() <= 100 do
	
		clr()
		os.setComputerLabel("Benötige Fuel")
		print("Bitte lege etwas Fuel in einem Slot der Turtle.")
		sleep(2)
		
		getFuel()
		
	end
	
	os.setComputerLabel(label)

end

function checkAndSelectDirt()	
	while turtle.getItemCount(13) == 0 and turtle.getItemCount(14) == 0 do
	
		clr()
		os.setComputerLabel("Benötige Erde")
		print("Bitte lege Erde in Slot 13 oder/und 14!")
		sleep(2)
		
	end
	
	os.setComputerLabel(label)
	
	if turtle.getItemCount(13) > 0 then
	
		turtle.select(13)
		
		else if turtle.getItemCount(14) > 0 then
		
			turtle.select(14)
			
		else
		
			checkDirt()
			
		end
	end	
end

function clr()

	shell.run("clear")
	
end

-- Eigentliches Programm

feldX = 8
feldY = 8



label = os.getComputerLabel()
turtle.select(1)
clr()
checkFuel()
createFarm()