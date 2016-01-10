# expinboard

An elixir client for the [pinboard.in api](https://pinboard.in/api/).


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add expinboard to your list of dependencies in `mix.exs`:

        def deps do
          [{:expinboard, "~> 0.0.1"}]
        end

  2. Ensure expinboard is started before your application:

        def application do
          [applications: [:expinboard]]
        end

## Usage

### Fetch all bookmarks

´´´elixir
bookmarks = Pinboard.all "your_api_token"
["http://chimera.labs.oreilly.com/books/1234000001642/ch05.html",
 "https://github.com/lukehoban/es6features/blob/master/README.md",
 "https://www.softwerkskammer.org/wiki/alle/katas-koans-codebases",
 "https://joearms.github.io/2013/05/31/a-week-with-elixir.html",
 "https://github.com/mmistakes/minimal-mistakes",
 "http://mmistakes.github.io/minimal-mistakes/", "http://www.lovetextures.com/",
 ...]
´´´
