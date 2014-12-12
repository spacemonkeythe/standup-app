json.array!(@standups) do |standup|
  json.extract! standup, :id, :title, :content
  json.url link_url(link, format: :json)
end
