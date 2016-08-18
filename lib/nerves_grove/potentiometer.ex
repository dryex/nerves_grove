# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Potentiometer do
  @moduledoc """
  Seeed Studio [Grove Rotary Angle Sensor](http://wiki.seeedstudio.com/wiki/Grove_-_Rotary_Angle_Sensor)
  Seeed Studio [Grove Slide Potentiometer](http://wiki.seeedstudio.com/wiki/Grove_-_Slide_Potentiometer)

  # Example

      alias Nerves.Grove.Potentiometer

      {:ok, pid} = Potentiometer.start_link(address)

      Potentiometer.read_value(pid)
  """

  alias Nerves.Grove.I2C

  @default_address 0x50 # I2C ADC
  @default_vcc     3.3  # V

  @spec start_link(byte) :: {:ok, pid} | {:error, any}
  def start_link(address \\ @default_address) when is_integer(address) do
    I2C.ADC.start_link(address)
  end

  @spec read_value(pid, integer) :: float
  def read_value(pid, samples \\ 5) when is_pid(pid) and is_integer(samples) do
    (min(I2C.ADC.read_voltage(pid, samples), @default_vcc) / @default_vcc) |> Float.round(3)
  end
end
