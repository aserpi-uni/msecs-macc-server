json.extract! activity, :description, :status
json.deliveryTime activity.delivery_time.iso8601

json.master(activity.workspace.master_id == current_worker.id) if current_worker

json.project do
  json.projectName activity.project.project_name
  json.url project_url(activity.project, format: :json)
end

json.subactivities activity.subactivities do |subactivity|
  json.partial! 'subactivities/subactivity_reference', subactivity: subactivity
end

json.url project_activity_url(activity.project, activity, format: :json)
