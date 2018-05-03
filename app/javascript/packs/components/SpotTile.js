import React, { Component } from 'react';
import { Link } from 'react-router';

const SpotTile = (props) => {

  let photo = props.photo.url || ''
  let name = props.name.toUpperCase()
  let description = ''
  if (props.description.length > 40) {
    description = `${props.description.substring(0, 40)}...`
  } else {
    description = props.description
  }

  return (
    <div className="columns small-12 medium-6 large-4 end">
      <Link className="spot-tile" to={`/spots/${props.id}`}>
          <div className="title"> {name} </div>
          <img className="photo" src={`${photo}`}/>
          <div>
            Description: {description}
          </div>
          <div>
            Location: {props.location}
          </div>
      </Link>
    </div>
  );
}


export default SpotTile;
