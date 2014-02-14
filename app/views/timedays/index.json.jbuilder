json.array!(@timedays) do |timeday|
  json.extract! timeday, :id, :day, :code1, :hour1, :code2, :hour2, :code3, :hour3, :timesheet_id, :note
  json.url timeday_url(timeday, format: :json)
end
