require_relative "menu_option"
require_relative "../utils"

class MainMenu
  attr_accessor :title
  OPTIONS_MARGIN_TOP = 200
  MARGIN_INTERNAL_Y  = 80
  def initialize(window)
    @window = window
    @title = Gosu::Image.from_text("Menu Principal", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@title)
    @mainOption = MainOption.new
    @options = []

    ["Jugar", "Salir"].each_with_index do |text, index|
    option_y = OPTIONS_MARGIN_TOP + (index * MARGIN_INTERNAL_Y)
    @options << MainOption.new(text, option_y)
    end
  end
  def button_down(id)
    if id == Gosu::KbEscape
      window.close
    end
  end
  def draw
    @title.draw(@x,0,0)
    @options.each do |option|
      option.draw
    end
  end
end
