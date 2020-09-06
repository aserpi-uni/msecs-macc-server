module ApplicationHelper
  # Checks if breadcrumb must be active
  def active_breadcrumb(active)
    ' active' if active
  end

  # Converts Rails flash message types into Bootstrap message types.
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success' # Green
    when 'error'
      'alert-danger' # Red
    when 'alert'
      'alert-warning' # Yellow
    when 'notice'
      'alert-info' # Blue
    else
      flash_type.to_s
    end
  end

  def color_helper(color)
    color ? "##{color.to_s(16).rjust(6, '0')}" : nil
  end

  def status_icon(resource)
    if resource.status == "finished"
      { color: "#c8e6c9", icon: :check_circle }
    elsif resource.status == "undefined"
      { color: "#757575", icon: :help }
    elsif resource.delivery_time < DateTime.now
      { color: "#ffcdd2", icon: :error }
    else
      { color: "#bbdefb", icon: :play_circle_filled }
    end
  end
end
