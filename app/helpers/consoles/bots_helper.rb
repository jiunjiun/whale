module Consoles::BotsHelper
  def bot_collection
    bot_kind_ids = KeyValues::Bot::Kind.all.map(&:id)
    bots_ids     = bots.pluck(:kind)

    KeyValues::Bot::Kind.find(bot_kind_ids - bots_ids).map {|t| [t.name, t.id]}
  end

  def bot_link_to bot
    link_to bot_link(bot), bot_link(bot), target: '_blank'
  end

  def bot_link bot
    case bot.kind
    when Bot::Kind::FACEBOOK
      "https://m.me/#{bot.bot_id}"
    when Bot::Kind::LINE
      "https://line.me/R/ti/p/#{bot.bot_id}"
    when Bot::Kind::TELEGRAM
      "https://telegram.me/#{bot.bot_id.delete('@')}"
    end
  end
end
