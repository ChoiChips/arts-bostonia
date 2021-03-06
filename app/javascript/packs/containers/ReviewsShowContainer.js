import React, { Component } from 'react';
import ReviewTile from "../components/ReviewTile"

const ReviewsShowContainer = (props) => {

  let reviews;
  if (props.reviews) {
    reviews = props.reviews.map(review => {
      return(
        <div>
          <ReviewTile
            key={review.id}
            id={review.id}
            rating={review.rating}
            description={review.description}
            user={review.user_id}
          />
        </div>
      )
    })
  } else {
    reviews = "No Reviews Yet"
  }

  return(
    <div>
      <h2 className="reviews-header reviews-container-line-break">Reviews</h2>
      <div>
        {reviews}
      </div>
    </div>
  )
}

export default ReviewsShowContainer;
