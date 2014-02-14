json.array!(@timecodes) do |timecode|
  json.extract! timecode, :id, :descr, :typo
  json.url timecode_url(timecode, format: :json)
end
