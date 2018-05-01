import React from 'react'
import ReactDOM from 'react-dom'
import Routes from './routes.js'

document.addEventListener('DOMContentLoaded', () => {
  let reactElement = document.getElementById('app')

  if (reactElement) {
    ReactDOM.render(
      <Routes/>,
      reactElement
    )
  }
})
