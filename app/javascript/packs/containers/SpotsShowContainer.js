import React, { Component } from 'react';
import SpotShow from "../components/SpotShow"
import ReviewsShowContainer from "./ReviewsShowContainer"
import ReviewFormContainer from "./ReviewFormContainer"

class SpotsShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      spot:  {},
      reviews: []
    }
    this.addNewReview = this.addNewReview.bind(this)
  }

  addNewReview(submission) {
    let spotId = this.props.id

    event.preventDefault();
    fetch('/api/v1/spots/${spotId}',
      { method: 'POST', body: JSON.stringify(submission) })
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
    .then(review => {
      // debugger;
      let allReview = this.state.reviews
      this.setState({
        reviews: allReviews.concat(review)
      })
    })
    .catch(error => console.error(`Error in fetch (submitting new review): ${error.message}`))
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
      this.setState ({
        spot: spot.spot,
        reviews: spot.reviews
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  render() {
    return(
      <div className="spot-container">
        <div className="row">
          <div>
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
          <div>
            <h1 className="show column large-6 medium-12 small-12">Dummy area for Google Maps</h1>
          </div>
        </div>
        <div>
          <ReviewsShowContainer
            key={this.state.spot.id}
            id={this.state.spot.id}
            reviews={this.state.reviews}
          />
        </div>
        <div>
          <ReviewFormContainer
            addNewReview={this.addNewReview}
            user={this.state.reviews.user_id}
          />
        </div>
      </div>
    )
  }
}

export default SpotsShowContainer;
