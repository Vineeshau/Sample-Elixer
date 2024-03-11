defmodule ListOfSum do
	def main do
	    IO.puts("Enter the length of list:")
	    length = String.trim(IO.gets(" |> ")) |> String.to_integer()
	    list = take_list(length)
	    sum = Enum.sum(list)
	    IO.puts("Sum of the list is: #{sum}")
  	end

  defp take_list(length) when length <= 0 do
    []
  end

  defp take_list(length) do
    IO.puts("Enter each number:")
    number = String.trim(IO.gets(" |> ")) |> String.to_integer()
    [number | take_list(length - 1)]
  end

end

ListOfSum.main()
