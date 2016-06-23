defmodule QuicksortTest do
  use ExUnit.Case, async: true
  use ExCheck                           # Import ExCheck into the module.
  doctest Quicksort

  property :sort_is_idempotent do
    for_all x in list(int) do           # Tell ExCheck how to generate data
      sorted = Quicksort.sort(x)
      Quicksort.sort(sorted) == sorted
    end
  end

  property :single_element_list_is_sorted do
    for_all x in int do
      Quicksort.sort([x]) == [x]
    end
  end

  property :head_less_eql_to_tail do
    for_all x in list(int) do
      implies x != [] do                # Predicate for test data
        sorted = Quicksort.sort(x)
        hd(sorted) <= List.last(sorted)
      end
    end
  end

  property :head_less_eql_to_tail_two do
    for_all x in such_that(x in list(int) when x != []) do
      sorted = Quicksort.sort(x)
      hd(sorted) <= List.last(sorted)
    end
  end

  property :sorts_integers do
    for_all x in list(int) do
      Quicksort.sort(x) == Enum.sort(x)
    end
  end

  property :sorts_real_numbers do
    for_all x in list(real) do
      Quicksort.sort(x) == Enum.sort(x)
    end
  end
end
