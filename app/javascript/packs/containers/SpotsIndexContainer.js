import React, { Component } from 'react';
import SpotTile from '../components/SpotTile';
import SearchApp from '../components/SearchApp'

class SpotsIndexContainer extends Component {
  constructor(props){
    super(props)
      this.state = {
        spots: [],
        searchText: '',
        searchResults: [],
        count: 9
      }
    this.updateSearchResults = this.updateSearchResults.bind(this)
    this.showMoreResults = this.showMoreResults.bind(this)
    this.createSpotTile = this.createSpotTile.bind(this)
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

  createSpotTile(array) {

    let displayedSpotsArray = array.map( (spot) =>{
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
    return displayedSpotsArray
  }

  showMoreResults(event) {
    event.preventDefault()

    let newCount = this.state.count + 9
    this.setState({
      count: newCount
    })
  }

  updateSearchResults(searchText) {
    let tempResults = []
    this.state.spots.forEach((spot) => {
      if (spot.name.toLowerCase().includes(searchText.toLowerCase())) {
        tempResults.push(spot)
      }
    })

    let tempCount = this.state.count
    if (searchText.length === 1) {
      tempCount = 9
    }
    this.setState({
      searchText: searchText,
      searchResults: tempResults,
      count: tempCount
    })
  }

  render() {

    let displayedSpots;

    if (this.state.searchText === '') {
      displayedSpots = this.createSpotTile(this.state.spots).slice(0, this.state.count)
    } else {
      displayedSpots = this.createSpotTile(this.state.searchResults).slice(0, this.state.count)
    }

    let showMoreButton;
    if (this.state.spots != []) {
      if (displayedSpots.length === this.state.spots.length || displayedSpots.length === this.state.searchResults.length) {
        showMoreButton = <div></div>
      } else {
        showMoreButton = <button id="show-more-button" className="button" onClick={this.showMoreResults}>Show More</button>
      }
    }

    return (
      <div>
        <div>
          <SearchApp
            updateSearchResults={this.updateSearchResults}
          />
        </div>
        <div className="row text-center">
          <div className="column">
            <h1 className="site-mission">Find and Review Boston's Public Art Spots</h1>
            <div className="home-static-map">
              <a href="/map" className="map-link">
                <img src="https://arts-bostonia.s3.amazonaws.com/arts-bostonia-production/map-artsbostonia.png" className="map-image" alt="ArtsBostonia spots map"/>
              </a>
            </div>
          </div>
        </div>
        <div className="row spot-container">
          {displayedSpots}
        </div>
        <div className="text-center">
          {showMoreButton}
        </div>
      </div>
    );
  }
}

export default SpotsIndexContainer;

// <img src="https://arts-bostonia.s3.amazonaws.com/arts-bostonia-production/map-artsbostonia.png" className="home-static-map" />

