# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.Relay do
  @moduledoc """
  http://wiki.seeedstudio.com/wiki/Grove_-_Relay
  """

  def start_link(pin) do
    {:ok, _pid} = Gpio.start_link(pin, :output)
  end

  @doc "Switches on the relay, enabling current to flow."
  def on(pid) do
    Gpio.write(pid, 1)
  end

  @doc "Switches off the relay, preventing current from flowing."
  def off(pid) do
    Gpio.write(pid, 0)
  end
end
