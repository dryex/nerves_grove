Nerves.Grove
============

[![Project license](https://img.shields.io/hexpm/l/nerves_grove.svg)](https://unlicense.org/)
[![Travis CI build status](https://img.shields.io/travis/bendiken/nerves_grove/master.svg)](https://travis-ci.org/bendiken/nerves_grove)
[![Coveralls.io code coverage](https://img.shields.io/coveralls/bendiken/nerves_grove/master.svg)](https://coveralls.io/github/bendiken/nerves_grove)
[![Hex.pm package](https://img.shields.io/hexpm/v/nerves_grove.svg)](https://hex.pm/packages/nerves_grove)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/nerves_grove.svg)](https://hex.pm/packages/nerves_grove)
[![Gratipay donations](https://img.shields.io/gratipay/user/bendiken.svg)](https://gratipay.com/~bendiken/)

[Grove](http://www.seeedstudio.com/wiki/Grove_System) module support for
[Nerves](http://nerves-project.org/).

Examples
--------

```elixir
alias Nerves.Grove

# Button
{:ok, pid} = Grove.Button.start_link(2)
state = Grove.Button.read(pid)  # check if button is pressed

# Buzzer
{:ok, pid} = Grove.Buzzer.start_link(117)
Grove.Buzzer.beep(pid, 0.1)     # make some noise for 100 ms
```

Reference
---------

https://hexdocs.pm/nerves_grove/

### Modules

| Module           | Type    | Device                      |
| :--------------- | :------ | :-------------------------- |
| [`Grove.Button`] | Digital | Seeed Studio Grove [Button] |
| [`Grove.Buzzer`] | Digital | Seeed Studio Grove [Buzzer] |

[`Grove.Button`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Button.html
[`Grove.Buzzer`]: https://hexdocs.pm/nerves_grove/Nerves.Grove.Buzzer.html

[Button]:         http://www.seeedstudio.com/wiki/Grove_-_Button
[Buzzer]:         http://www.seeedstudio.com/wiki/Grove_-_Buzzer

Installation
------------

Add `nerves_grove` to your list of dependencies in your project's `mix.exs` file:

```elixir
defp deps do
  [{:nerves_grove, "~> 0.2.0"}]
end
```

Alternatively, to pull in the dependency directly from a Git tag:

```elixir
defp deps do
  [{:nerves_grove, github: "bendiken/nerves_grove", tag: "0.2.0"}]
end
```

Alternatively, to pull in the dependency directly from a Git branch:

```elixir
defp deps do
  [{:nerves_grove, github: "bendiken/nerves_grove", branch: "master"}]
end
```
