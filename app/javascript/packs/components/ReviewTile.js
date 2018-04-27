import React, { Component } from 'react';

const ReviewTile = (props) => {
  return (
    <div className="column small-12 medium-12 large-12 end spot-tile">
      <div className="title">{props.user}</div>
      <div>{props.rating} stars</div>
      <div>{props.description}</div>
    </div>
  )
}

export default ReviewTile;
