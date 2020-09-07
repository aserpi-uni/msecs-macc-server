json.extract! subactivity, :description, :status
json.deliveryTime subactivity.delivery_time.iso8601

json.activity do
  json.partial! 'activities/activity_reference', activity: subactivity.activity
end

json.worker_1 do
  json.email subactivity.worker_1.email
  json.url worker_url(subactivity.worker_1, format: :json)
end

json.worker_2 do
  json.email subactivity.worker_2.email
  json.url worker_url(subactivity.worker_2, format: :json)
end

json.worker_3 do
  json.email subactivity.worker_3.email
  json.url worker_url(subactivity.worker_3, format: :json)
end

json.workingschedules subactivity.workingschedules do |workingschedule|
  json.url workingschedule_url(workingschedule, format: :json)
end

json.url project_activity_subactivity_url(subactivity.activity.project, subactivity.activity, subactivity, format: :json)
