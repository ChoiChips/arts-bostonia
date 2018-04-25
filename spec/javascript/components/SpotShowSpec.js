import SpotShow from '../../../app/javascript/packs/components/SpotShow'

describe('<SpotShow />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <SpotShow
        name="George Washington Statue"
        description="G dubs yo"
        location="Da park"
        artist="Unknown"
        rating=5
        access="ez pz"
        aesthetic="hot"
      />
    )
  })

  it('renders a h2 tag with the spot name', () => {
    expect(wrapper.find('h2')).toBePresent()
    expect(wrapper.find('h2').text()).toEqual('George Washington Statue')
  })

  it('renders p tags with the spot description, location, artist, rating, access, and aesthetic', () => {
    expect(wrapper.text())
  })

})
