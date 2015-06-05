defmodule ODataTest do
  use ExUnit.Case

 setup do
    {:ok, backend} = OData.Backend.start_link(OData.Backend.Simple)
    {:ok, backend: backend}
  end

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

  test "Check type names" do
    assert OData.Format.Types.type_name(nil) == "Edm.Null"
    assert OData.Format.Types.type_name(true) == "Edm.Boolean"
    assert OData.Format.Types.type_name(1.0) == "Edm.Double"
    assert OData.Format.Types.type_name(1) == "Edm.Int64"
    assert OData.Format.Types.type_name("Value") == "Edm.String"
  end
end
