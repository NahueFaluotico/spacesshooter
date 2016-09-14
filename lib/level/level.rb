require "gosu"
require_relative "player_ship"
require_relative "score"
require_relative "life_counter"
require_relative "enemy_ship"

class Level < Gosu::Window
  def initialize(window)
    @window = window
    @player = PlayerShip.new
    @lasers = []
    @score = Score.new
    @lifeCounter = LifeCounter.new
    @enemyShip = EnemyShip.new("enemy_4.png", 200, 10)
  #  @enemyShips = []

  end

  def draw
    @player.draw
    if @lasers
      @lasers.each { | laser | laser.draw }
    end
    @score.draw
    @lifeCounter.draw
    @enemyShip.draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    when Gosu::KbSpace
      laser = @player.shoot
      @lasers << laser
    end
  end

  def update
    if button_down?(Gosu::KbUp)
      @player.move_up!
    end
    if button_down?(Gosu::KbDown)
      @player.move_down!
    end
    if @lasers
      @lasers.each { | laser |  laser.move! }
      @lasers.reject! { |laser| laser.is_out? }
    end
    @enemyShip.move!
  end
#  def create_enemy_ship
#    current_time = Gosu::milliseconds
#    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ship < current_time)
#  end

end
