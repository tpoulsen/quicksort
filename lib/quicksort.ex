defmodule Quicksort do
  @moduledoc """
  Implementation of quicksort algorithm for sorting lists.

  ## Examples

  iex> Quicksort.sort([4,5,2,3,1])
  [1,2,3,4,5]

  """

  @spec sort([any]) :: [any]
  def sort([]), do: []
  def sort(array) do
    [head | tail] = array
    pivot = head
    smaller = tail |> Enum.filter(&(&1 <= pivot))
    greater = tail |> Enum.filter(&(&1 > pivot))
    [sort(smaller) | [pivot | sort(greater)]] |> List.flatten
  end
end
