json.workers @workspace.workers do |worker|
  json.email worker.email
  json.url worker.id.to_s
end
