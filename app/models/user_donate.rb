class UserDonate < ApplicationRecord
  belongs_to :user

  module PaypalLogo
    NORMAL = 'https://www.paypalobjects.com/webstatic/en_US/i/btn/png/silver-rect-paypal-34px.png'
    LARGE  = 'https://www.paypalobjects.com/webstatic/en_US/i/btn/png/gold-rect-paypal-60px.png'
  end

  def filter_html opts={}
    doc = Nokogiri::HTML::DocumentFragment.parse(self.html)

    # remove script, link, style tag
    doc.css('script, link, style').remove

    # change donate image
    case opts[:size]
    when 'normal'
      paypal_logo_path = PaypalLogo::NORMAL
    when 'large'
      paypal_logo_path = PaypalLogo::LARGE
    else
      paypal_logo_path = PaypalLogo::NORMAL
    end
    doc.at_css('form input[type=image]')['src'] = paypal_logo_path


    doc.at_css('form').to_s
  end
end
