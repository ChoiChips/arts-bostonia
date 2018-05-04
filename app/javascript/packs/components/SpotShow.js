import React from 'react';

const SpotShow = (props) => {

  let url;
  if (props.photo !== undefined) {
    url = props.photo.url || "http://via.placeholder.com/350x150"
  }

  let artist;

  if (props.artist === "" || props.artist === null || props.artist === undefined){
    artist = "Unknown"
  } else {
    artist = props.artist
  }

  return(
    <div className="row collapse">
      <div className="columns small-12">
          <h2 className="page-header text-center">
            {props.name}
          </h2>
      </div>
    <div className="row collapse">
        <div className="columns medium-6">
          <h4>Description</h4>
          <p>{props.description}</p>
          <h4>Location</h4>
          <p>{props.location}</p>
          <h4>Spotted by</h4>
          <p>Spotter {props.userId}</p>
          <h4>Artist</h4>
          <p>{artist}</p>
        </div>
        <div className="columns medium-6 text-right small-text-right">
          <img src={url} />
        </div>
      </div>
    </div>
  )
}


export default SpotShow;
