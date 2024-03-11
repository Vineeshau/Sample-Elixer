defmodule User do
  defstruct name: "", age: 0, email: ""
end

defmodule ListOfSum do
	def main do
      %User{}
	    IO.puts("Enter the Name:")
	    name = String.trim(IO.gets(" |> "))
      IO.puts("Enter the Age:")
      age = String.trim(IO.gets(" |> ")) |> String.to_integer()
      IO.puts("Enter the Email:")
      email = String.trim(IO.gets(" |> "))
      user = %User{name: name, age: age, email: email}
      IO.inspect(user)
  	end

end

ListOfSum.main()
