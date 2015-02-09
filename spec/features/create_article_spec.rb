require "rails_helper"

describe "create article process", :type => :feature do
  it "creates a new article" do
    visit '/articles/new'
    within('#new_article') do
      fill_in 'article_title', :with => 'This is an article'
      fill_in 'article_text', :with => 'This is the articles body'
    end

    click_button 'Create Article'
    expect(page).to have_content 'Articles'
  end

  context "when successful" do
    it "goes to the articles index" do

    end
  end

  context "when fails" do
    it "refresh the new page" do

    end
  end
end