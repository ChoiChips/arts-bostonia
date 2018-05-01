import React, { Component } from 'react';
import SpotTile from '../components/SpotTile';
import SearchApp from '../components/SearchApp'

class SpotsIndexContainer extends Component {
  constructor(props){
    super(props)
      this.state = {
        spots: [],
        searchText: '',
        searchResults: []
      }
    this.updateSearchResults = this.updateSearchResults.bind(this)
  }

  componentDidMount(){
    fetch('/api/v1/spots.json')
      .then(response => {
        if (response.ok) {;
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ spots: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  updateSearchResults(searchText, searchResults) {
    this.setState({
      searchText: searchText,
      searchResults: searchResults
    })
  }

  render() {

    let displayedSpots;
    let noResultsMessage;

    if (this.state.searchText === '') {
      displayedSpots = this.state.spots.map( (spot) =>{
        return (
          <SpotTile
            key={spot.id}
            id={spot.id}
            name={spot.name}
            location={spot.location}
            description={spot.description}
            photo={spot.photo}
            artist={spot.artist}
          />
        )
      })
    } else {
      displayedSpots = this.state.searchResults.map( (spot) =>{
        return (
          <SpotTile
            key={spot.id}
            id={spot.id}
            name={spot.name}
            location={spot.location}
            description={spot.description}
            photo={spot.photo}
            artist={spot.artist}
          />
        )
      })

      if (displayedSpots === []) {
        noResultsMessage = "No results found!"
      }
    }

    return (
      <div>
        <div>
          <SearchApp
            updateSearchResults={this.updateSearchResults}
          />
        </div>
        <div className="row spot-container">
          {displayedSpots}
          <h3>{noResultsMessage}</h3>
        </div>
      </div>
    );
  }
}

export default SpotsIndexContainer;
