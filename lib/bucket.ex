defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket.
  """
  def start_link(_opts), do: Agent.start_link fn -> %{} end

  @doc """
  Gets a value from bucket by key.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the value for the given key in the bucket
  """
  def put(bucket, key, value) do
    # Client code here
    Agent.update(bucket, fn state ->
      # Server code here
      Map.put(state, key, value)
    end)
    # Back to client code
  end

  @doc """
  Delete value from bucket by key
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
