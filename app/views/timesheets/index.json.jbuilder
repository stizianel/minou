json.array!(@timesheets) do |timesheet|
  json.extract! timesheet, :id, :year, :month, :status, :user_id
  json.url timesheet_url(timesheet, format: :json)
end
