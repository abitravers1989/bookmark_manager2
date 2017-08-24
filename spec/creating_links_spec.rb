feature 'submitting new links' do

  scenario 'I can use a form to submit a new link' do
     within link_adding_from do
       fill_in "Title", :with => "Hats of Meat"
       fill_in "Url", :with => "www.hatsofmeat.com"
     click_button "Submit"
     end
  end

end
