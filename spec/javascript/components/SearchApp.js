import SearchForm from '../../../app/javascript/packs/components/SearchForm'
import SearchApp from '../../../app/javascript/packs/components/SearchApp'

describe('SearchApp', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(SearchApp.prototype, 'handleSearch').and.callThrough();
    wrapper = mount(
      <SearchApp />
    )
  });

  it('should render an SearchForm Component', (done) => {
    setTimeout(() => {
      expect(wrapper.find(SearchForm)).toBePresent();
      done()
    }, 0)
  });
})
