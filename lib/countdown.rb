require 'dotenv/load'
require 'discordrb'

bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN']

now = Date.today
eurovision = Date.new(2021,5,22)
daystoeurovision = eurovision.mjd - now.mjd

case daystoeurovision
when -1
  message = "Anyone else hungover?"
when 0
  message = "TODAY IS THE DAY!"
when 1
  message = "Tomorrow is the Eurovision final!"
when 2..30
  message = "Good morning! It's #{daystoeurovision} days to the Eurovision final!"
end

bot.run :async

bot.servers.each do |id, server|
  bot.channel(server.system_channel).send(message)
end