
class CurrentlySerializer

  include FastJsonapi::ObjectSerializer

  attributes :id, :time, :icon, :temperature, :feels_like

end
