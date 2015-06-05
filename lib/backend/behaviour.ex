defmodule OData.Backend.Behaviour do
  @moduledoc """
  This behavious defines the interface that an alternate backend
  should implement to expose data to the OData endpoint.  An
  implementation might, for instance be backed by Ecto for a
  very specific set of postgres tables, or even for a collection
  of CSV files.
  """
  use Behaviour

  @type on_init :: {:ok} | {:error, String.t }
  @type collection_list :: [{String.t, number}]

  @doc "Initialises the backend"
  defcallback init :: on_init

  @doc "Returns the default value for limit"
  defcallback limit_size :: number

  @doc "Returns a list of known collection names "
  defcallback collections :: collection_list

  @doc ""
  defcallback rows(String.t, number, number) :: map

end