defmodule RemoteLedServerWeb.LedChannel do
  use Phoenix.Channel

  require Logger

  def join("led:lobby", _message, socket) do
    Logger.info("Someone joined led:lobby")
    {:ok, socket}
  end

  def handle_in("on", _message, socket) do
    Logger.debug("Got on from client")
    send_on(socket)
    {:noreply, socket}
  end

  def handle_in("off", _message, socket) do
    Logger.debug("Got off from client")
    send_off(socket)
    {:noreply, socket}
  end

  def send_on(socket) do
    Logger.info("Sending led_on message to all connected clients")
    broadcast!(socket, "led_on", %{})
    {:noreply, socket}
  end

  def send_off(socket) do
    Logger.info("Sending led_off message to all connected clients")
    broadcast!(socket, "led_off", %{})
    {:noreply, socket}
  end
end
