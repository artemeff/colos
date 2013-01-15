require "test/unit"
require "colos"

class ColosTest < Test::Unit::TestCase
  # Single color
  def test_color_test
    assert_equal "3a1be1",
      Colos.color("test")
  end

  def test_color_word
    assert_equal "395e9a",
      Colos.color("word")
  end

  def test_color_is_toooooo_big
    assert_equal "3c1a03",
      Colos.color("is toooooo big")
  end

  # All colors
  def test_colors_test
    assert_equal ["ba6714", "3a1be1", "15291c"],
      Colos.colors("test")
  end

  def test_colors_word
    assert_equal ["b7d989", "395e9a", "14e8c0"],
      Colos.colors("word")
  end

  def test_colors_is_toooooo_big
    assert_equal ["c14bae", "3c1a03", "15d64c"],
      Colos.colors("is toooooo big")
  end
end