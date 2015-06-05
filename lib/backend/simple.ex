defmodule OData.Backend.Simple do
  @behaviour OData.Backend.Behaviour

  def init do
   :ok
 end

  def limit_size do
    100
  end

  def collections do
    [{"Collection1", 10}, {"Collection2", 10}]
  end

  def rows("Collection1", offset, limit) do
    %{}
  end

  def rows("Collection2", offset, limit) do
    %{}
  end

end
