import React, { Component } from 'react';
import { Link } from 'react-router';

const SpotTile = (props) => {

  let photo = props.photo.url || ''
  let name = props.name.toUpperCase()

  return (
    <div className="columns small-12 medium-6 large-4 end">
      <Link className="spot-tile" to={`/spots/${props.id}`}>
          <div className="title"> {name} </div>
          <img className="photo" src={`${photo}`}/>
          <div>{props.description}</div>
          <div>{props.location}</div>
          <div>{props.artist}</div>
      </Link>
    </div>
  );
}


export default SpotTile;
