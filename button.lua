local Button = {}

function Button:new(x, y, width, height, text, r, g, b, r2, g2, b2, fsize)
    local newObj = {
        x = x,
        y = y,
        width = width,
        height = height,
        text = text,
        r = r,
        g = g,
        b = b,
        r2 = r2,
        g2 = g2,
        b2 = b2,
        fsize = fsize,
        clicked = false 
    }
    setmetatable(newObj, self)
    self.__index = self
    return newObj
end

function Button:draw()
    local font = love.graphics.newFont(self.fsize)
    if self:isMouseOver() then
        love.graphics.setColor(self.r, self.g, self.b)
    else
        love.graphics.setColor(self.r2, self.g2, self.b2)
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
