defmodule GlUtilsTest do
  use ExUnit.Case

  test ":gl_const.gl_UNSIGNED_SHORT -> 0x1403" do
    assert :gl_const.gl_UNSIGNED_SHORT == 0x1403
  end

  test ":gl_const.gl_RED -> 0x1903" do
    assert :gl_const.gl_RED == 0x1903
  end

  test ":gl_const.gl_GREEN -> 0x1904" do
    assert :gl_const.gl_GREEN == 0x1904
  end

  test ":gl_const.gl_BLUE -> 0x1905" do
    assert :gl_const.gl_BLUE == 0x1905
  end

  test ":gl_const.gl_ALPHA -> 0x1906" do
    assert :gl_const.gl_ALPHA == 0x1906
  end
end
