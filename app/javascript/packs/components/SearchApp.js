import React from 'react';
import { Link } from 'react-router';
import SearchForm from './SearchForm';

class SearchApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchText: ''
    }
    this.handleSearch = this.handleSearch.bind(this)
  }

  handleSearch(input) {
    this.setState({ searchText: input })
    this.props.updateSearchResults(input)
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
