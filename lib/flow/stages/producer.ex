defmodule Flow.Stages.Producer do
  use GenStage

  def start_link(nil, opts \\ []) do
    GenStage.start_link(__MODULE__, nil, opts)
  end

  def init(_), do: {:producer, []}

  def handle_demand(_demand, [ip | ips]) do
    {:noreply, [ip], ips}
  end

  def handle_demand(_demand, []) do
    {:noreply, [], []}
  end

  def handle_cast(%Flow.IP{} = ip, ips) do
    {:noreply, [ip], ips}
  end
end

