defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "" do
    assert 1 + 1 == 2
  end

  test "uppercase 1" do
    assert Schizo.uppercase("foo") == "foo"
  end

  test "uppercase 2" do
    assert Schizo.uppercase("foo bar") == "foo BAR"
  end

  test "uppercase 3" do
    assert Schizo.uppercase("foo bar baz whee") == "foo BAR baz WHEE"
  end

  test "unvowel doesn't change the first word" do
    assert Schizo.unvowel("foo") == "foo"
  end

  test "unvowel removes the second word's vowels" do
    assert Schizo.unvowel("foo bar") == "foo br"
  end

  test "unvowel removes every other word's vowels" do
    assert Schizo.unvowel("foo bar baz whee") == "foo br baz wh"
  end


  test "With example" do
    opts = %{width: 10, height: 15}
    assert {:ok, 150} =
      with {:ok, width}  <- Map.fetch(opts, :width),
           {:ok, height} <- Map.fetch(opts, :height),
        do: {:ok, width * height}
  end

end
