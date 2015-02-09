require 'rails_helper'

describe CommentsController do

  let(:comment) { FactoryGirl.create(:comment, :with_article) }
  let(:article) { comment.article }

  describe "DELETE #destroy" do
    it "deletes the correct comment" do
      delete :destroy, article_id: article.id, id: comment.id
      expect(response).to redirect_to article_path(article)
    end
  end

  describe "POST #create" do

    let(:comment_params) { FactoryGirl.attributes_for(:comment) }

    context "when save is valid" do
      it "saves the new comment" do
        expect {
          post :create, article_id: article.id, comment: comment_params
        }.to change(Article.all, :count).by(1)
      end

      it "redirects to the article show page" do
        post :create, article_id: article.id, comment: comment_params
        expect(response).to redirect_to(article_path(article))
      end
    end

    context "when save is invalid" do

      before { allow_any_instance_of(Comment).to receive(:save).and_return(false) }

      it "redirects to the article show page" do
        post :create, article_id: article.id, comment: comment_params
        expect(response).to redirect_to(article_path(article))
      end
    end
  end
end