class Api::GeneralController < ::ApiController
  def recent_items
    @seeds = Seed.current.order('updated_at desc').limit(10)
  end
end
