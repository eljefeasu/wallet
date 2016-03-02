json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :description, :amount, :debit_or_credit
  json.url transaction_url(transaction, format: :json)
end
