local sti = require "sti"

function love.load()
	spriteList =  {}
	local avatar = Sprite('image/avatar.png') 
	avatar.speed = math.floor(.15 * love.graphics.getWidth())
	avatar.scale = .15 * love.graphics.getWidth() / 64
	avatar.x = 400
	avatar.y = 0
	--the box in which the avatar moves
	avatar.xStop = {['left'] = math.floor(.3 * love.graphics.getWidth()),
									['right'] = math.floor(.7 * love.graphics.getWidth())}
	avatar.yStop = {['top'] = math.floor(.3 * love.graphics.getHeight()),
									['bottom'] = math.floor(.7 * love.graphics.getHeight())}
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
		    if direction == 'down' and avatar.dy == avatar.speed  then avatar.dy = 0
		elseif direction == 'up' and avatar.dy == -avatar.speed  then avatar.dy = 0
		elseif direction == 'right' and avatar.dx == avatar.speed  then avatar.dx = 0
		elseif direction == 'left' and avatar.dx == -avatar.speed  then avatar.dx = 0
		end
		if avatar.dx == 0 and avatar.dy == 0 then avatar.stopped = true end
	end

	spriteList.avatar.costume = 'down'
	
	--load map
  map = sti.new('/map/testMap.lua')
	map.layers['playerStart'].visible = false
	map.layers['blocked'].visible = false
	map:setDrawRange(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	map.totWidth = map.width * map.tilewidth
	map.totHeight = map.height * map.tileheight
	map.x = 0
	map.y = 0
	map.dx = 0
	map.dy = 0
	--these are the upper bounds for map.x/y
	map.xStop = map.totWidth - love.graphics.getWidth() / 2
	map.yStop = map.totHeight - love.graphics.getHeight() / 2
	map.speed = avatar.speed
	map.move = function(direction)
			  if direction == 'down' then map.dy = map.speed
		elseif direction == 'up' then map.dy = -map.speed
		elseif direction == 'right' then map.dx = map.speed
		elseif direction == 'left' then map.dx = -map.speed
		end
	end
	
	map.stop = function(direction)
		    if direction == 'down' and map.dy == map.speed  then map.dy = 0
		elseif direction == 'up' and map.dy == -map.speed  then map.dy = 0
		elseif direction == 'right' and map.dx == map.speed  then map.dx = 0
		elseif direction == 'left' and map.dx == -map.speed  then map.dx = 0
		end
	end
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
	--sprite update
	for _, sprite in pairs(spriteList) do
		sprite.x = sprite.x + sprite.dx * dt
		if sprite.x < sprite.xStop.left then sprite.x = sprite.xStop.left 
		elseif sprite.x > sprite.xStop.right then sprite.x = sprite.xStop.right 
		end
		sprite.y = sprite.y + sprite.dy * dt
		if sprite.y < sprite.yStop.top then sprite.y = sprite.yStop.top 
		elseif sprite.y > sprite.yStop.bottom then sprite.y = sprite.yStop.bottom 
		end
		if sprite.changeFrame ~= nil then sprite.changeFrame(sprite, dt) end
	end
	--map update
	map:update(dt)
	map.x = map.x + map.dx * dt
	if map.x < 0 then map.x = 0 
	elseif map.x > map.xStop then map.x = map.xStop end
	map.y = map.y + map.dy * dt
	if map.y < 0 then map.y = 0 
	elseif map.y > map.yStop then map.y = map.yStop end
end

function love.keypressed( keyPress)
	if keyPress == 'escape' then love.event.quit() end
	local isLegal = false
	for _, v in pairs({'up', 'left', 'down', 'right'}) do
		if keyPress == v then isLegal = true end
	end
	if isLegal == true then
		spriteList.avatar.walk(keyPress)
		map.move(keyPress)
	end
end

function love.keyreleased( keyPress )
	local isLegal = false
	for _, v in pairs({'up', 'left', 'down', 'right'}) do
		if keyPress == v then isLegal = true end
	end
	if isLegal == true then
		spriteList.avatar.stop(keyPress)
		map.stop(keyPress)
	end
end

function love.draw()
	--map drawing code
	local scale = 2
	local screenW = love.graphics.getWidth() / scale
	local screenH = love.graphics.getHeight() / scale
	love.graphics.scale(scale)
	love.graphics.translate(-map.x, -map.y)
	map:draw()
	love.graphics.translate(map.x, map.y)
	love.graphics.scale(1/scale)
	local locText = math.floor(map.x) .. ', ' .. math.floor(map.y)
	--love.graphics.print(locText, 0,0)

	--non-map sprite drawing code
	for _, sprite in pairs(spriteList) do
		love.graphics.draw(sprite.img, sprite.costumes[sprite.costume][sprite.frame], 
		sprite.x, sprite.y, 0, sprite.scale)
		locText = math.floor(sprite.x) .. ', ' .. math.floor(sprite.y)
		love.graphics.print(locText, 0,10)
		locText = math.floor(sprite.xStop.left) .. ', ' .. math.floor(sprite.xStop.right)
		love.graphics.print(locText, 0,20)
		love.graphics.print(love.graphics.getWidth() .. ', ' .. love.graphics.getHeight())
	end
end
