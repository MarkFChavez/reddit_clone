require 'test_helper'

feature 'Signing up' do
  it 'is disable for the moment' do
    visit root_path

    page.wont_have_css 'a', text: 'Sign up'
  end
end
