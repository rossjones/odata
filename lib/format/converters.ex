defmodule OData.Format.Converters do

  @doc """
  Converts some types from the xml into their
  Elixir versions
  """
  def from_odata("Edm.Null", _), do: nil
  def from_odata("Edm.Boolean", value), do: value == "true"
  def from_odata("Edm.Date", value) do
    # TODO: Parse the date
  end
  def from_odata("Edm.DateTimeOffset", value) do
    # TODO: Parse the date and time
  end
  def from_odata(_, value), do: value

  @doc """
  Converts some Elixir types into a format
  for inserting into XML.
  """
  def to_odata(:true),  do: "true"
  def to_odata(:false), do: "false"
  def to_odata(other),  do: other

end