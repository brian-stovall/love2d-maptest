function love.load()
	spriteList =  {}
	local avatar = Sprite('image/avatar.png') 
	avatar.speed = math.floor(.25 * love.graphics.getWidth())
	avatar.scale = .17 * love.graphics.getWidth() / 64
	avatar = makeAnims(avatar, {'up', 'left', 'down', 'right'}, 9, 6.5, 64, 64)
	spriteList['avatar'] = avatar
	spriteList.avatar['changeFrame'] = function (sprite, dt) 
		--animation frame selecting code
		if sprite.stopped == true then
			sprite.frame = 1
		else
			sprite.fullSecs = sprite.fullSecs + dt * sprite.frameRate
			if sprite.fullSecs >= 1 then
				sprite.frame = sprite.frame + math.floor(sprite.fullSecs)
				sprite.fullSecs = sprite.fullSecs - math.floor(sprite.fullSecs)
			end
			if sprite.frame > 9 then sprite.frame = (sprite.frame % 9) + 1 end
		end
	end

	spriteList.avatar.walk = function (direction) 
		local avatar = spriteList.avatar
		avatar.costume = direction
		avatar.stopped = false
		if direction == 'down' then avatar.dy = avatar.speed
		elseif direction == 'up' then avatar.dy = -avatar.speed
		elseif direction == 'right' then avatar.dx = avatar.speed
		elseif direction == 'left' then avatar.dx = -avatar.speed
		end
  end

	spriteList.avatar.stop = function(direction)
		local avatar = spriteList.avatar
		if direction == 'down' or direction == 'up' then avatar.dy = 0
		elseif direction == 'right' or direction == 'left' then avatar.dx = 0
		end
		if avatar.dx == 0 and avatar.dy == 0 then avatar.stopped = true end
	end

	spriteList.avatar.costume = 'down'
end


function Sprite( imageDir, x, y, dx, dy) 
	local spriteT = {}
	spriteT['img'] = love.graphics.newImage(imageDir)
	spriteT.x = x or 0
	spriteT.y = y or 0
	spriteT.dx = dx or 0
	spriteT.dy = dy or 0
	spriteT.animated = false
  return spriteT
end

--costume names should be entered from top to bottom of spritesheet
function makeAnims (sprite, costumes, framesPerRow, frameRate, cellHeight, cellWidth)
	sprite.animated = true
	sprite.stopped = true
	sprite.fullSecs = 0
	sprite.frame = 1
	sprite.costumes = {}
	local dimW, dimH = sprite.img:getDimensions()
	for k, v in pairs(costumes) do
			sprite.costumes[v] = {}
		for i = 0, framesPerRow - 1 do
			sprite.costumes[v][i+1] = 
			love.graphics.newQuad(i*cellWidth, (k-1) * cellHeight, cellWidth, cellHeight, dimW, dimH)
		end
	end
	sprite.frameRate = frameRate
	return sprite
end

function love.update(dt)
	for _, sprite in pairs(spriteList) do
		sprite.x = sprite.x + sprite.dx * dt
		sprite.y = sprite.y + sprite.dy * dt
		if sprite.changeFrame ~= nil then sprite.changeFrame(sprite, dt) end
	end
end

function love.keypressed( keyPress, scancode, isrepreat )
	if keyPress == 'escape' then love.event.quit() end
	local isLegal = false
	for _, v in pairs({'up', 'left', 'down', 'right'}) do
		if keyPress == v then isLegal = true end
	end
	if isLegal == true then
		spriteList.avatar.walk(keyPress)
	end
end

function love.keyreleased( keyPress )
	local isLegal = false
	for _, v in pairs({'up', 'left', 'down', 'right'}) do
		if keyPress == v then isLegal = true end
	end
	if isLegal == true then
		spriteList.avatar.stop(keyPress)
	end
end

function love.draw()
	for _, sprite in pairs(spriteList) do
		love.graphics.draw(sprite.img, sprite.costumes[sprite.costume][sprite.frame], 
		sprite.x, sprite.y, 0, sprite.scale)
		love.graphics.print(sprite.scale, 0,0)
	end
end
