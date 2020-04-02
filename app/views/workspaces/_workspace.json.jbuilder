json.extract! workspace, :description, :name
json.clients workspace.clients do |client|
  json.name client.name
  json.url client_url(client, format: :json)
end
json.workers workspace.workers do |worker|
  json.email worker.email
  json.url worker_url(worker, format: :json)
end
json.url workspace_url(workspace, format: :json)
