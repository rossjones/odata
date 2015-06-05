defmodule OData.Format.Formatters do

  @doc """
  Renders a column name in a format that is valid XML.
  """
  def name(n) do
    n
    |> String.downcase
    |> without_punctuation
    |> space_to_underscore
  end


  defp without_punctuation(s) do
    String.replace(s, ~r/[\p{P}\p{S}]/, "")
  end

  defp space_to_underscore(s) do
    String.replace(s, " ", "_")
  end

end
