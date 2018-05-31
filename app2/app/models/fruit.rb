class Fruit < ApplicationRecord
  before_create :rand_name

  belongs_to :seed

  private
  def rand_name
    self.name = "f-#{rand}"
  end
end
