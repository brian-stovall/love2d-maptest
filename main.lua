function love.load()
	spriteList =  []
	local avatar = Sprite('image/avatar.png') 
	avatar = makeAnims(avatar, ['up', 'left', 'down', 'right'], 9, 6.5, 64, 64)
	spriteList['avatar'] = avatar
	spriteList.avatar.dress = function () {
		--animation frame selecting code
		if sprite.stopped == true then
			sprite.frame = 1
		else
			sprite.fullSecs = fullSecs + dt * framerate
			if fullSecs >= 1 then
				frame = frame + math.floor(fullSecs)
				fullSecs = fullSecs - math.floor(fullSecs)
			end
			if frame > 9 then frame = (frame % 9) + 1 end
		end
	}
end


function Sprite( imageDir, x, y, dx, dy) 
	local spriteT = {}
	spriteT['img'] = love.graphics.newImage(imageDir)
	spriteT.x = x or 0
	spriteT.y = y or 0
	spriteT.dx = dx or 0
	spriteT.dy = dy or 0
	sprite.animated = false
  return spriteT
end

--costume names should be entered from top to bottom of spritesheet
function makeAnims (sprite, costumes, framesPerRow, frameRate, cellHeight, cellWidth)
	sprite.animated = true
	sprite.stopped = true
	sprite.fullSecs = 0
	sprite.frame = 1
	local dim = sprite.img:getDimensions()
	for v, k in pairs(costumes) do
		for i = 0, framesPerRow - 1 do
			sprite.costumes[k][i+1] = love.graphics.newQuad(i*cellWidth, (v-1) * cellHeight, cellWidth, cellHeight, dim)
		end
	end
	sprite.frameRate = frameRate
	return sprite
end

function love.update(dt)
	for sprite in spriteList do
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
end

function love.keypressed( keyPress, scancode, isrepreat )
	if keyPress == 'escape' then love.event.quit() end
	local isLegal = false
	for k in pairs(anims) do
		if keyPress == k then isLegal = true end
	end
	if isLegal == true then
		stopped = false
		direction = keyPress
	end
end

function love.keyreleased( keyPress )
	if keyPress == direction then stopped = true end
end

function love.draw()
		love.graphics.draw(avatar, anims[direction][frame], avatarX, avatarY, 0, 2)
		love.graphics.print(direction, 0, 0)
end
