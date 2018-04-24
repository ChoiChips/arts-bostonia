import React from 'react';

const SpotShow = (props) => {
  return(
    <div className="spot-show">
      <h2>{props.name}</h2>
      <p>{props.description}</p>
      <p>{props.location}</p>
      <p>{props.artist}</p>
      <p>{props.rating}</p>
      <p>{props.access}</p>
      <p>{props.aesthetic}</p>
    </div>
  )
}
