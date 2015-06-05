defmodule OData.Backend.Simple do
  @behaviour OData.Backend.Behaviour
  require Logger

  def init do
    Logger.info("SimpleBackend: init")
   :ok
 end

  def limit_size do
    Logger.info("SimpleBackend: Returning default_limit of 100")
    100
  end

  def collections do
    Logger.info("SimpleBackend: Returning {Collection1,10} and {Collection2, 10}")
    [{"Collection1", 10}, {"Collection2", 10}]
  end

  def rows("Collection1", offset, limit) do
    Logger.info("SimpleBackend: Returning rows for Collection1 offset:#{offset}, limit:#limit")
    %{}
  end

  def rows("Collection2", offset, limit) do
    Logger.info("SimpleBackend: Returning rows for Collection2 offset:#{offset}, limit:#limit")
    %{}
  end

end
