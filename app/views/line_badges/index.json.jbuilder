json.array!(@line_badges) do |line_badge|
  json.extract! line_badge, :id, :badge_id, :user_id
  json.url line_badge_url(line_badge, format: :json)
end
