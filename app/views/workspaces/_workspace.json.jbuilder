json.extract! workspace, :id, :description, :name
json.workers workspace.workers do |worker|
  json.id worker.id
  json.url worker_url(worker, format: :json)
end
json.url workspace_url(workspace, format: :json)
