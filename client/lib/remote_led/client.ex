defmodule RemoteLed.Client do
  alias RemoteLed.{LedSocket, ControlChannel}
  require Logger

  def connect do
    Logger.debug("--------------- Starting LedSocket")
    {:ok, _socket} = LedSocket.start_link()
    Logger.debug("--------------- Starting ControlChannel")
    {:ok, _channel} = ControlChannel.start_link(socket: LedSocket, topic: "led:lobby")

    Logger.debug("--------------- Joining ControlChannel")
    ControlChannel.join()
    Logger.debug("--------------- After Joining ControlChannel")
  end
end
