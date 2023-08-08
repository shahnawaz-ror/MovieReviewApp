class RaterController < ApplicationController
  def create
    if user_signed_in?
      rate_object = find_and_rate(params[:klass], params[:id], params[:score], current_user, params[:dimension])
      render json: rate_object.present?
    else
      render json: false
    end
  end

  private

  def find_and_rate(klass, id, score, user, dimension)
    obj = klass.classify.constantize.find(id)
    obj.rate(score.to_f, user, dimension)
  end
end
