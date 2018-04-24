import React, { Component } from 'react';
import {Router, browserHistory, Route, IndexRoute } from 'react-router';
import SpotsIndexContainer from './containers/SpotsIndexContainer';
import SpotsShowContainer from './containers/SpotsShowContainer';

class Routes extends Component {

  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    return (
      <Router history={browserHistory}>
        <Route path='/' component={SpotsIndexContainer} />
        <Route path="spots/:id" component={SpotsShowContainer} />
      </Router>
    );
  }
}

export default Routes;
