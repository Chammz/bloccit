require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
  let (:my_question) do
    Question.create(
      id: 1,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      resolved: false
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_question to @question" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end  
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_question.id}
      expect(response).to render_template :show
    end

    it "assigns my_question to @question" do
      get :show, {id: my_question.id}
      expect(assigns(:question)).to eq(my_question)
    end
  end    

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Questions by 1" do
      expect{ post :create, {question: {title: "Title", body: "Body", resolved: false}}}.to change(Question, :count).by(1)}
    end
    
    it "assigns the new question to @question" do
      post :create, {question: my_question.attributes}
      expect(assigns(:question)).to eq Question.last
    endescribe
    
    it "redirects to the enw question" do
      post :create, {question: my_question.attributes}
      expect(response).to redirect_to Question.last
    end  

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}

      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end
    
    it "redirects to the updated question" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: true}
      expect(response).to redirect_to my_question
    end  
  end  
end
