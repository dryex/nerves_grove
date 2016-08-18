# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Buzzer do
  @moduledoc """
  Seeed Studio [Grove Buzzer](http://wiki.seeedstudio.com/wiki/Grove_-_Buzzer)

  # Example

      alias Nerves.Grove.Buzzer

      {:ok, pid} = Buzzer.start_link(pin)

      Buzzer.beep(pid, 0.1)  # make some noise for 100 ms
  """

  @spec start_link(pos_integer) :: {:ok, pid} | {:error, any}
  def start_link(pin) do
    Gpio.start_link(pin, :output)
  end

  @doc "Beeps the buzzer for a specified duration."
  @spec beep(pid, number) :: any
  def beep(pid, duration \\ 0.1) do
    duration_in_ms = duration * 1000 |> round
    on(pid)
    :timer.sleep(duration_in_ms)
    off(pid)
  end

  @doc "Switches on the buzzer, making a lot of noise."
  @spec on(pid) :: any
  def on(pid) do
    Gpio.write(pid, 1)
  end

  @doc "Switches off the buzzer, stopping the noise."
  @spec off(pid) :: any
  def off(pid) do
    Gpio.write(pid, 0)
  end
end
