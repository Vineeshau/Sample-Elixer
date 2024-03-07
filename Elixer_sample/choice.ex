defmodule NumberChecker do
  def check_true(choice) do
    unless choice == 0 do
      enter()
    end
    IO.puts "Exiting..."
  end

  def check(num) do
    case rem(num, 2) == 0 do
      true -> "even"
      false -> "odd"
    end
  end

  def enter do
    number =
      IO.gets("Enter a number: ")
      |> String.trim()
      |> String.to_integer()

    IO.puts(check(number))

    check_true(
      IO.gets("Do you want to continue? (Enter 0 to exit): ")
      |> String.trim()
      |> String.to_integer()
    )
  end
end

NumberChecker.enter()

