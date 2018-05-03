import React, { Component } from 'react';
import SpotShow from "../components/SpotShow"
import ReviewsShowContainer from "./ReviewsShowContainer"
import ReviewFormContainer from "./ReviewFormContainer"

class SpotsShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      spot:  {},
      reviews: [],
      user_reviews: []
    }
    this.addNewReview = this.addNewReview.bind(this)
  }

  addNewReview(submission) {
    event.preventDefault();
    fetch(`/api/v1/spots/${this.state.spot.id}/reviews.json`, {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(submission),
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
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
    .then(review => {
      let allReviews = this.state.reviews
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
        spot: spot,
        reviews: spot.reviews,
        user_reviews: spot.user_reviews
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  render() {
    return(
      <div className="row">
        <div className="columns medium-11 medium-centered">
            <SpotShow
              key={this.state.spot.id}
              id={this.state.spot.id}
              name={this.state.spot.name}
              artist={this.state.spot.artist}
              description={this.state.spot.description}
              location={this.state.spot.location}
              photo={this.state.spot.photo}
            />
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
            spot={this.props.params}
          />
          </div>
        </div>
      </div>
    )
  }
}

export default SpotsShowContainer;
