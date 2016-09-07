require "gosu"
require_relative "player_ship"
class Level < Gosu::Window
  def initialize(window)
    @window = window
    @player = PlayerShip.new
  end

  def draw
    @player.draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    end
  end

  def update
    if button_down?(Gosu::KbUp)
      @player.move_up!
    end
    if button_down?(Gosu::KbDown)
      @player.move_down!
    end
  end
end
