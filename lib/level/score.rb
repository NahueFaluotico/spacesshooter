require "gosu"
require_relative "../utils"

class Score

  attr_reader :points

  def initialize
    @points = 0
    @text = Gosu::Font.new(40, name: Utils.default_font)
    @x = Game::SCREEN_WIDTH - 120

  end
  def draw
    @text.draw(@points, @x, 10, 1)
  end
  def update_points!(ship_points)
    @points += ship_points
  end
end
