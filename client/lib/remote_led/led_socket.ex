defmodule RemoteLed.LedSocket do
  use PhoenixChannelClient.Socket, otp_app: :remote_led
end
