defmodule MsTest do
  use ExUnit.Case
  doctest Ms

  test "to upper" do
    {:ok, upcaser_pid} = Ms.start
    #send(upcaser_pid,{self(),{:upcase, "foo"}})
    #assert_receive {:ok, "FOO"}
    assert {:ok, "FOO"} = Ms.upcase(upcaser_pid, "foo")
  end
end
