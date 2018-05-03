import React from 'react';

const SpotShow = (props) => {

  let url;

  if (props.photo !== undefined) {
    url = props.photo.url || "http://via.placeholder.com/350x150"
  }

  return(
    <div className="show column small-12 medium-12 large-6">
      <h2>{props.name}</h2>
      <p>{props.description}</p>
      <p>{props.location}</p>
      <p>{props.artist}</p>
      <img src={url} />
    </div>
  )
}


export default SpotShow;
