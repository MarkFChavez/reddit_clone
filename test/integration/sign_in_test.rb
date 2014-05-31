require 'test_helper'

feature 'Signing in' do
  let(:mark) { users(:mark) }

  describe 'as a valid user' do
    it 'signs in using email and password' do
      sign_in mark.email, 'foobar123'

      page.must_have_content mark.email
      page.must_have_content 'Signed in successfully'
    end
  end

  describe 'as an invalid user' do
    it 'returns an alert message' do
      sign_in mark.email, 'foobar456'

      page.must_have_content 'Invalid email or password'
      page.wont_have_content 'Signed in successfully'
    end
  end
end
