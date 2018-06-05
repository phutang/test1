class Api::GeneralController < ::ApiController
  def recent_items
    @seeds = Seed.current.order('updated_at desc').limit(10)
    if @seeds.count < 10
      @seeds += Seed.using(:app2).order('updated_at desc').limit(10 - @seeds.count)
    end
  end
end
