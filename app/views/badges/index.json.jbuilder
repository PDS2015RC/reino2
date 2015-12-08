json.array!(@badges) do |badge|
  json.extract! badge, :id, :issuer_url, :issuer_organization, :name, :description, :img_url,
  json.url badge_url(badge, format: :json)
end
