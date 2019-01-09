
class HourSerializer

  include FastJsonapi::ObjectSerializer

  attributes :id, :time, :icon, :temperature

  # attribute :hour { |h|
  #   h.json
  # }

end
