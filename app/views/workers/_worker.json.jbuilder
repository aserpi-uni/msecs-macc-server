json.extract! worker, :email, :bill_rate_cents, :currency
json.workspaces worker.workspaces do |workspace|
  json.name workspace.name
  json.url workspace_url(workspace, format: :json)
end
json.url worker_url(worker, format: :json)
