defmodule OData.Format.Types do

  def type_name(t) when is_nil(t), do: "Edm.Null"
  def type_name(t) when is_boolean(t), do: "Edm.Boolean"
  def type_name(t) when is_float(t), do: "Edm.Double"
  def type_name(t) when is_integer(t), do: "Edm.Int64"
  def type_name(t) when is_binary(t) do
    # TODO: Check for date and datetime which should be
    # Edm.Data and Edm.DateTimeOffset respectively
    "Edm.String"
  end

end
