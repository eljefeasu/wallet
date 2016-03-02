json.array!(@histories) do |history|
  json.extract! history, :id, :description, :amount, :boolean
  json.url history_url(history, format: :json)
end
