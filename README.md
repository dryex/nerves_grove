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

Supported Hardware
------------------

[![Grove Button][button.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Button.html)
[![Grove Buzzer][buzzer.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Buzzer.html)
[![Grove I2C ADC][i2c-adc.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.I2C.ADC.html)
[![Grove LED][led.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.LED.html)
[![Grove OLED Display 96×96][oled-display.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.OLED.Display.html)
[![Grove Relay][relay.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Relay.html)
[![Grove Rotary Angle Sensor][potentiometer-rotary.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Potentiometer.html)
[![Grove Slide Potentiometer][potentiometer-slide.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Potentiometer.html)
[![Grove Sound Sensor][sensor-sound.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Sensor.Sound.html)
[![Grove Temperature Sensor][sensor-temperature.png]](https://hexdocs.pm/nerves_grove/Nerves.Grove.Sensor.Temperature.html)

[button.png]:               https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/button.png "Grove Button"
[buzzer.png]:               https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/buzzer.png "Grove Buzzer"
[i2c-adc.png]:              https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/i2c-adc.png "Grove I2C ADC"
[led.png]:                  https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/led.png "Grove LED"
[oled-display.png]:         https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/oled-display.png "Grove OLED Display 96×96"
[relay.png]:                https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/relay.png "Grove Relay"
[potentiometer-rotary.png]: https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/potentiometer-rotary.png "Grove Rotary Angle Sensor"
[potentiometer-slide.png]:  https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/potentiometer-slide.png "Grove Slide Potentiometer"
[sensor-sound.png]:         https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/sensor-sound.png "Grove Sound Sensor"
[sensor-temperature.png]:   https://raw.githubusercontent.com/bendiken/nerves_grove/master/etc/photos/sensor-temperature.png "Grove Temperature Sensor"

Reference
---------

https://hexdocs.pm/nerves_grove/

Examples
--------

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

I2C.ADC.read_voltage(pid)
```

### Seeed Studio [Grove LED](http://wiki.seeedstudio.com/wiki/Grove_-_LED) and [Grove LED Socket Kit](http://wiki.seeedstudio.com/wiki/Grove_-_LED_Socket_Kit)

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

### Seeed Studio [Grove Rotary Angle Sensor](http://wiki.seeedstudio.com/wiki/Grove_-_Rotary_Angle_Sensor) and [Grove Slide Potentiometer](http://wiki.seeedstudio.com/wiki/Grove_-_Slide_Potentiometer)

[`Grove.Potentiometer`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Potentiometer.html

```elixir
alias Nerves.Grove.Potentiometer

{:ok, pid} = Potentiometer.start_link(address)

Potentiometer.read_value(pid)
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
