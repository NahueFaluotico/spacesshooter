require_relative "../utils"
class MainOption
  def initialize(text,y)
    @image = Gosu::Image.from_text(text , Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@image)
    @y = y
  end
  def draw
    @image.draw(@x, @y, 1, 1, 1, Utils::TEXT_COLOR_LIGHT)
  end
end
