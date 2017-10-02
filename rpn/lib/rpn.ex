defmodule Rpn do
  
  def start() do
    Agent.start( fn -> [] end)
  end

  def push(pid, v) do
    Agent.update(pid, fn(x) -> 
      cond do
        v == :+ -> 
          [s | [ f | t]] = x
          [ f+s | t]
        v == :- -> 
          [s | [ f | t]] = x
          [ f-s | t]
        v == :x -> 
          [s | [ f | t]] = x
          [ f*s | t]
        true -> [ v | x ]
      end
      # end
    end)
  end

  def peek(pid) do
    Agent.get(pid, fn(x) -> 
      x 
    end)
  end

end
