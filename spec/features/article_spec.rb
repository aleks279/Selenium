require "rails_helper"

describe "article", :type => :feature do
  it "successfully creates a new article" do
    visit '/articles/new'
    within('#new_article') do
      fill_in 'article_title', :with => 'This is an article'
      fill_in 'article_text', :with => 'This is the articles body'
    end

    click_button 'Create Article'

    expect(current_path).to eq(articles_path)
    expect(page).to have_content 'This is an article'
  end

  it "fails to create an article" do
    visit '/articles/new'
    within('#new_article') do
      fill_in 'article_title', :with => ''
      fill_in 'article_text', :with => 'This is the articles body'
    end

    click_button 'Create Article'

    expect(page).to have_content "review the problems below"
  end

  context "edit existing article" do
    let(:article) { FactoryGirl.create(:article) }

    it "successfully updates an existing article" do
      visit "articles/#{article.id}/edit"

      within("#edit_article_#{article.id}") do
        fill_in 'article_title', :with => 'New title'
        fill_in 'article_text', :with => 'New body'
      end

      click_button 'Update Article'

      expect(current_path).to eq(article_path(article.id))
      expect(page).to have_content 'New body'
    end

    it "fails to update an existing article" do
      visit "articles/#{article.id}/edit"

      within("#edit_article_#{article.id}") do
        fill_in 'article_title', :with => ''
        fill_in 'article_text', :with => 'New body'
      end

      click_button 'Update Article'
      expect(page).to have_content 'review the problems below'
    end
  end
end