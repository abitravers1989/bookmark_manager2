feature 'Display websites' do

  scenario 'View list of homepage links' do
    Link.create(url: 'http://www.hatsofmeat.com', title: 'Meat Hats')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Meat Hats')
    end
  end
end
