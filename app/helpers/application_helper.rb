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
end
