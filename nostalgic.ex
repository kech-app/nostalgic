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
