# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Button do
  @moduledoc """
  http://wiki.seeedstudio.com/wiki/Grove_-_Button
  """

  @spec start_link(pos_integer) :: {:ok, pid} | {:error, any}
  def start_link(pin) do
    Gpio.start_link(pin, :input)
  end

  @spec read(pid) :: boolean
  def read(pid) do
    Gpio.read(pid) == 1
  end
end
