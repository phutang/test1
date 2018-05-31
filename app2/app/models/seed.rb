class Seed < ApplicationRecord
  before_create :rand_label

  scope :available, -> { where(consumed: false) }

  private
  def rand_label
    self.label = "2-#{rand}"
  end
end
