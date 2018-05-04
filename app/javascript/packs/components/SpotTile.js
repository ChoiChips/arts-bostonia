import React, { Component } from 'react';
import { Link } from 'react-router';

const SpotTile = (props) => {

  let photo = props.photo.url || ''
  let name = props.name.toUpperCase()
  let description = ''
  if (props.description.length > 100) {
    description = `${props.description.substring(0, 100)}...`
  } else {
    description = props.description
  }

  return (
    <div className="columns small-12 medium-6 large-4 end">
      <Link className="spot-tile" to={`/spots/${props.id}`}>
         <div className="photo" style={{ backgroundImage: `url(${photo})` }}></div>

          <div className="content">
           <h4 className="name"> {name}</h4>
          <p className="description">
            {description}
          </p>
        </div>
      </Link>
    </div>
  );
}


export default SpotTile;
