feature 'submitting new links' do

  scenario 'I can use a form to submit a new link' do
     visit '/links/new'
    #  within link_adding_from do
       fill_in "title", :with => "mats of Meat"
       fill_in "url", :with => "www.hatsofmeat.com"
     click_button "Submit"

     #expect to be redirected back to links page
     expect(current_path).to eq '/links'

     within 'ul#links' do
       expect(page).to have_content("mats of Meat")
     end
  end
end

feature 'Adding tags' do
   scenario 'I can add a tag to a new link' do
     visit '/links/new'

     fill_in "title", :with => "mats of Meat"
     fill_in "url", :with => "www.hatsofmeat.com"
     fill_in "tag", :with => "lovers of meat"

     click_button "Submit"
     link = Link.first
    expect(link.tags.map(&:name)).to include("lovers of meat")
  end
end

feature 'Submit button for new link' do
  scenario 'User can go through to the submit new links page' do
    visit '/links'
    click_button "Add new link"
    expect(current_path).to eq '/links/new'
  end 
end
