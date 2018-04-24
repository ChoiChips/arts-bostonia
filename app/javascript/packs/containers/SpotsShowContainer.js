import React, { Component } from 'react';
import { Link } from 'react-router';

class SpotsShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      spot:  {}
    }
  }

  componentDidMount() {
    let spotId = this.props.params.id
    fetch(`/api/v1/spots/${spotId}`, {
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
    .then(response => response.json())
    .then(spot => {
      this.setState ({ spot: spot})
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
    })
  }

  render() {
    return(
      <SpotShow
        id={this.state.spot.id}
        name={this.state.spot.name}
        artist={this.state.spot.artist}
        rating={this.state.spot.rating}
        location={this.state.spot.location}
        access={this.state.spot.access}
        aesthetic={this.state.spot.aesthetic}
      />
    )
  }
}

export default SpotsShowContainer;
