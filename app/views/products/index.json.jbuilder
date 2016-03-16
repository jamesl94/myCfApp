json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :text, :image_url, :colour, :price
  json.url product_url(product, format: :json)
end
