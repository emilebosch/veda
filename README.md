# Veda

Collaborate documentation and WIKI

## Hacking

Clone and cd this repo:

```
git@github.com:emilebosch/veda.git
cd veda
```
Use rake to run the tests:

```
rake
```

### Note on .GIT in in test-repo

Because veda is build for viewing git repos its a bit of a jerk having .git in a git directory.
Therefore before testing it symlinks ``.git-data`` to ``.git``.

## Installing

Installing is simple

``gem install veda``

## How to use vedas

Using veda is simple! Just ``cd`` into a git directory and type ``veda`` to start.

``veda``

It will spawn a server where you can read your veda's locally.

List all vedas in the library

``veda library``

Get a veda and install it in the library

``veda pull emilebosch/kitesurfing``

to view your veda