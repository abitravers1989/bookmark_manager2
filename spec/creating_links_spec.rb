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
