class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    if can_follow?(user)
      relation = user.followed_relations.new(followed_id: current_user.id)
      relation.save
    end
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    if can_follow?(user)
      relation = user.followed_relations.find_by(followed_id: current_user.id)
      relation.destroy
    end
    redirect_to request.referer
  end

  private

  def can_follow?(user)
    !(user == current_user)
  end
end
