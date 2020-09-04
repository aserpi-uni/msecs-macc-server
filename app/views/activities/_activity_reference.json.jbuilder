json.extract! activity, :description, :status
json.deliveryTime activity.delivery_time.iso8601

json.url project_activity_url(activity.project, activity, format: :json)
