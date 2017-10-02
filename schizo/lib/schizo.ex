defmodule Schizo do
  @moduledoc """
  This is a module that provides odd behaviour for transforming every other word
  in a string.

  Here are some examples:

      iex> Schizo.uppercase("this is an example")
      "this IS an EXAMPLE"

      iex> Schizo.unvowel("this is an example")
      "this s an xmpl"

  """

  def hello do
    :world
  end

  def uppercase(str) do
    str
    |> every_other_word(&String.upcase/1)
    
    # str
    # |> String.split(" ")
    # |> Enum.with_index
    # |> Enum.map( fn({word,index}) -> 
    #   if rem(index,2) == 0 do
    #     word
    #   else
    #     String.upcase(word)
    #   end
    # end)
    # |> Enum.join(" ")
  end

  def unvowel(str) do
    every_other_word(str,fn(word) -> Regex.replace(~r/[aeiou]/,word,"") end)
    # str
    # |> String.split(" ")
    # |> Enum.with_index
    # |> Enum.map( fn({word,index}) -> 
    #   if rem(index,2) == 0 do
    #     word
    #   else
    #     Regex.replace(~r/[aeiou]/,word,"")
    #   end
    # end)
    # |> Enum.join(" ")
  end

  def every_other_word(str, func) do
    str
    |> String.split(" ")
    |> Enum.with_index
    |> Enum.map( fn({word,index}) -> 
      if rem(index,2) == 0 do
        word
      else
        func.(word)
      end
    end)
    |> Enum.join(" ")
  end

end
