json.extract! workingschedule, :hours
json.date workingschedule.date.iso8601

json.subactivity do
  json.partial! 'subactivities/subactivity_reference', subactivity: workingschedule.subactivity
end

json.url project_activity_subactivity_workingschedule_url(
             workingschedule.project, workingschedule.subactivity.activity, workingschedule.subactivity, workingschedule,
             format: :json)
