# Twitcoin Server Provisioning Recipes

These [Sunzi](https://github.com/kenn/sunzi) recipes are used for the setup and
the initial deployment of [Twitcoin](https://twitcoin.net). See
[here](https://github.com/KlausTrainer/twitcoin) the Twitcoin source code.
The recipes are targeted at a bare Ubuntu 12.04 server.

## Installation

Make sure that you have [Sunzi](https://github.com/kenn/sunzi) installed on
your system:

    gem install sunzi

## Assumptions / Prerequisites

* Ubuntu 12.04 server
* SSH access to this very server as root user (or rather a sudoer)

## Fire!

Go into the `twitcoin-deploy` top directory and run one of the following
commands (depending on what kind of user you have) from your shell:

    sunzi deploy root@example.com

or

    sunzi deploy user@example.com --sudo

## Customization

The main script is `install.sh`. There you can change which recipes are
executed, do customizations, and so on.

The recipes reside in the (surprise!) `recipes/` directory.

Please consult the [Sunzi documentation](https://github.com/kenn/sunzi#readme)
to learn more about how to work with these recipes or how to create new ones.
