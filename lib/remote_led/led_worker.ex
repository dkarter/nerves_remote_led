defmodule RemoteLed.LedWorker do
  use GenServer
  alias ElixirALE.GPIO

  @pin 40

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, pid} = GPIO.start_link(@pin, :output)
    {:ok, %{pid: pid}}
  end

  def handle_cast(:on, state) do
    GPIO.write(state[:pid], 1)
    {:noreply, state}
  end

  def handle_cast(:off, state) do
    GPIO.write(state[:pid], 0)
    {:noreply, state}
  end
end
