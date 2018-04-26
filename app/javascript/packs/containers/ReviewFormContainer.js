import React, { Component } from 'react';
import RatingSelect from "../components/RatingSelect"
import DescriptionText from "../components/DescriptionText"

class ReviewFormContainer extendes Component {
  constructor(props) {
    super(props)
    this.state = {
      rating: '',
      description: '',
      errors: {}
    }
    this.handleRatingChange = this.handleRatingChange.bind(this)
    this.handleDescriptionChange = this.handleDescriptionChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
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

  handleSubmit(event) {
    event.preventDefault()

    let ratingValidation = this.validateRating(this.state.rating)
    let descriptionValidation = this.validateDescription(this.state.description)

    if (ratingValidation && descriptionValidation) {
      let formPayload = {
        ratingSelected: this.state.rating,
        description: this.state.description
      }
    }
    this.props.addNewReview(formPayload)
    this.handleClearForm(event)
  }

  handleChange(event) {
    this.validateRating(event.target.value)
    this.setState({ [event.target.name]: event.target. })
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
      <form className="callout" onSubmit={this.handleFormSubmit}>
        Add a new review!
        {errorDiv}
        <RatingSelect
          handlerFunction={this.handleRatingChange}
          name='rating'
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
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    );
  }
}

export default ReviewFormContainer;
