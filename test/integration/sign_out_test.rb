require 'test_helper'

feature 'Signing out' do
  let(:mark) { users(:mark) }

  describe 'as a signed in user' do
    describe 'clicks on sign out' do
      it 'signs out' do
        sign_in mark.email, 'foobar123'

        click_on 'Sign out'

        page.must_have_content 'Signed out successfully'
        page.wont_have_content mark.email
      end
    end
  end
end
