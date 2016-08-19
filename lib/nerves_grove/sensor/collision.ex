# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Sensor.Collision do
  @moduledoc """
  Seeed Studio [Grove Collision Sensor](http://wiki.seeedstudio.com/wiki/Grove_-_Collision_Sensor)

  # Example

      alias Nerves.Grove.Sensor

      {:ok, pid} = Sensor.Collision.start_link(pin)

      state = Sensor.Collision.read(pid)  # check if sensor was triggered
  """

  @spec start_link(pos_integer) :: {:ok, pid} | {:error, any}
  def start_link(pin) when is_integer(pin) do
    Gpio.start_link(pin, :input)
  end

  @spec read(pid) :: boolean
  def read(pid) when is_pid(pid) do
    Gpio.read(pid) == 0
  end
end
