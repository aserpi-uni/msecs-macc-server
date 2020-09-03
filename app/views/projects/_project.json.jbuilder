json.extract! project, description

json.deliveryTime project.delivery_time
json.projectName project.project_name

json.workspace project.workspace do |workspace|
  json.name workspace.name
  json.url workspace_url(workspace, format: :json)
end

json.url project_url(project, format: :json)
