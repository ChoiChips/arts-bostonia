import React from 'react';

const SpotShow = (props) => {
  return(
    <div className="show column small-12 medium-12 large-6">
      <h2>{props.name}</h2>
      <p>{props.description}</p>
      <p>{props.location}</p>
      <p>{props.artist}</p>
      <div><img src={props.photo}/></div>
    </div>
  )
}


export default SpotShow;
