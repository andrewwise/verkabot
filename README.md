# Verkabot

A Eurovision themed Discord bot written in Ruby using the [offical Discord API gem](https://github.com/shardlab/discordrb).

## Add to your server

[Click here to install a hosted version Verkabot on your server.](https://discord.com/api/oauth2/authorize?client_id=836531590888554527&permissions=2048&scope=bot)

## Features

* Counts down to the Eurovision final daily in the 30 days up to it.
* Replies with random trivia when asked.
* Replies with random gifs when asked.

## Developing

To run Verkabot locally you will first need to have Ruby installed.

Then you will need to create a `.env` file with a API token for your own app. [You can generate a token here.](https://discord.com/developers)

```
DISCORD_BOT_TOKEN=YOUR TOKEN HERE
```

Once you have done this run bundler to install the required gems:

```bash
bundle install
```
An then finally to run the bot:

```bash
ruby lib/bot.rb
```
