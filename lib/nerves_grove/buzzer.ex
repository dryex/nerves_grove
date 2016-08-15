# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Buzzer do
  @moduledoc """
  http://www.seeedstudio.com/wiki/Grove_-_Buzzer
  """

  def start_link(pin) do
    {:ok, _pid} = Gpio.start_link(pin, :output)
  end

  @doc "Beeps the buzzer."
  def beep(pid, duration \\ 0.1) do
    duration_in_ms = duration * 1000 |> round
    on(pid)
    :timer.sleep(duration_in_ms)
    off(pid)
  end

  @doc "Turns on the buzzer."
  def on(pid) do
    Gpio.write(pid, 1)
  end

  @doc "Turns off the buzzer."
  def off(pid) do
    Gpio.write(pid, 0)
  end
end
