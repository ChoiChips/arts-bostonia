import React from 'react';
import ReviewTile from "../components/ReviewTile"
import ReviewFormContainer from "./ReviewFormContainer"

class ReviewsShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      reviews: {}
    }

    this.addNewReview = this.addNewReview.bind(this)
  }

  addNewReview(submission) {
    let spotId = this.props.id

    event.preventDefault();
  //   fetch('/api/v1/spots/${spotId}/reviews',
  //     { method: 'POST', body: JSON.stringify(submission) })
  //   .then(response => {
  //     if (response.ok) {
  //       return response;
  //     } else {
  //       let errorMessage = `${response.status} (${response.statusText})`,
  //           error = new Error(errorMessage);
  //       throw(error);
  //     }
  //   })
  //   .then(response => response.json())
  //   .then(review => {
  //     // debugger;
  //     let allReview = this.state.reviews
  //     this.setState({
  //       reviews: allReviews.concat(review)
  //     })
  //   })
  //   .catch(error => console.error(`Error in fetch (submitting new review): ${error.message}`))
  // }

  componentDidMount() {
    //   let spotId = this.props.params.id
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
  }

  render() {
    let reviews = this.state.reviews.map(review => {
      return(
        <ReviewTile
          key={this.state.review.id}
          id={this.state.review.id}
          rating={this.state.review.rating}
          description={this.state.review.description}
          user={this.state.review.user}
        />
      )
    })

    return(
      <div>
        <h1>Reviews!</h1>
        <div className="row">
          {reviews}
          <ReviewFormContainer
            addNewReview={this.addNewReview}
            user={this.state.reviews.user.username}
          />
        </div>
      </div>
    )
  }
}

export default ReviewsShowContainer;
