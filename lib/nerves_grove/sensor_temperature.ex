# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Sensor.Temperature do
  @moduledoc """
  http://wiki.seeedstudio.com/wiki/Grove_-_Temperature_Sensor_V1.2
  http://wiki.seeedstudio.com/images/a/a1/NCP18WF104F03RC.pdf
  """

  alias Nerves.Grove.I2C

  @default_address 0x50      # I2C ADC
  @b_const         4_250     # v1.2
  @r_0             100_000.0 # ohm
  @t_0             298.15    # K (25 C)
  @t_celsius       273.15    # K (0 C)

  @spec start_link(byte) :: {:ok, pid} | {:error, any}
  def start_link(address \\ @default_address) when is_integer(address) do
    I2C.ADC.start_link(address)
  end

  @spec read_centigrade(pid, integer) :: float
  def read_centigrade(pid, samples \\ 20) when is_pid(pid) and is_integer(samples) do
    read_kelvin(pid, samples) - @t_celsius |> Float.round(2)
  end

  @spec read_kelvin(pid, integer) :: float
  def read_kelvin(pid, samples \\ 20) when is_pid(pid) and is_integer(samples) do
    # FIXME: This is based on Seeed's BBG example code, but it doesn't make
    # much sense in terms of the datasheet or Seeed's Arduino example code.
    voltage = I2C.ADC.read_voltage(pid, samples)
    sensor_value_tmp = voltage / 3.3 * 1_023
    resistance = (1_023 - sensor_value_tmp) * 10_000 / sensor_value_tmp
    temperature = 1 / (:math.log(resistance / 10_000) / @b_const + (1 / @t_0))
    temperature |> Float.round(2)
  end
end
