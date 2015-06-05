defmodule OData.Backend do
  use GenServer


  @doc """
  Starts the genserver for the odata backend, using the supplied
  'backend_module' to delegate calls to.  'backend_module' should
  be an implementation of OData.Backend.Behaviour
  """
  def start_link(backend_module, opts \\ []) do
    GenServer.start_link(__MODULE__, backend_module, opts)
  end

  @doc """
  Gets the default limit size for a backend. That is, where a request does
  not specify a limit, what limit should be applied?
  """
  def limit_size(pid) do
    GenServer.call(pid, :limit)
  end

  @doc """
  Retrieve a list of collection names for the backend.
  """
  def collections(pid) do
    GenServer.call(pid, :collections)
  end

  @doc """
  Return rows from the specified collection
  """
  def rows(pid, collection, offset, limit)  do
    GenServer.call(pid, {:rows, collection, offset, limit})
  end


  ############################################################################
  # GenServer specific code.
  ############################################################################

  def init(backend_module) do
    backend_module.init
    {:ok, backend_module}
  end

  def handle_call(:limit, _from, backend_module) do
    {:reply, backend_module.limit_size, backend_module}
  end

  def handle_call(:collections, _from, backend_module) do
    {:reply, backend_module.collections, backend_module}
  end

  def handle_call({:rows, collection, offset, limit}, _from, backend_module) do
    {:reply, backend_module.rows(collection, offset, limit), backend_module}
  end


end