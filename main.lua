function love.load()
	spriteList =  {}
	local avatar = Sprite('image/avatar.png') 
	avatar = makeAnims(avatar, {'up', 'left', 'down', 'right'}, 9, 6.5, 64, 64)
	spriteList['avatar'] = avatar
	spriteList.avatar['changeFrame'] = function (sprite, dt) 
		--animation frame selecting code
		if sprite.stopped == true then
			sprite.frame = 1
		else
			sprite.fullSecs = fullSecs + dt * framerate
			if sprite.fullSecs >= 1 then
				sprite.frame = sprite.frame + math.floor(sprite.fullSecs)
				sprite.fullSecs = sprite.fullSecs - math.floor(sprite.fullSecs)
			end
			if sprite.frame > 9 then sprite.frame = (sprite.frame % 9) + 1 end
		end
	end
	
	spriteList.avatar.costume = 'up'
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
		if sprite.changeFrame ~= nil then sprite.changeFrame(sprite, dt) end
	end
end

function love.keypressed( keyPress, scancode, isrepreat )
	if keyPress == 'escape' then love.event.quit() end
	local isLegal = false
	for k in pairs({'up', 'left', 'down', 'right'}) do
		if keyPress == k then isLegal = true end
	end
end

function love.keyreleased( keyPress )
	--if keyPress == direction then stopped = true end
end

function love.draw()
		--love.graphics.draw(avatar, anims[direction][frame], avatarX, avatarY, 0, 2)
end
