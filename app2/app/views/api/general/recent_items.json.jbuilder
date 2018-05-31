json.status 'success'
json.data do
  json.array! @seeds do |seed|
    json.label seed.label
    json.consumed seed.consumed
  end
end
