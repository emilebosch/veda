# Veda

Collaborate documentation and WIKI

## What is Veda?

Veda is Git based documentation system, it aims to simplify writing documentation and text using
the same methodologies as writing code. Everyone can fork and contribute documentation.

## Getting Veda

Installing is easy! Just type:

```
gem install veda
```

In case you use RBENV type ``rbenv rehash`` to make the ``veda`` command available.
Then go in to a directory with markdown and type:

```
veda
```

to start the veda server. You can then browse to ``http://localhost:4567`` to read the
documentation.

## Installing Veda documentation

Veda makes it easy to download and view documentation written on github.

```
veda install emilebosch/guides
```

It will clone the repo from github, install it in ``~/.veda/library/emilebosch/guides``.

To view a list of locally installed documentation type:

```
veda list
```

## Mounting Veda in Rails apps

You can mount Veda also in your rails app like any other rack app. This allows you
to expose your documentation fast and easy. Just put this baby in your ``routes.rb``

```
mount Veda::Server.new("my-haikus", Rails.root) => "/haiku"
```

## Extending Veda

You can extend veda by placing a ``Vedafile`` in a directory. This will be loaded runtime.

You can then freedompatch Veda into awesomeness.

### Providing your own views

For instance, u can provide your own views, u can just patch the ``Veda::Server``.

```
class Veda::Server
  set :root, File.dirname(__FILE__)
end
```

## Hacking on Veda

Yes, please help out and make Veda awesome! I need your mad skills to take this further.

Fork, clone and cd this repo:

```
git@github.com:emilebosch/veda.git
cd veda
```
Use rake to run the tests:

```
rake
```