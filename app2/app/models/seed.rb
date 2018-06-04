class Seed < ApplicationRecord
  before_create :init_data

  scope :available, -> { where(consumed: false, app_id: 2) }

  private
  def init_data
    self.label = "2-#{rand}"
    self.app_id = 2
  end
end
