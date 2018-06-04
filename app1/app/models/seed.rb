class Seed < ApplicationRecord
  before_create :init_data

  scope :available, -> { where(consumed: false, app_id: 1) }
  scope :current, -> { where(app_id: 1) }

  private
  def init_data
    self.label = "1-#{rand}"
    self.app_id = 1
  end
end
