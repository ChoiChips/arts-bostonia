import React, { Component } from 'react';
import {Router, browserHistory, Route, IndexRoute } from 'react-router';
import SpotsIndexContainer from './containers/SpotsIndexContainer';
import SpotsShowContainer from './containers/SpotsShowContainer';
import SearchApp from './components/SearchApp'

class Routes extends Component {

  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    return (
      <Router history={browserHistory}>
        <Route path='/'>
          <IndexRoute component={SpotsIndexContainer} />
          <Route path="spots/:id" component={SpotsShowContainer}/>
        </Route>
      </Router>
    );
  }
}

export default Routes;
