defmodule RemoteLedServerWeb.LedChannel do
  use Phoenix.Channel

  require Logger

  def join("led:lobby", _message, socket) do
    Logger.info("Someone joined led:lobby")
    {:ok, socket}
  end

  def join("led:" <> private_room_id, _params, _socket) do
    Logger.info("Someone tried to join an unrecognized room #{private_room_id}")
    {:error, %{reason: "unauthorized room id"}}
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
