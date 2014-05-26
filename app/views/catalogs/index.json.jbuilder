json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :name, :locality, :addr, :phone, :email, :siteurl, :description, :biztype
  json.url catalog_url(catalog, format: :json)
end
