defmodule RemoteLed.LedWorker do
  use GenServer
  alias ElixirALE.GPIO

  @pin 21

  # ++++++++++++ CLIENT
  def on do
    server_pid()
    |> GenServer.cast(:on)
  end

  def off do
    server_pid()
    |> GenServer.cast(:off)
  end

  defp server_pid do
    GenServer.whereis(__MODULE__)
  end

  # ============ SERVER
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, pid} = GPIO.start_link(@pin, :output)
    # start off
    GPIO.write(pid, 1)
    {:ok, %{pid: pid}}
  end

  def handle_cast(:on, state = %{pid: pid}) do
    pid
    |> GPIO.write(0)

    {:noreply, state}
  end

  def handle_cast(:off, state = %{pid: pid}) do
    pid
    |> GPIO.write(1)

    {:noreply, state}
  end
end
