import React, { Component } from 'react';
import { Link } from 'react-router';

class SpotsShowContainer extends Component {
  constructor(props){
    super(props)
    this.state = { spots: [] }
  }
  render() {
    return (
      <div>spots show container</div>
    );
  }
}

export default SpotsShowContainer;