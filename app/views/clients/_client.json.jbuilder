json.extract! client, :color, :description, :name
json.workspaces client.workspaces do |workspace|
  json.name workspace.name
  json.url workspace_url(workspace, format: :json)
end
json.url client_url(client, format: :json)
