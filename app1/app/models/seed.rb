class Seed < ApplicationRecord
  before_create :init_data

  scope :ready, -> { where(consumed: false) }
  scope :available, -> { where(consumed: false, app_id: 1) }
  scope :current, -> { where(app_id: 1) }

  def app_id=(aid)
    write_attribute(:app_id, aid)
  end

  private
  def init_data
    self.label = "1-#{rand}"
    self.app_id = 1
  end
end
