AddressToCoords::Application.routes.draw do
  get("/coords", { :controller => "addresses", :action => "fetch_coordinates" })
  get("/convert", {:controller => "addresses", :action => "convert_complete"})
  get("/new_address", { :controller => "addresses", :action => "address_form"})
end
