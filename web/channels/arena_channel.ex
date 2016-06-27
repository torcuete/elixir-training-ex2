defmodule Countdown.ArenaChannel do
  use Phoenix.Channel

  alias Countdown.Counter

  def join("arenas:lobby", _message, socket) do
    counter = Counter.value
    {:ok, %{counter: counter}, socket}
  end

  def handle_in("count", _, socket) do
    count_result = case Counter.count do
      {:ok, counter} ->
        %{won: false, counter: counter}
      {:overflow, counter} ->
        %{won: true, counter: counter}
    end
    broadcast! socket, "update", %{counter: count_result.counter}
    {:reply, {:ok, count_result}, socket}
  end
end
