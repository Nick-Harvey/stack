json.array!(@ambassadors) do |ambassador|
  json.extract! ambassador, :id, :Name, :Stack_Username
  json.url ambassador_url(ambassador, format: :json)
end
