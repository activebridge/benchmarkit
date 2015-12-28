class CommentsController < ApplicationController
  before_action :current_user
  before_action :current_battle
  def create

  end

  private

  def current_battle
    @battle = Battle.find(params[:id])
  end
end
