defmodule ODataTest do
  use ExUnit.Case

 setup do
    {:ok, backend} = OData.Backend.start_link(OData.Backend.Simple)
    {:ok, backend: backend}
  end

  #############################################################################
  # Backend tests
  #############################################################################

  test "Default limit size in a backend",  %{backend: backend} do
    assert OData.Backend.limit_size(backend) == 100
  end

  test "Collection list",  %{backend: backend} do
    assert OData.Backend.collections(backend) == [{"Collection1", 10}, {"Collection2", 10}]
  end

  test "Collection1 rows",  %{backend: backend} do
    assert OData.Backend.rows(backend, "Collection1", 0, 0) == %{}
  end

  test "Collection rows",  %{backend: backend} do
    assert OData.Backend.rows(backend, "Collection2", 0, 0) == %{}
  end

  #############################################################################
  # Type tests
  #############################################################################


  test "Check type names" do
    assert OData.Format.Types.type_name(nil) == "Edm.Null"
    assert OData.Format.Types.type_name(true) == "Edm.Boolean"
    assert OData.Format.Types.type_name(1.0) == "Edm.Double"
    assert OData.Format.Types.type_name(1) == "Edm.Int64"
    assert OData.Format.Types.type_name("Value") == "Edm.String"
    {date, time} = :calendar.local_time
    assert OData.Format.Types.type_name(date) == "Edm.Date"
    assert OData.Format.Types.type_name({date, time}) == "Edm.DateTimeOffset"
  end

  #############################################################################
  # Formatting tests
  #############################################################################

  test "Formatter valid xml name" do
    assert OData.Format.Formatters.name("valid") == "valid"
  end

  test "Invalid string is converted to valid form" do
    assert OData.Format.Formatters.name("An Invalid String!") == "an_invalid_string"
  end

  #############################################################################
  # Converter tests
  #############################################################################

  test "Converting booleans to odata format" do
    assert OData.Format.Converters.to_odata(:true) == "true"
    assert OData.Format.Converters.to_odata(:false) == "false"
  end

  test "Converting dates and datetimes to odata format" do
  end

  test "Converting other types to odata format" do
    assert OData.Format.Converters.to_odata(1.0) == 1.0
    assert OData.Format.Converters.to_odata(1) == 1
  end

end
