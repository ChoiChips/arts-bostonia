import React from 'react';
import { Link } from 'react-router';
import SearchForm from './SearchForm';

class SearchApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchText: '',
      searchResults: []
    }
    this.handleSearch = this.handleSearch.bind(this)
  }

  handleSearch(input) {
    this.setState({ searchText: input })
    this.props.updateSearchResults(this.state.searchText, this.state.searchResults)

    fetch('/api/v1/spots.json')
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
    .then(spots => {
      let tempResults = []
      // debugger;
      spots.forEach((spot) => {
        if (spot.name.toLowerCase().includes(input.toLowerCase())) {
          tempResults.push(spot)
        }
      })
      console.log(tempResults)
      // console.log(this.state)
      this.setState({
        searchResults: tempResults
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
    this.props.updateSearchResults(this.state.searchText, this.state.searchResults)

  }

  render() {
    return(
    <div>
      <div className="searchapp">
        <SearchForm
          value={this.state.searchText}
          handleSearch={this.handleSearch}
        />
      </div>
    </div>
  )}
}

export default SearchApp;
