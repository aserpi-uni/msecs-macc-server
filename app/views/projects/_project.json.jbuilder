json.extract! project, :description, :status

json.deliveryTime project.delivery_time.iso8601
json.projectName project.project_name

json.activities project.activities do |activity|
  json.partial! "activities/activity_reference", activity: activity
end

json.workspace do
  json.name project.workspace.name
  json.url workspace_url(project.workspace, format: :json)
end

json.url project_url(project, format: :json)
