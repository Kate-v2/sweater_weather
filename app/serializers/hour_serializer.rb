
class HourSerializer

  include FastJsonapi::ObjectSerializer

  attributes :id, :time, :icon, :temperature

end
