
class LocationSerializer

  include FastJsonapi::ObjectSerializer

  attributes  :id,
              :city,
              :state,
              :country

end
