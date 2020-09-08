json.extract! worker, :email, :bill_rate_cents, :currency

json.clients worker.clients do |client|
  json.partial! 'clients/client_reference', client: client
end

json.projects worker.projects do |project|
  json.partial! 'projects/project_reference', project: project
end

json.workspaces worker.workspaces do |workspace|
  json.name workspace.name
  json.url workspace_url(workspace, format: :json)
end

json.url worker_url(worker, format: :json)
