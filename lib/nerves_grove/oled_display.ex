# This is free and unencumbered software released into the public domain.

defmodule Nerves.Grove.OLED.Display do
  @moduledoc """
  http://wiki.seeedstudio.com/wiki/Grove_-_OLED_Display_1.12%22
  http://garden.seeedstudio.com/images/8/82/SSD1327_datasheet.pdf
  """

  @default_address 0x3C
  @command_mode    0x80
  @data_mode       0x40

  @spec start_link(byte) :: {:ok, pid} | {:error, any}
  def start_link(address \\ @default_address) do
    I2c.start_link("i2c-2", address)
  end

  @spec reset(pid) :: :ok
  def reset(pid) do
    send_commands(pid, <<0xFD, 0x12>>)
    off(pid)
    set_multiplex_ratio(pid, 95) # 96
    set_start_line(pid, 0)
    set_display_offset(pid, 96)
    set_vertical_mode(pid)
    send_commands(pid, <<0xAB, 0x01>>)
    set_contrast_level(pid, 0x53) # 100 nit
    send_commands(pid, <<0xB1, 0x51>>)
    send_commands(pid, <<0xB3, 0x01>>)
    send_commands(pid, <<0xB9>>)
    send_commands(pid, <<0xBC, 0x08>>)
    send_commands(pid, <<0xBE, 0x07>>)
    send_commands(pid, <<0xB6, 0x01>>)
    send_commands(pid, <<0xD5, 0x62>>)
    set_normal_mode(pid)
    set_activate_scroll(pid, false)
    on(pid)
    :timer.sleep(100) # ms
    set_row_address(pid, 0, 95)
    set_column_address(pid, 8, 8 + 47)
  end

  @spec on(pid) :: :ok
  def on(pid) do
    send_command(pid, 0xAF)
  end

  @spec off(pid) :: :ok
  def off(pid) do
    send_command(pid, 0xAE)
  end

  @spec set_column_address(pid, byte, byte) :: :ok
  def set_column_address(pid, start, end_) do
    send_commands(pid, <<0x15, start, end_>>)
  end

  @spec set_row_address(pid, byte, byte) :: :ok
  def set_row_address(pid, start, end_) do
    send_commands(pid, <<0x75, start, end_>>)
  end

  @spec set_contrast_level(pid, byte) :: :ok
  def set_contrast_level(pid, level) do
    send_commands(pid, <<0x81, level>>)
  end

  @spec set_horizontal_mode(pid) :: :ok
  def set_horizontal_mode(pid) do
    send_commands(pid, <<0xA0, 0x42>>)
    set_row_address(pid, 0, 95)
    set_column_address(pid, 8, 8 + 47)
  end

  @spec set_vertical_mode(pid) :: :ok
  def set_vertical_mode(pid) do
    send_commands(pid, <<0xA0, 0x46>>)
  end

  @spec set_start_line(pid, 0..127) :: :ok
  def set_start_line(pid, row) do
    send_commands(pid, <<0xA1, row>>)
  end

  @spec set_display_offset(pid, 0..127) :: :ok
  def set_display_offset(pid, row) do
    send_commands(pid, <<0xA2, row>>)
  end

  @spec set_normal_mode(pid) :: :ok
  def set_normal_mode(pid) do
    send_command(pid, 0xA4)
  end

  @spec set_inverse_mode(pid) :: :ok
  def set_inverse_mode(pid) do
    send_command(pid, 0xA7)
  end

  @spec set_multiplex_ratio(pid, 16..128) :: :ok
  def set_multiplex_ratio(pid, ratio) do
    send_commands(pid, <<0xA8, ratio>>)
  end

  @spec set_activate_scroll(pid, false) :: :ok
  def set_activate_scroll(pid, false) do
    send_command(pid, 0x2E)
  end

  @spec set_activate_scroll(pid, true) :: :ok
  def set_activate_scroll(pid, true) do
    send_command(pid, 0x2F)
  end

  @spec clear(pid, byte) :: :ok
  def clear(pid, color \\ 0x00) do
    (1..(96 * 48)) |> Enum.each(fn _ -> send_data(pid, color) end)
  end

  @spec send_commands(pid, <<>>) :: :ok
  defp send_commands(_pid, <<>>), do: nil

  @spec send_commands(pid, binary) :: :ok
  defp send_commands(pid, <<head, rest :: binary>>) do
    send_command(pid, head)
    send_commands(pid, rest)
  end

  @spec send_command(pid, byte) :: :ok
  defp send_command(pid, command) do
    I2c.write(pid, <<@command_mode, command>>)
  end

  @spec send_data(pid, byte) :: :ok
  defp send_data(pid, data) do
    I2c.write(pid, <<@data_mode, data>>)
  end
end
