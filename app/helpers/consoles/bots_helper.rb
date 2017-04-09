module Consoles::BotsHelper
  def bot_collection
    bot_kind_ids = KeyValues::Bot::Kind.all.map(&:id)
    bots_ids     = bots.pluck(:id)

    KeyValues::Bot::Kind.find(bot_kind_ids - bots_ids).map {|t| [t.name, t.id]}
  end

  def bot_link_to bot
    case bot.kind
    when Bot::Kind::FACEBOOK
      link_to "https://m.me/#{bot.bot_id}", "https://m.me/#{bot.bot_id}", target: '_blank'
    when Bot::Kind::LINE
      link_to "https://line.me/R/ti/p/#{bot.bot_id}", "https://line.me/R/ti/p/#{bot.bot_id}", target: '_blank'
    when Bot::Kind::TELEGRAM
    end
  end
end
