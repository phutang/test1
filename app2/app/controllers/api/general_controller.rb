class Api::GeneralController < ::ApiController
  def recent_items
    @seeds = Seed.order('updated_at desc').limit(10)
  end
end
