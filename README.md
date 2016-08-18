Nerves.Grove
============

[![Project license](https://img.shields.io/hexpm/l/nerves_grove.svg)](https://unlicense.org/)
[![Travis CI build status](https://img.shields.io/travis/bendiken/nerves_grove/master.svg)](https://travis-ci.org/bendiken/nerves_grove)
[![Coveralls.io code coverage](https://img.shields.io/coveralls/bendiken/nerves_grove/master.svg)](https://coveralls.io/github/bendiken/nerves_grove)
[![Hex.pm package](https://img.shields.io/hexpm/v/nerves_grove.svg)](https://hex.pm/packages/nerves_grove)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/nerves_grove.svg)](https://hex.pm/packages/nerves_grove)
[![Gratipay donations](https://img.shields.io/gratipay/user/bendiken.svg)](https://gratipay.com/~bendiken/)

[Grove](http://wiki.seeedstudio.com/wiki/Grove_System) module support for
the [Nerves](http://nerves-project.org/) embedded software framework.

Reference
---------

https://hexdocs.pm/nerves_grove/

Supported Hardware
------------------

### Seeed Studio [Grove Button](http://wiki.seeedstudio.com/wiki/Grove_-_Button)

[`Grove.Button`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Button.html

```elixir
alias Nerves.Grove.Button

{:ok, pid} = Button.start_link(pin)

state = Button.read(pid)  # check if button is pressed
```

### Seeed Studio [Grove Buzzer](http://wiki.seeedstudio.com/wiki/Grove_-_Buzzer)

[`Grove.Buzzer`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Buzzer.html

```elixir
alias Nerves.Grove.Buzzer

{:ok, pid} = Buzzer.start_link(pin)

Buzzer.beep(pid, 0.1)  # make some noise for 100 ms
```

### Seeed Studio [Grove I2C ADC](http://wiki.seeedstudio.com/wiki/Grove_-_I2C_ADC)

[`Grove.I2C.ADC`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.I2C.ADC.html

```elixir
alias Nerves.Grove.I2C

{:ok, pid} = I2C.ADC.start_link(address)

I2C.ADC.read_sample(pid)
```

### Seeed Studio [Grove LED](http://wiki.seeedstudio.com/wiki/Grove_-_LED)

[`Grove.LED`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.LED.html

```elixir
alias Nerves.Grove.LED

{:ok, pid} = LED.start_link(pin)

LED.blink(pid)
```

### Seeed Studio [Grove OLED Display 96×96](http://wiki.seeedstudio.com/wiki/Grove_-_OLED_Display_1.12%22)

[`Grove.OLED.Display`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.OLED.Display.html

```elixir
alias Nerves.Grove.OLED

{:ok, pid} = OLED.Display.start_link(address)

OLED.Display.reset(pid)
OLED.Display.clear(pid)
OLED.Display.set_text_position(pid, 0, 0)
OLED.Display.put_string(pid, "Hello, world")
```

### Seeed Studio [Grove Relay](http://wiki.seeedstudio.com/wiki/Grove_-_Relay)

[`Grove.Relay`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Relay.html

```elixir
alias Nerves.Grove.Relay

{:ok, pid} = Relay.start_link(pin)

Relay.on(pid)   # start current flow
Relay.off(pid)  # stop current flow
```

### Seeed Studio [Grove Sound Sensor](http://wiki.seeedstudio.com/wiki/Grove_-_Sound_Sensor)

[`Grove.Sensor.Sound`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Sensor.Sound.html

```elixir
alias Nerves.Grove.Sensor

{:ok, pid} = Sensor.Sound.start_link(address)

Sensor.Sound.read_value(pid)
```

### Seeed Studio [Grove Temperature Sensor](http://wiki.seeedstudio.com/wiki/Grove_-_Temperature_Sensor_V1.2)

[`Grove.Sensor.Temperature`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Sensor.Temperature.html

```elixir
alias Nerves.Grove.Sensor

{:ok, pid} = Sensor.Temperature.start_link(address)

Sensor.Temperature.read_centigrade(pid)
```

Installation
------------

Add `nerves_grove` to your list of dependencies in your project's `mix.exs` file:

```elixir
defp deps do
  [{:nerves_grove, "~> 0.4.0"}]
end
```

Alternatively, to pull in the dependency directly from a Git tag:

```elixir
defp deps do
  [{:nerves_grove, github: "bendiken/nerves_grove", tag: "0.4.0"}]
end
```

Alternatively, to pull in the dependency directly from a Git branch:

```elixir
defp deps do
  [{:nerves_grove, github: "bendiken/nerves_grove", branch: "master"}]
end
```
