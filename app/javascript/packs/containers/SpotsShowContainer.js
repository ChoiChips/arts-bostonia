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
    fetch('/api/v1/reviews', {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(submission),
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
    })
    .then(response => {
      // debugger;
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
        spot: spot,
        reviews: spot.reviews,
        user_reviews: spot.user_reviews
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
            user={this.state.user_reviews}
            spot={this.state.user_reviews}
          />
        </div>
      </div>
    )
  }
}

export default SpotsShowContainer;
