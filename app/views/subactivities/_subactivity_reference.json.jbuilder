json.extract! subactivity, :description, :status
json.deliveryTime subactivity.delivery_time.iso8601

json.url project_activity_subactivity_url(subactivity.activity.project, subactivity.activity, subactivity, format: :json)
