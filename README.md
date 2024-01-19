If you feel Lisp nostalgic you can do this non sens

```elixir
defmodule Nostalgic do
  def stick(text) do
    text
    |> String.replace(~r/\bunquote\b/, "``")
    |> String.replace(~r/\bquote\b/, "`")
  end

  def unstick(text) do
    # Replace double backticks first to avoid conflicts with single backtick replacement
    text
    |> String.replace("``", "unquote")
    |> String.replace("`", "quote")
  end
end
```

```elixir
code = """
defmacro say({:-, _, [lhs, rhs]}) do
  ` do
    lhs = ``(lhs)
    rhs = ``(rhs)
    result = lhs - rhs
  end
end
"""
```

then you will have this

```
iex(19)> IO.puts Macro.to_string Code.string_to_quoted! Nostalgic.unstick code
defmacro say({:-, _, [lhs, rhs]}) do
  quote do
    lhs = unquote(lhs)
    rhs = unquote(rhs)
    result = lhs - rhs
  end
end
:ok
```
