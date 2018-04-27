import React, { Component } from 'react';
import SpotShow from "../components/SpotShow"
// import { Link } from 'react-router';

class SpotsShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      spot:  {},
      reviews: {}
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
      this.setState ({ spot: spot.spot})
      console.log(this.state.spot.photo)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  //   fetch(`/api/v1/spots/${spotId}/reviews`, {
  //     credentials: 'same-origin'
  //   })
  //   .then(response => {
  //     if (response.ok) {
  //       return response;
  //     } else {
  //       let errorMessage = `${response.status} (${response.statusText})`,
  //         error = new Error(errorMessage);
  //         throw(error);
  //       }
  //     })
  //   .then(response => response.json())
  //   .then(reviews => {
  //     this.setState ({ reviews: reviews})
  //   })
  //   .catch(error => console.error(`Error in fetch: ${error.message}`))
  // }

  render() {
    return(
      <div className="row spot-container">
        <SpotShow
          key={this.state.spot.id}
          id={this.state.spot.id}
          name={this.state.spot.name}
          artist={this.state.spot.artist}
          description={this.state.spot.description}
          location={this.state.spot.location}
          photo={this.state.spot.photo}
        />
      </div>
    )
  }
}

export default SpotsShowContainer;
