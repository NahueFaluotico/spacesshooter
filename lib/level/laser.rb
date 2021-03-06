require 'gosu'

class Laser

  attr_accessor :x, :y, :height, :width
  def initialize(x, y)
    @image = Gosu::Image.new('media/images/player/laser.png')
    @x = x
    @y = y - @image.height / 2
    @height = @image.height
    @width = @image.width
  end
  def draw
    @image.draw(@x, @y, 1)

  end
  def move!
    @x += 10
  end
  def is_out?
    @x > Game::SCREEN_WIDTH
  end
end
