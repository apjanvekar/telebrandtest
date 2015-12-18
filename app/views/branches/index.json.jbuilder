json.array!(@branches) do |branch|
  json.extract! branch, :id, :branch_name
  json.url branch_url(branch, format: :json)
end
