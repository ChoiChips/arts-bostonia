import React from 'react';

const SpotShow = (props) => {

  let url;
  if (props.photo !== undefined) {
    url = props.photo.url || "http://via.placeholder.com/350x150"
  }

  let artist;

  if (props.artist === "" || props.artist === null || props.artist === undefined){
    artist = "Uncredited"
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
          <h4>Discovered by</h4>
          <p>Spotter {props.userId}</p>
          <a href={`https://www.google.com/maps/dir//${props.location}/`} target="_blank">
            <img width="400" src={`https://maps.googleapis.com/maps/api/staticmap?center=${props.location}&zoom=16+&size=400x200&scale=1&maptype=roadmap&format=png&visual_refresh=true&markers=size:mid%7color:blue%7Clabel:S%7C11211%7C11206%7C11222&key=AIzaSyASya2rxJ2koyx9Btw--HV9_qLA2zYS9G8`} alt="Directions"/>
          </a>
          <p>{props.location} - <a href={`https://www.google.com/maps/dir//${props.location}/`} target="_blank">Directions</a></p>
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
