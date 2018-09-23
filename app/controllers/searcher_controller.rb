class SearcherController < ApplicationController
  def index
    if params[:match_target].present? && params[:by_field].present?
      @users = User.where('? LIKE ?', params[:by_field], "%#{params[:by_field]}%" )
    else
      @users = User.all
    end
  end
end
