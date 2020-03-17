json.extract! worker, :id, :email, :bill_rate_cents, :currency
json.workspaces worker.workspaces do |workspace|
  json.id workspace.id
  json.url workspace_url(workspace, format: :json)
end
json.url worker_url(worker, format: :json)
