class HelpsController < ApplicationController

  def donate
    opts = {
      site: I18n.t('helps.donate'),
      description: I18n.t('helps.donate_desc'),
    }

    update_meta opts
  end

  private
  def update_meta opts
    meta_tags_option = {
      site: opts[:site],
      description: opts[:description],
    }

    prepare_meta_tags meta_tags_option
  end
end
