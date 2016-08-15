# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.OLED.Display do
  @moduledoc """
  http://wiki.seeedstudio.com/wiki/Grove_-_OLED_Display_1.12%22
  """

  @default_address 0x3C
  @command_mode    0x80
  @data_mode       0x40

  def start_link(address \\ @default_address) do
    I2c.start_link("i2c-2", address)
  end

  def init(pid) do
    send_commands(pid,
      <<0xFD, 0x12, 0xAE, 0xA8, 0x5F, 0xA1, 0x00, 0xA2,
        0x60, 0xA0, 0x46, 0xAB, 0x01, 0x81, 0x53, 0xB1,
        0x51, 0xB3, 0x01, 0xB9, 0xBC, 0x08, 0xBE, 0x07,
        0xB6, 0x01, 0xD5, 0x62, 0xA4, 0x2E, 0xAF>>)
    :timer.sleep(100) # ms
    set_row_address(pid, 0, 95)
    set_column_address(pid, 8, 8 + 47)
  end

  def set_normal_display(pid) do
    send_command(pid, 0xA4)
  end

  def set_row_address(pid, start, end_) do
    send_commands(pid, <<0x75, start, end_>>)
  end

  def set_column_address(pid, start, end_) do
    send_commands(pid, <<0x15, start, end_>>)
  end

  def clear(pid, color \\ 0x00) do
    (1..(96 * 48)) |> Enum.each(&(send_data(pid, color)))
  end

  defp send_commands(_pid, <<>>), do: nil

  defp send_commands(pid, <<head, rest :: binary>>) do
    send_command(pid, head)
    send_commands(pid, rest)
  end

  defp send_command(pid, command) do
    I2c.write(pid, <<@command_mode, command>>)
  end

  defp send_data(pid, data) do
    I2c.write(pid, <<@data_mode, data>>)
  end
end
