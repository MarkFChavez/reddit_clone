require 'test_helper'

feature 'Creating a reddit' do
  let(:mark) { users(:mark) }

  context 'signed in user' do
    before do
      sign_in mark.email, 'foobar123'
    end

    describe 'a link post' do
      describe 'valid post' do
        it 'creates a link post' do
          click_on 'Create new link post'

          fill_in 'Title', with: 'Slow database test fallacy'
          fill_in 'URL', with: 'http://david.heinemeierhansson.com/2014/slow-database-test-fallacy.html'

          click_on 'Create'

          within "#reddits" do
            page.must_have_css 'a', text: 'Slow database test fallacy'
          end
        end
      end

      describe 'invalid post' do
        it 'does not create a link post' do
          click_on 'Create new link post'

          fill_in 'Title', with: ''
          fill_in 'URL', with: ''

          click_on 'Create'

          page.must_have_content "Title can't be blank"
          page.must_have_content "Url can't be blank"
        end
      end
    end

    describe 'a test post' do
      describe 'valid text post' do
        it 'creates a text post' do
          click_on 'Create new text post'

          fill_in 'Title', with: 'TDD is dead'
          fill_in 'Description', with: 'Long live testing'

          click_on 'Create'

          within "#reddits" do
            page.must_have_css 'a', text: 'TDD is dead'
          end
        end
      end

      describe 'invalid text post' do
        it 'does not create a text post' do
          click_on 'Create new text post'

          fill_in 'Title', with: ''
          fill_in 'Description', with: ''

          click_on 'Create'
  
          page.must_have_content "Title can't be blank"
          page.must_have_content "Description can't be blank"
        end
      end
    end
  end
end
