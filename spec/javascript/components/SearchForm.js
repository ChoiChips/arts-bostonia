import SearchForm from '../../../app/javascript/packs/components/SearchForm'

describe('SearchForm', () => {
  let onChange,
      wrapper;

  beforeEach(() => {
    onChange = jasmine.createSpy('onChange spy');
    wrapper = mount(
      <SearchForm
        onChange={onChange}
        placeholder="Search"
      />
    );
  });

  it('should render an input tag', () => {
    expect(wrapper.find('input')).toBePresent();
  });
});
