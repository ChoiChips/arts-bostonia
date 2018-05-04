import React, { Component } from 'react';

const ReviewTile = (props) => {

  return (
    <div className="column small-12 medium-12 large-12 end">
      <div className="review-spotter"><strong>Spotter {props.user}'s rating:</strong> {props.rating}/5 stars</div>
      <blockquote>{props.description}</blockquote>
    </div>
  )
}

export default ReviewTile;
