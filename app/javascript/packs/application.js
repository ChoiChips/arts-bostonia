import React from 'react'
import ReactDOM from 'react-dom'
import Routes from './routes.js'

document.addEventListener('DOMContentLoaded', () => {
  let reactElement = document.getElementById('app')

  if (reactElement) {
    ReactDOM.render(
      // <h1>Boo yaa</h1>,
      <Routes/>,
      reactElement
    )
  }
})
