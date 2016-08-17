# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.I2C.ADC do
  @moduledoc """
  Seeed Studio [Grove I2C ADC](http://wiki.seeedstudio.com/wiki/Grove_-_I2C_ADC)

  ## Datasheet

  http://www.ti.com/lit/ds/snas415f/snas415f.pdf

  # Example

      alias Nerves.Grove.I2C

      {:ok, pid} = I2C.ADC.start_link(address)

      I2C.ADC.read_sample(pid)
  """

  @default_address 0x50
  @result_register 0x00
  @config_register 0x02
  @v_ref           3.0  # V

  @spec start_link(byte) :: {:ok, pid} | {:error, any}
  def start_link(address \\ @default_address) when is_integer(address) do
    case I2c.start_link("i2c-2", address) do
      {:ok, pid} ->
        set_automatic_mode(pid, true)
        {:ok, pid}
      error -> error
    end
  end

  @spec set_automatic_mode(pid, false) :: :ok
  def set_automatic_mode(pid, false) when is_pid(pid) do
    I2c.write(pid, <<@config_register, 0b000_00000>>)
  end

  @spec set_automatic_mode(pid, true) :: :ok
  def set_automatic_mode(pid, true) when is_pid(pid) do
    # Configure for T_convert*32 and f_convert=27ksps:
    I2c.write(pid, <<@config_register, 0b001_00000>>)
  end

  @spec read_value(pid, integer) :: float
  def read_value(pid, samples \\ 5) when is_pid(pid) and is_integer(samples) do
    read_voltage(pid, samples) / @v_ref
  end

  @spec read_voltage(pid, integer) :: float
  def read_voltage(pid, samples \\ 5) when is_pid(pid) and is_integer(samples) do
    sum = read_samples(pid, samples)
      |> Enum.map(fn sample -> sample / 4095 end)
      |> Enum.sum
    avg = sum / samples
    avg * @v_ref * 2 # FIXME: why is the 2 necessary?
  end

  @spec read_samples(pid, integer) :: [0..4095]
  def read_samples(pid, count) when is_pid(pid) and is_integer(count) do
    Enum.map(1..count, fn _ -> read_sample(pid) end)
  end

  @spec read_sample(pid) :: 0..4095
  def read_sample(pid) when is_pid(pid) do
    <<
      _ :: size(4),
      sample :: big-unsigned-integer-size(12)
    >> = I2c.write_read(pid, <<@result_register>>, 2)
    sample
  end
end
