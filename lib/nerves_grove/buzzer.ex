# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Buzzer do
  @moduledoc """
  http://www.seeedstudio.com/wiki/Grove_-_Buzzer
  """

  def start_link(pin) do
    {:ok, _pid} = Gpio.start_link(pin, :output)
  end

  def beep(pid, duration \\ 0.1) do
    Gpio.write(pid, 1)
    :timer.sleep(duration * 1000 |> round) # ms
    Gpio.write(pid, 0)
  end
end
