json.extract! workspace, :description, :name
json.workers workspace.workers do |worker|
  json.id worker.id
  json.email worker.email
end
json.url workspace_url(workspace, format: :json)
