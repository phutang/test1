class Seed < ApplicationRecord
  before_create :init_data

  scope :ready, -> { where(consumed: false) }
  scope :available, -> { where(consumed: false, app_id: 2) }
  scope :current, -> { where(app_id: 2) }

  def app_id=(aid)
    write_attribute(:app_id, aid)
  end

  private
  def init_data
    self.label = "2-#{rand}"
    self.app_id = 2
  end
end
