require 'dotenv/load'
require 'discordrb'
require_relative 'mention_words'

mention_words = MentionWords.new

bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN']

bot.ready do |event|
  bot.listening=("Dancing Lasha Tumbai")
end

bot.message(with_text: mention_words.prep_words('Ja Ja')) do |event|
  event.respond 'Ding Dong!'
end

bot.mention(containing: mention_words.prep_words("trivia")) do |event|
  event.respond File.readlines("data/trivia.txt").sample
end

bot.mention(containing: mention_words.prep_words("gif")) do |event|
  event.channel.send_file File.new(Dir.glob("data/gifs/*.gif").sample)
end

bot.mention(containing: not!(mention_words.used_words)) do |event|
  now = Date.today
  eurovision = Date.new(2021,5,22)

  daystoeurovision = eurovision.mjd - now.mjd

  case daystoeurovision
  when -1
    event.respond "Anyone else hungover?"
  when 0
    event.respond "TODAY IS THE DAY!"
  when 1
    event.respond "Tomorrow is the Eurovision final!"
  when 2..30
    event.respond "#{daystoeurovision} days to the Eurovision final!"
  end
end

bot.run