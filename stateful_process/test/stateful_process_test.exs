defmodule StatefulProcessTest do
  use ExUnit.Case
  doctest StatefulProcess

  test "starting the counter" do
    {:ok, pid} = Counter.start(0)
    assert is_pid(pid)
  end
  
  test "getting the value" do
    {:ok, pid} = Counter.start(0)
    assert {:ok,0} = Counter.get_value(pid)
  end

  test "getting the same value" do
    {:ok, pid} = Counter.start(0)
    assert {:ok,0} = Counter.get_value(pid)
  end

  test "increment the value" do
    {:ok, pid} = Counter.start(0)
    :ok = Counter.increment(pid)
    assert {:ok,1} = Counter.get_value(pid);
  end

  test "decrement the value" do
    {:ok, pid} = Counter.start(0)
    :ok = Counter.decrement(pid)
    assert {:ok,-1} = Counter.get_value(pid);
  end

  test "counter agent" do
    {:ok, pid} = CounterAgent.start(0)
    assert is_pid(pid)    
  end

  test "counter agent value" do
    {:ok, pid} = CounterAgent.start(0)
    assert {:ok,0} = CounterAgent.get_value(pid)
  end

  test "counter agent increment the value" do
    {:ok, pid} = Counter.start(0)
    :ok = Counter.increment(pid)
    assert {:ok,1} = Counter.get_value(pid);
  end

end
