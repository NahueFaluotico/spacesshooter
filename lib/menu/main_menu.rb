require "gosu"
require_relative "menu_option"
require_relative "../utils"

class MainMenu
  attr_accessor :title
  OPTIONS_MARGIN_TOP = 200
  MARGIN_INTERNAL_Y  = 80
  OPTIONS = { play: 0, exit: 1}
   def initialize(window)
    @window = window
    @title = Gosu::Image.from_text("Menu Principal", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@title)
    @options = []

    ["Jugar", "Salir"].each_with_index do |text, index|
    option_y = OPTIONS_MARGIN_TOP + (index * MARGIN_INTERNAL_Y)
    @options << MainOption.new(text, option_y)
    end
    @current_option = OPTIONS[:play]
  end

  def button_down(id)

    case id
    when Gosu::KbEscape
      @window.close
    when Gosu::KbUp, Gosu::KbDown
      move_to_different_option
    when Gosu::KbSpace
      select_option
    end
  end

  def draw
    @title.draw(@x,0,0)
    @options.each do |option|
    is_selected = option == @options[@current_option]
    option.draw(is_selected)
    end
  end

  def move_to_different_option
    if @current_option == OPTIONS[:play]
      @current_option = OPTIONS[:exit]
    elsif @current_option = OPTIONS[:exit]
      @current_option = OPTIONS[:play]
    end
  end
  def select_option
    case @current_option
    when OPTIONS[:play]
      @window.show_level
    when OPTIONS[:exit]
      @window.close
    end
  end
  def update
  end
end
