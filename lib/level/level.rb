require "gosu"
require_relative "player_ship"
require_relative "score"
require_relative "life_counter"
require_relative "enemy_ship"

class Level < Gosu::Window
  def initialize(window, enemy_ship_definitions)
    @window = window
    @player = PlayerShip.new
    @lasers = []
    @score = Score.new
    @lifeCounter = LifeCounter.new
    @enemyShips = []
    @enemy_ship_definitions = enemy_ship_definitions

  end

  def draw
    @player.draw
    if @lasers
      @lasers.each { | laser | laser.draw }
    end
    if @enemyShips
      @enemyShips.each { | enemyShip | enemyShip.draw }
    end
    @score.draw
    @lifeCounter.draw
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
    create_enemy_ship
    if @enemyShips
      @enemyShips.each { | enemyShip |  enemyShip.move! }
      @enemyShips.reject! { | enemyShip | enemyShip.is_out? }
    end
  end
  def create_enemy_ship
    current_time = Gosu::milliseconds
    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ships < current_time)
      @last_enemy_ship_at = current_time
      info = @enemy_ship_definitions.sample
      @enemyShips << EnemyShip.new(info[:image_path], info[:points], info[:velocity])
    end
  end
  def time_between_enemy_ships
    case @score.points
      when 0..1000
        3000
      when 1000..2000
        2000
      else
        1000
    end
  end


end
