require "gosu"
require_relative "../utils"
require_relative "laser"

class PlayerShip
  def initialize
    @image = Gosu::Image.new('media/images/player/ship.png')
    @y = Utils.center_y(@image)
    @laser_sound = Gosu::Sample.new('media/sounds/laser.ogg')

  end
  def draw
    @image.draw( 0, @y, 1)
  end
  def move_up!
    if @y - 5 > 0
    @y -= 5
    end
  end
  def move_down!
    if @y + 5 + @image.height < Game::SCREEN_HEIGHT
    @y += 5
    end
  end
  def shoot
    @laser_sound.play
    Laser.new(@image.width, @y + @image.height / 2)
  end
end
