module ApplicationHelper
  def developer_google_analytics_snippet
    if Rails.env.production? && user_tracking_page? && tracking_id
      render "common/google_analytics", tracking_id: tracking_id
    end
  end

  def user_tracking_page?
    (controller_name == "sharks" && (action_name == "show" || action_name == "donate")) ||
    (controller_name == "developers" && action_name == "show")
  end

  def tracking_id
    case controller_name
    when "sharks"
      shark.user.tracking_id
    when "developers"
      user.tracking_id
    end
  end
end
