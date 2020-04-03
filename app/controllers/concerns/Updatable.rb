module Updatable
  extend ActiveSupport::Concern

  def touch_updated_at(resource)
    touch if persisted?
    resource.touch if resource.class.included_modules.include?(Updatable) && resource.persisted?
  end
end
