class Api::V1::VotesController < ApiController
  serialization_scope :current_user

  def index
    spot = Spot.find(params[:id])
    reviews = spot.reviews

    render json: reviews.votes
  end

  def create
    if params[:upvote]

    end
  end

  def upvote
    vote = Vote.find(params[:review_id])

    if current_user.votes.where(review_id: params[:review], value: 1).exists?
      vote.update_attributes(value: 0)
    else
      vote.update_attributes(value: 1)
      vote.user = current_user
    end
  end

  def downvote
    vote = Vote.find(params[:review_id])

    if current_user.votes.where(review_id: params[:review], value: -1).exists?
      vote.update_attributes(value: 0)
    else
      vote.update_attributes(value: -1)
      vote.user = current_user
    end
  end
end
