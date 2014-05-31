require 'test_helper'

feature 'Adding comments' do
  let(:mark) { users(:mark) }
  let(:reddit) { reddits(:two) }
  let(:post) { posts(:tdd_is_dead) }

  before do
    sign_in mark.email, 'foobar123'
  end

  describe 'on the reddit page' do
    before do
      within "#reddit_#{reddit.id}" do
        click_on post.title
      end
    end

    it 'shows the reddit details' do
      page.must_have_css '.title', text: post.title
      page.must_have_css '.description', text: post.description
    end

    describe 'valid comment' do
      it 'lets you add a comment' do
        within '#new_comment' do
          fill_in 'comment_content', with: 'Awesome'
          click_on 'Create'
        end
        
        within '#comments' do
          page.must_have_content 'Awesome'
          page.must_have_content mark.email 
        end
      end
    end

    describe 'invalid comment' do
      it 'returns an error message' do
        within '#new_comment' do
          fill_in 'comment_content', with: ''
          click_on 'Create'
        end

        page.must_have_content "Comment can't be blank"
      end
    end
  end
end
