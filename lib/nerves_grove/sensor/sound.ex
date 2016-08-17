# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Sensor.Sound do
  @moduledoc """
  Seeed Studio [Grove Sound Sensor](http://wiki.seeedstudio.com/wiki/Grove_-_Sound_Sensor)

  ## Datasheet

  http://www.ti.com/lit/ds/symlink/lm358.pdf

  # Example

      alias Nerves.Grove.Sensor

      {:ok, pid} = Sensor.Sound.start_link(address)

      Sensor.Sound.read_value(pid)
  """

  alias Nerves.Grove.I2C

  @default_address 0x50 # I2C ADC

  @spec start_link(byte) :: {:ok, pid} | {:error, any}
  def start_link(address \\ @default_address) when is_integer(address) do
    I2C.ADC.start_link(address)
  end

  @spec read_value(pid, integer) :: float
  def read_value(pid, samples \\ 5) when is_pid(pid) and is_integer(samples) do
    I2C.ADC.read_value(pid, samples) |> Float.round(3)
  end
end
