json.extract! workspace, :description, :name

json.master(workspace.master_id == current_worker.id) if current_worker

json.clients workspace.clients do |client|
  json.partial! 'clients/client_reference', client: client
end

json.projects workspace.projects do |project|
  json.partial! 'projects/project_reference', project: project
end

json.workers workspace.workers do |worker|
  json.email worker.email
  json.url worker_url(worker, format: :json)
end

json.url workspace_url(workspace, format: :json)
