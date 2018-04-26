import React, { Component } from 'react';
import ReviewTile from "../components/ReviewTile"

const ReviewsShowContainer = (props) => {

  let reviews;
  if (props.reviews) {
    reviews = props.reviews.map(review => {
      return(
        <ReviewTile
          key={review.id}
          id={review.id}
          rating={review.rating}
          description={review.description}
          user={review.user_id}
        />
      )
    })
  } else {
    reviews = "No Reviews Yet"
  }

  return(
    <div>
      <h1>Reviews!</h1>
      <div>
        {reviews}
      </div>
    </div>
  )
}

export default ReviewsShowContainer;
