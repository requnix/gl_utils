# GlUtils

Exposes **all** of the macros associated with the erlang `:gl` modules via a
`:gl_const` module.

Also see [WxUtils](https://github.com/sschneider1207/wx_utils) which I have
blatantly copied and does the same thing for the `:wx` macros.

# Credits

- Sam Schneider (did 99% of the work, if I'm honest)

## Usage

    iex> :gl_const.wxVERTICAL
    8

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add wx_utils to your list of dependencies in `mix.exs`:

        def deps do
          [{:gl_utils, "~> 0.0.1"}]
        end
