Nerves.Grove
============

[![Project license](https://img.shields.io/hexpm/l/nerves_grove.svg)](https://unlicense.org/)
[![Travis CI build status](https://img.shields.io/travis/bendiken/nerves_grove/master.svg)](https://travis-ci.org/bendiken/nerves_grove)
[![Coveralls.io code coverage](https://img.shields.io/coveralls/bendiken/nerves_grove/master.svg)](https://coveralls.io/github/bendiken/nerves_grove)
[![Hex.pm package](https://img.shields.io/hexpm/v/nerves_grove.svg)](https://hex.pm/packages/nerves_grove)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/nerves_grove.svg)](https://hex.pm/packages/nerves_grove)
[![Gratipay donations](https://img.shields.io/gratipay/user/bendiken.svg)](https://gratipay.com/~bendiken/)

[Grove](http://wiki.seeedstudio.com/wiki/Grove_System) module support for
[Nerves](http://nerves-project.org/).

Examples
--------

```elixir
alias Nerves.Grove

# Button
{:ok, pid} = Grove.Button.start_link(pin)
state = Grove.Button.read(pid)  # check if button is pressed

# Buzzer
{:ok, pid} = Grove.Buzzer.start_link(pin)
Grove.Buzzer.beep(pid, 0.1)     # make some noise for 100 ms

# I2C ADC
{:ok, pid} = Grove.I2C.ADC.start_link(address)
Grove.I2C.ADC.read_sample(pid)

# OLED Display (96×96)
{:ok, pid} = Grove.OLED.Display.start_link(address)
Grove.OLED.Display.reset(pid)
Grove.OLED.Display.clear(pid)
Grove.OLED.Display.set_text_position(pid, 0, 0)
Grove.OLED.Display.put_string(pid, "Hello, world")

# Relay
{:ok, pid} = Grove.Relay.start_link(pin)
Grove.Relay.on(pid)             # start current flow
Grove.Relay.off(pid)            # stop current flow
```

Reference
---------

https://hexdocs.pm/nerves_grove/

### Modules

| Module                 | Type    | Device                                    |
| :--------------------- | :------ | :---------------------------------------- |
| [`Grove.Button`]       | Digital | Seeed Studio [Grove Button]               |
| [`Grove.Buzzer`]       | Digital | Seeed Studio [Grove Buzzer]               |
| [`Grove.I2C.ADC`]      | I2C     | Seeed Studio [Grove I2C ADC]              |
| [`Grove.OLED.Display`] | I2C     | Seeed Studio [Grove OLED Display 96×96]   |
| [`Grove.Relay`]        | Digital | Seeed Studio [Grove Relay]                |

[`Grove.Button`]:           https://hexdocs.pm/nerves_grove/Nerves.Grove.Button.html
[`Grove.Buzzer`]:           https://hexdocs.pm/nerves_grove/Nerves.Grove.Buzzer.html
[`Grove.I2C.ADC`]:          https://hexdocs.pm/nerves_grove/Nerves.Grove.I2C.ADC.html
[`Grove.OLED.Display`]:     https://hexdocs.pm/nerves_grove/Nerves.Grove.OLED.Display.html
[`Grove.Relay`]:            https://hexdocs.pm/nerves_grove/Nerves.Grove.Relay.html

[Grove Button]:             http://wiki.seeedstudio.com/wiki/Grove_-_Button
[Grove Buzzer]:             http://wiki.seeedstudio.com/wiki/Grove_-_Buzzer
[Grove I2C ADC]:            http://wiki.seeedstudio.com/wiki/Grove_-_I2C_ADC
[Grove OLED Display 96×96]: http://wiki.seeedstudio.com/wiki/Grove_-_OLED_Display_1.12%22
[Grove Relay]:              http://wiki.seeedstudio.com/wiki/Grove_-_Relay

Installation
------------

Add `nerves_grove` to your list of dependencies in your project's `mix.exs` file:

```elixir
defp deps do
  [{:nerves_grove, "~> 0.3.0"}]
end
```

Alternatively, to pull in the dependency directly from a Git tag:

```elixir
defp deps do
  [{:nerves_grove, github: "bendiken/nerves_grove", tag: "0.3.0"}]
end
```

Alternatively, to pull in the dependency directly from a Git branch:

```elixir
defp deps do
  [{:nerves_grove, github: "bendiken/nerves_grove", branch: "master"}]
end
```
