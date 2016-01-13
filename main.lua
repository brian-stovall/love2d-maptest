function love.load()
	key = 'no key pressed yet.'
	avatar = love.graphics.newImage('image/avatar.png')
	anims = {}
	anims['up'] = {}
	anims['left'] = {}
	anims['down'] = {}
	anims['right'] = {}
	for i = 0, 8 do
		anims['up'][i+1] = love.graphics.newQuad(i*64, 0, 64, 64, avatar:getDimensions())
		anims['left'][i+1] = love.graphics.newQuad(i*64, 64, 64, 64, avatar:getDimensions())
		anims['down'][i+1] = love.graphics.newQuad(i*64, 128, 64, 64, avatar:getDimensions())
		anims['right'][i+1] = love.graphics.newQuad(i*64, 192, 64, 64, avatar:getDimensions())
	end
	frame = 1
	framerate = 6.5
	fullSecs = 0
	walkSpeed = 140 -- walking speed in px/sec
	avatarX = 250
	avatarY = 250
	stopped = true
	direction = 'down'
end

function love.update(dt)
	--animation frame selecting code
	if stopped == true then
		frame = 1
	else
		fullSecs = fullSecs + dt * framerate
		if fullSecs >= 1 then
			frame = frame + math.floor(fullSecs)
			fullSecs = fullSecs - math.floor(fullSecs)
		end
		if frame > 9 then frame = (frame % 9) + 1 end
	end
	-- movement code
	if stopped == false then
		if direction == 'right' then
			avatarX = avatarX + walkSpeed * dt
		elseif direction == 'left' then
			avatarX = avatarX - walkSpeed * dt
		elseif direction == 'up' then
			avatarY = avatarY - walkSpeed * dt
		elseif direction == 'down' then
			avatarY = avatarY + walkSpeed * dt
		end
	end

end

function love.keypressed( keyPress, scancode, isrepreat )
	if keyPress == 'escape' then love.event.quit() end
	stopped = false
	direction = keyPress
end

function love.keyreleased( keyPress )
	if keyPress == direction then stopped = true end
end

function love.draw()
		love.graphics.draw(avatar, anims[direction][frame], avatarX, avatarY, 0, 2)
		love.graphics.print(direction, 0, 0)
end
