json.extract! workspace, :description, :name
json.workers workspace.workers do |worker|
  json.email worker.email
  json.url worker_url(worker, format: :json)
end
json.url workspace_url(workspace, format: :json)
