# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Button do
  @moduledoc """
  http://www.seeedstudio.com/wiki/Grove_-_Button
  """

  def start_link(pin) do
    {:ok, _pid} = Gpio.start_link(pin, :input)
  end

  def read(pid) do
    Gpio.read(pid) == 1
  end
end
