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
to expose your documentation fast and easy.

```
mount Veda::Server.new("my-haikus", Rails.root) => "/haiku"
```

## Hacking on Veda

Clone and cd this repo:

```
git@github.com:emilebosch/veda.git
cd veda
```
Use rake to run the tests:

```
rake
```