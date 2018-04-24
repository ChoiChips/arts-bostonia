import React, { Component } from 'react';
import { Link } from 'react-router';

const SpotTile = (props) => {
  //render() {
  return (
    <div className="column small-12 medium-6 large-4 spot-tile">
      <Link to={`/spots/${props.id}`}> {props.name} </Link>
    </div>
  );
}
//}

export default SpotTile;

// columns small-12 medium-6 large-4