require 'dotenv/load'
require 'discordrb'

bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN']

bot.ready do |event|
  bot.listening=("Dancing Lasha Tumbai")
end

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

trivia_words = ["trivia","Trivia","TRIVIA"]

bot.mention(containing: trivia_words) do |event|
  event.respond File.readlines("data/trivia.txt").sample
end

gif_words = ["gif","Gif","GIF"]

bot.mention(containing: "gif") do |event|
  event.channel.send_file File.new(Dir.glob("data/gifs/*.gif").sample)
end

bot.mention(containing: not!(trivia_words + gif_words)) do |event|
  now = Date.today
  eurovision = Date.new(2021,5,22)

  daystoeurovision = eurovision.mjd - now.mjd

  event.respond "#{daystoeurovision} days to the Eurovision final!"
end

bot.run