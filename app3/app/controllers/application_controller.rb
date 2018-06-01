class ApplicationController < ActionController::Base

  rescue_from RuntimeError, with: :render_err

  def render_err
    render 'home/error'
  end

end
