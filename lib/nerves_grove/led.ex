# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.LED do
  @moduledoc """
  Seeed Studio [Grove LED](http://wiki.seeedstudio.com/wiki/Grove_-_LED)

  # Example

      alias Nerves.Grove.LED

      {:ok, pid} = LED.start_link(pin)

      LED.blink(pid)
  """

  @spec start_link(pos_integer) :: {:ok, pid} | {:error, any}
  def start_link(pin) when is_integer(pin) do
    Gpio.start_link(pin, :output)
  end

  @doc "Blinks the LED for a specified duration."
  @spec blink(pid, number) :: any
  def blink(pid, duration \\ 0.2) when is_pid(pid) and is_number(duration) do
    duration_in_ms = duration * 1000 |> round
    on(pid)
    :timer.sleep(duration_in_ms)
    off(pid)
  end

  @doc "Switches on the LED."
  @spec on(pid) :: any
  def on(pid) when is_pid(pid) do
    Gpio.write(pid, 1)
  end

  @doc "Switches off the LED."
  @spec off(pid) :: any
  def off(pid) when is_pid(pid) do
    Gpio.write(pid, 0)
  end
end
