defmodule RemoteLed.ControlChannel do
  use PhoenixChannelClient
  require Logger

  def handle_in("led_on", _payload, state) do
    Logger.info("got led_on, turning on LED")
    RemoteLed.LedWorker.on()
    {:noreply, state}
  end

  def handle_in("led_off", _payload, state) do
    Logger.info("got led_off, turning off LED")
    RemoteLed.LedWorker.off()
    {:noreply, state}
  end
end
