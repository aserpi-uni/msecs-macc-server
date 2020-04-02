module ClientsHelper
  def color_helper(color)
    color ? "##{color.to_s(16).rjust(6, '0')}" : nil
  end
end
