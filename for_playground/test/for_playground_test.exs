defmodule ForPlaygroundTest do
  use ExUnit.Case
  doctest ForPlayground

  test "basic comprehensions" do
    result = for i <- [1,2,3], do: i
    assert [1,2,3] == result
  end

  test "filter" do
    result = for i <- 0..10, rem(i,2) == 0 do
      i
    end
    assert result == [0,2,4,6,8,10]    
  end

  test "collect into map" do
  
    result = for i <- 0..2, into: %{} do
      {"#{i}",i}
    end

    assert result == %{"0" => 0,"1" => 1, "2"=>2}

  end

end
