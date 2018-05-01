import React, { Component } from 'react';
import SpotTile from '../components/SpotTile';

class UsersActivityContainer extends Component {
  constructor(props){
    super(props)
    this.state = { spots: [] }
  }

  componentDidMount(){
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
      .then(body => {
        this.setState({ spots: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {

    let spots = this.state.spots.map( (spot) =>{
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

    return (
      <div className="row spot-container">
        we are here
      </div>
    );
  }
}

export default UsersActivityContainer;
