defmodule RemoteLed.ControlChannel do
  use PhoenixChannelClient
  require Logger

  alias RemoteLed.LedWorker

  def handle_in("led_on", _payload, state) do
    Logger.debug("got led_on, turning on LED")
    LedWorker.on()
    {:noreply, state}
  end

  def handle_in("led_off", _payload, state) do
    Logger.debug("got led_off, turning off LED")
    LedWorker.off()
    {:noreply, state}
  end

  def handle_reply({:ok, :join, _resp, _ref}, state) do
    Logger.debug("==== join control channel success")
    {:noreply, state}
  end

  def handle_reply({:error, :join, _resp, _ref}, state) do
    Logger.debug("==== cannot join control channel")
    {:noreply, state}
  end

  def handle_reply({:timeout, :join}, state) do
    Logger.debug("---- got timeout trying to join control channel")
    {:noreply, state}
  end

  def handle_reply({:timeout, msg, _ref}, state) do
    Logger.debug("---- got timeout for #{msg}")
    {:noreply, state}
  end

  def handle_close(reason, state) do
    Logger.debug("-=-=-=-=-=- closed: #{inspect(reason)}")
    # send_after(5000, :rejoin)
    # {:noreply, rejoin(state)}
    {:noreply, state}
  end
end
