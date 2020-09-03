json.extract! activity, :description, :status
json.deliveryTime activity.delivery_time.iso8601

json.project do
  json.projectName activity.project.project_name
  json.url project_url(activity.project, format: :json)
end

json.url project_activity_url(activity.project, activity, format: :json)
