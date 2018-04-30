import React, { Component } from 'react';
import {Router, browserHistory, Route, IndexRoute } from 'react-router';
import SpotsIndexContainer from './containers/SpotsIndexContainer';
import SpotsShowContainer from './containers/SpotsShowContainer';
import NavBar from './components/NavBar';

class Routes extends Component {

  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    return (
      <Router history={browserHistory}>
        <Route path='/' component={NavBar} >
          <IndexRoute component={SpotsIndexContainer} />
          <Route path="spots/:id" component={SpotsShowContainer}/>
        </Route>
      </Router>
    );
  }
}

export default Routes;
