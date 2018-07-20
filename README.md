# Arts Bostonia

[![Build Status](https://codeship.com/projects/6ede8290-2947-0136-930a-0efe8925988d/status?branch=master)
[![Code Climate](https://codeclimate.com/github/ChoiChips/arts-bostonia/badges/gpa.svg)](https://codeclimate.com/github/ChoiChips/arts-bostonia)
[![Coverage Status](https://coveralls.io/repos/github/ChoiChips/arts-bostonia/badge.svg?branch=master)](https://coveralls.io/github/ChoiChips/arts-bostonia?branch=master)

## Description:

Thank you for using Arts Bostonia! Developed in 2018 as a skills demonstration platform we hope to enable users to discover interesting and obscure pieces of public art, graffiti, sculptures, and other obscura around the greater Boston area.  Our site was built with Rails backend, React frontend, Foundation styling, and a focus on TDD with RSpec and Jasmine.

## Setup:

To set up on local machine:
1. Clone repo
2. Run ```bundle exec install``` then ```npm install```
3. Run ```rake db:create``` then ```rake db:migrate``` then ```rake db:seed```
4. Run ```rails s``` in one tab and ```npm start``` in another tab
5. Visit ```localhost:3000```

For testing:
1. Run ```rake db:test:prepare``` then ```rspec```

Official Site:  
[ArtsBostonia](https://artsbostonia.herokuapp.com)

## Built With:

* [React](https://reactjs.org/) - Frontend
* [Ruby on Rails](http://rubyonrails.org/) - Backend
* [Bundler](bundler.io/) - Ruby Gem Management
* [NPM](https://www.npmjs.com/) - JS Dependency Management
* [Heroku](https://www.heroku.com/) - Server Host
* [PostgreSQL](https://www.postgresql.org/) - Database

## Collaborators:

* **Christian C.**
(https://github.com/ChoiChips)
* **Evan H.**
(https://github.com/SimplexDev)
* **Greg G.**
(https://github.com/garabedium)
* **Daniel D.**
(https://github.com/danielmdavis)

## Acknowledgments:

Thank you to all our mentors, instructors, and teammates at Launch Academy!
* [Launch Academy](https://www.launchacademy.com)
