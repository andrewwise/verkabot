require 'dotenv/load'
require 'discordrb'

bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN']

now = Date.today
eurovision = Date.new(2021,5,22)
daystoeurovision = eurovision.mjd - now.mjd
message = "Good morning! It's #{daystoeurovision} days to the Eurovision final!"

bot.run :async

bot.servers.each do |id, server|
  bot.channel(server.system_channel).send(message)
end