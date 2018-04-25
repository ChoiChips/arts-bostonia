import React, { Component } from 'react';
import { Link } from 'react-router';

const SpotTile = (props) => {
  //render() { }

  let photo = props.photo || ''
  let name = props.name.toUpperCase()

  return (
    <Link to={`/spots/${props.id}`}>
      <div className="tile column small-12 medium-6 large-4 end spot-tile">
        <div className="title"> {name} </div>
        <img className="photo" src={`${photo}`}/>
        <div>{props.description}</div>
        <div>{props.location}</div>
        <div>{props.artist}</div>
      </div>
    </Link>
  );
}
//}

export default SpotTile;

// columns small-12 medium-6 large-4
