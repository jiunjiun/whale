module ApplicationHelper
  def render_user_google_analytics_snippet
    if user_tracking_page?
      render "common/google_analytics", tracking_id: tracking_id if tracking_id
    end
  end

  def user_tracking_page?
    (controller_name == "sharks" && (action_name == "show" || "donate")) ||
    (controller_name == "developers" && action_name == "show")
  end

  def tracking_id
    case controller_name
    when "sharks" then shark.user.tracking_id
    when "developers" then user.tracking_id
    end
  end
end
