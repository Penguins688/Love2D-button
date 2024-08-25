local font = love.graphics.newFont(48)
bounce_width = 375
bounce_height = 495

local Button = {}

function Button:new(x, y, width, height, text, type)
    local newObj = {
        x = x,
        y = y,
        width = width,
        height = height,
        text = text,
        type = type,
        clicked = false 
    }
    setmetatable(newObj, self)
    self.__index = self
    return newObj
end

function Button:draw()
    if self:isMouseOver() then
        love.graphics.setColor(0.424, 0.646, 0.738)
    else
        love.graphics.setColor(0.529, 0.808, 0.922)
    end

    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(font)
    love.graphics.setLineWidth(5)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

    local textWidth = font:getWidth(self.text)
    local textHeight = font:getHeight()
    local textX = self.x + (self.width - textWidth) / 2
    local textY = self.y + (self.height - textHeight) / 2

    love.graphics.print(self.text, textX, textY)
end

function Button:update()
    local mouseX, mouseY = love.mouse.getPosition()
    mousePressed = love.mouse.isDown(1)

    isMouseOverButton = self:isMouseOver()

    if isMouseOverButton and mousePressed and self.clicked == false then
        bounce_width = 375
        bounce_height = 495
        Rarity = 1
        local num = love.math.random(1, 998046)
        if num <= 750000 then
            Rarity = 1
            Item_Displayed = love.math.random(1, 10)     
        elseif num > 750000 and num <= 875000 then
            Rarity = 2
            Item_Displayed = love.math.random(1, 10)
        elseif num > 875000 and num <= 937500 then
            Rarity = 3
            Item_Displayed = love.math.random(1, 10)
        elseif num > 937500 and num <= 968750 then
            Rarity = 4
            Item_Displayed = love.math.random(1, 4)
        elseif num > 968750 and num <= 984375 then
            Rarity = 5
            Item_Displayed = love.math.random(1, 5)
        elseif num > 984375 and num <= 992187 then
            Rarity = 6
            Item_Displayed = 1
        elseif num > 992187 and num <= 996093 then
            if love.math.random(1, 3) == 1 then
                Rarity = 7
                Item_Displayed = love.math.random(1, 3)
            else
                Rarity = 4
                Item_Displayed = love.math.random(1, 4)
            end
        elseif num > 996093 and num <= 998046 then
            if love.math.random(1, 4) == 1 then
                Rarity = 8
                Item_Displayed = 1
            else
                Rarity = 5
                Item_Displayed = 1
            end
        end
        self.clicked = true
    end

    if not mousePressed then
        self.clicked = false
    end
end


function Button:isMouseOver()
    return love.mouse.getX() >= self.x and love.mouse.getX() <= self.x + self.width and love.mouse.getY() >= self.y and love.mouse.getY() <= self.y + self.height
end

return Button
