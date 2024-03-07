defmodule Calculator do
  def start do
    IO.puts("Welcome to the Simple Calculator!")
    loop()
  end

  def loop do
    IO.puts("\nMenu:")
    IO.puts("1. Add")
    IO.puts("2. Subtract")
    IO.puts("3. Multiply")
    IO.puts("4. Divide")
    IO.puts("5. Exit")

    choice = get_input("Enter your choice: ")

    case choice do
      "1" -> perform_operation(&+/2, "Addition")
      "2" -> perform_operation(&-/2, "Subtraction")
      "3" -> perform_operation(&*/2, "Multiplication")
      "4" -> perform_operation(&//2, "Division")
      "5" -> exit_program()
      _ -> IO.puts("Invalid choice. Please try again.")
    end

    loop()
  end

  defp get_input(prompt) do
    IO.puts(prompt)
    IO.gets() |> String.trim()
  end

  defp perform_operation(operation, operation_name) do
    num1 = String.to_float(get_input("Enter the first number: "))
    num2 = String.to_float(get_input("Enter the second number: "))

    case {num1, num2} do
      {nil, _} or {_, nil} ->
        IO.puts("Invalid input. Please enter valid numbers.")
        perform_operation(operation, operation_name)
      {n1, n2} ->
        result = operation.(n1, n2)
        IO.puts("#{operation_name} Result: #{result}")
    end
  end

  defp exit_program do
    IO.puts("Exiting the Simple Calculator. Goodbye!")
    System.halt(0)
  end
end

Calculator.start()

