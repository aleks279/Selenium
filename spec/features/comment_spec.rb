require 'rails_helper'

describe "comment", :type => :feature do

  let(:article) { FactoryGirl.create(:article) }

  it "successfully creates a new comment" do
    visit "/articles/#{article.id}"

    within('#new_comment') do
      fill_in 'comment_author', :with => 'This is a comment'
      fill_in 'comment_body', :with => 'This is the author'
    end

    click_button 'Create Comment'
    expect(page).to have_content 'This is the author'
  end

  it "fails to create a comment" do
    visit "/articles/#{article.id}"

    within('#new_comment') do
      fill_in 'comment_author', :with => 'This is a comment'
      fill_in 'comment_body', :with => ''
    end

    click_button 'Create Comment'
    expect(page).to_not have_content 'This is the comment'
  end
end