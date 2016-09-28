require "gosu"

class EnemyShip

  def initialize(image_path,points,velocity)
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::SCREEN_WIDTH - @image.width
    @y = Random.rand(Game::SCREEN_HEIGHT - @image.height)
    @points = points
    @velocity = velocity

  end

  def draw
    @image.draw(@x, @y, 1)

  end
  def move!
    @x -= @velocity
  end

  def is_out?
    @x < 0
  end
end
