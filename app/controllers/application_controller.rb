class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_url(subdomain: nil)
  end

  def prepare_meta_tags(opts = {})
    title       = opts[:title] || I18n.t('title')
    site        = opts[:site] || ''
    description = opts[:description]
    keywords    = opts[:keywords]

    defaults = {
      # common
      title: title,
      site: site,
      description: description,
      keywords: keywords,

      # facebook
      og: {
        title: site.present? ? "#{site} | #{title}" : title,
        description: description,
        url: request.original_url,
        site_name: title,
        type: opts[:type] || 'website',
        image: opts[:image]
      },

      twitter: {
        card: 'summary',
        title: site.present? ? "#{site} | #{title}" : title,
        description: description,
        url: request.original_url,
        image: opts[:image]
      }
    }

    set_meta_tags defaults
  end
end
