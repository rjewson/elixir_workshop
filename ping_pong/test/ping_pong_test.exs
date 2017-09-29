defmodule PingPongTest do
  use ExUnit.Case
  doctest PingPong

  test "it returns with a ping" do
    ping = spawn(Ping, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}
    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}
  end
end
