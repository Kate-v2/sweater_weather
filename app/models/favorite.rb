
class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :location
  delegate :city, :state_short, :coordinates, to: :location, allow_nil: true

  validates_uniqueness_of :location, scope: [:user]

  # TO DO - Test me
  def joint_location
    # "#{location.city},#{location.state_short}"
    "#{city},#{state_short}"
  end

end
