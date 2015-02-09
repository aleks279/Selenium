require 'rails_helper'

describe ArticlesController do

  let(:article) { FactoryGirl.create(:article) }

  describe "successfully creates a new article" do
    it "assigns the new article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "GET #index" do
    it "responds successfully with a HTTP 200 status code" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the correct article" do
      get :show, id: article.id
      expect(assigns(:article)).to eq(article)
    end

    it "renders success" do
      get :show, id: article.id
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "assigns the correct article" do
      get :show, id: article.id
      expect(assigns(:article)).to eq(article)
    end

    it "render success" do
      get :show, id: article.id
      expect(response).to be_success
    end
  end

  describe "DELETE #destroy" do
    it "deletes the correct article" do
      delete :destroy, id: article.id
      expect(response).to redirect_to articles_path
    end
  end

  describe "POST #create" do

    let(:article_params) { FactoryGirl.attributes_for(:article) }

    context "when save is valid" do
      it "saves the new article" do
        expect {
          post :create, article: article_params
        }.to change(Article.all, :count).by(1)
      end

      it "redirects to index page" do
        post :create, article: article_params
        expect(response).to redirect_to(articles_path)
      end
    end

    context "when save is invalid" do

      before { allow_any_instance_of(Article).to receive(:save).and_return(false) }

      it "re-renders the new template" do
        post :create, article: article_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do

    let(:article) { FactoryGirl.create(:article) }
    let(:article_update_params) { { title: "Other title", text: "Other text" } }

    context "when update is valid" do
      it "updates the article with the given attributes" do
        put :update, id: article.id, article: article_update_params
        expect(article.reload.title).to eq("Other title")
      end

      it "redirects to the article page" do
        put :update, id: article.id, article: article_update_params
        expect(response).to redirect_to article_path(article)
      end
    end

    context "when update is invalid" do

      before { allow_any_instance_of(Article).to receive(:save).and_return(false) }

      it "re-renders the edit template" do
        put :update, id: article.id, article: article_update_params
        expect(response).to render_template(:edit)
      end
    end
  end
end