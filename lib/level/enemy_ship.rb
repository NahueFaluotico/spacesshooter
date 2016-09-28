require "gosu"

class EnemyShip

  def initialize(image_path,points,velocity)
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::SCREEN_WIDTH - @image.width
    @y = Random.rand(Game::SCREEN_HEIGHT - @image.height)
    @points = points
    @velocity = velocity
    @destroyed = false
    @height = @image.height
    @width = @image.width
    
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
  def was_hit? (lasers)
    lasers.any? { | laser | hit?(laser) }
  end
  def destroyed?
    @destroyed
  end

  private
  def hit?(laser)
    if (@y > laser.y + laser.height) || (@y + @height < laser.y) || (@x > laser.x + laser.width) || (@x + @width < laser.x)
      false
    else
      true
    end
  end
  def destroy!
    @destroyed = true
  end

end
