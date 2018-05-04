import React, { Component } from 'react';
import RatingSelect from "../components/RatingSelect"
import DescriptionText from "../components/DescriptionText"

class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      ratingOptions: ['1 star', '2 stars', '3 stars', '4 stars', '5 stars'],
      ratingSelected: '',
      description: '',
      errors: {}
    }
    this.handleRatingChange = this.handleRatingChange.bind(this)
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this)
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.handleClearForm = this.handleClearForm.bind(this)
    this.validateRatingSelection = this.validateRatingSelection.bind(this)
    this.validateDescription = this.validateDescription.bind(this)
  }

  handleClearForm(event) {
    event.preventDefault()
    this.setState({
      ratingOptions: ['1 star', '2 stars', '3 stars', '4 stars', '5 stars'],
      ratingSelected: '',
      description: '',
      errors: {}
    })
  }

  handleFormSubmit(event) {
    event.preventDefault()

    let ratingValidation = this.validateRatingSelection(this.state.ratingSelected)
    let descriptionValidation = this.validateDescription(this.state.description)

    if (ratingValidation && descriptionValidation) {
      let formPayload = {
        rating: this.state.ratingSelected,
        description: this.state.description,
        spot_id: this.props.spot
      }
    this.props.addNewReview(formPayload)
    this.handleClearForm(event)
    }
  }

  handleRatingChange(event) {
    this.validateRatingSelection(event.target.value)
    this.setState({ [event.target.name]: event.target.value })
  }

  handleDescriptionChange(event) {
    this.validateDescription(event.target.value)
    this.setState({ [event.target.name]: event.target.value })
  }

  validateRatingSelection(selection) {
    if (selection.trim() === '') {
      let newError = { ratingSelected: 'You must select a rating.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.ratingSelected
      this.setState({ errors: errorState })
      return true
    }
  }

  validateDescription(selection) {
    if (selection.trim() === '') {
      let newError = { descriptionStatus: 'You must enter a description.' }
      this.setState({ errors: Object.assign(this.state.errors, newError) })
      return false
    } else {
      let errorState = this.state.errors
      delete errorState.descriptionStatus
      this.setState({ errors: errorState })
      return true
    }
  }

  render() {
    let errorDiv;
    let errorItems;

    if (Object.keys(this.state.errors).length > 0) {
      errorItems = Object.values(this.state.errors).map(error => {
        return(<li key={error}>{error}</li>)
      })
      errorDiv = <div className="callout alert">{errorItems}</div>
    }
    return (
      <div>
        {errorDiv}
        <h4>Add a new review!</h4>
        <div className="row">
          <div className="columns medium-6">
            <form className="callout" onSubmit={this.handleFormSubmit}>
                <RatingSelect
                  handlerFunction={this.handleRatingChange}
                  name='ratingSelected'
                  label='Rating'
                  options={this.state.ratingOptions}
                  selectedOption={this.state.ratingSelected}
                />
                <DescriptionText
                  handlerFunction={this.handleDescriptionChange}
                  name='description'
                  label='Description'
                  content={this.state.description}
                />
                <div className="button-group">
                  <input className="button small" type="submit" value="Submit" />&nbsp;
                  <button className="button clear small" onClick={this.handleClearForm}>Clear</button>
                </div>
              </form>
            </div>
          </div>

      </div>
    );
  }
}

export default ReviewFormContainer;
