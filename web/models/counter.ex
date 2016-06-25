defmodule Countdown.Counter do
  def start_link do
    Agent.start_link(fn -> %{value: 0, limit: 100} end, name: __MODULE__)
  end

  def reset do
    Agent.update(__MODULE__, fn (old_state) -> %{old_state | value: 0} end)
  end

  def value do
    Agent.get(__MODULE__, &(&1.value))
  end

  def limit do
    Agent.get(__MODULE__, &(&1.limit))
  end

  def count do
    new_value = value + 1
    if new_value < limit do
      Agent.update(__MODULE__, fn (old_state) -> %{old_state | value: new_value} end)
      {:ok, new_value}
    else
      reset
      {:overflow, 0}
    end
  end

  def set(new_value) do
    Agent.update(__MODULE__, fn (old_state) -> %{old_state | value: new_value} end)
  end
end
