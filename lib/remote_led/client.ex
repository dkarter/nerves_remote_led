defmodule RemoteLed.Client do
  alias RemoteLed.{LedSocket, ControlChannel}

  def connect do
    {:ok, _socket} = LedSocket.start_link()
    {:ok, _channel} = ControlChannel.start_link(socket: LedSocket, topic: "led:lobby")

    ControlChannel.join()
  end
end
