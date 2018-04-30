import SpotsIndexContainer from '../../../app/javascript/packs/containers/SpotsIndexContainer'
import SpotTile from '../../../app/javascript/packs/components/SpotTile'
import fetchMock from 'fetch-mock'
import { shallow } from 'enzyme'

describe('SpotsIndexContainer', () => {
  let wrapper;

  beforeEach(() => {
    // spyOn(SpotIndexContainer.prototype, 'handleClick').and.callThrough();
    let spots = [
      { name: 'Little Ducklings',location:'Boston Common, Boston MA',description: 'all the ducks', photo: 'https://cdn1.sph.harvard.edu/wp-content/uploads/sites/48/2012/09/make-way-for-ducklings-5.jpg' },
      { name: 'Abe Blinkin',location:'1 Cambridge Sq, Cambridge MA',description: 'abe is the man', photo: 'http://www.talkingstatues.co.uk/stockist_images/chicagoadmin/530x1530_lincoln.jpg' },
      { name: 'Little Ducklings',location:'Boston Common, Boston MA',description: 'all the ducks' },
      { name: 'George Washington',location:'1 Cambridge Sq, Cambridge MA',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', photo: 'https://upload.wikimedia.org/wikipedia/commons/9/92/George_Washington_statue_in_the_Boston_Public_Garden_-_DSC08201.JPG' },
      { name: 'Sam Adams',location:'Boston Common, Boston MA',description: 'great beer' },
      { name: 'Lorem ipsum',location:'1 Cambridge Sq, Cambridge MA',description: 'abe is the man', photo: 'https://cdn-www.enfocus.com/sites/combell-www.enfocus.com/files/media/blog/2017-08-09-Lorem-Ipsum/lorem-ipsum.jpg' },
      { name: 'Christian the Pirate',location:'Deck 7 Common, Boston MA',description: 'fastest eyes' },
      { name: 'Evan the Great',location:'1 Cambridge Sq, Cambridge MA',description: 'lorem ipsum dolum' }
    ]

    fetchMock.get('/api/v1/spots.json', {
      status: 200,
      body: spots
    })
    wrapper = mount(
      <SpotsIndexContainer />
    )
  });

  afterEach(fetchMock.restore)

  // it('should have the specified initial state', () => {
  //   expect(wrapper.state()).toEqual({ spots: [] });
  // })
  // DPickett recommended leaving this test out because it's value null by setting state empty and testing if empty (redundant!)

  it('should render an SpotTile Component', (done) => {
     setTimeout(() => {
       expect(wrapper.find(SpotTile)).toBePresent();
       done()
     }, 0)
   });
})
