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
    this.getResults = this.getResults.bind(this)
  }


  handleSearch(e) {
    this.setState({searchText: e});
  }

  getResults() {
    calltodb(searchText).then(e => {
      this.setState({searchResults: e.value})
    });
  }

  render() {
    console.log(this.state.searchText)
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
