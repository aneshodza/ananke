require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comment) { create(:comment) }
  let(:comment_hash) { attributes_for(:comment).except(:task, :user).merge(task_id: comment.task.id) }
  let(:user) { create(:user) }
  before(:each) do
    sign_in user
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new, params: { task: comment.task.id }
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    it "creates a new comment" do
      expect do
        post :create, params: { comment: comment_hash }
      end.to change(Comment, :count).by(2)
      expect(Comment.last.user).to eq(user)
    end

    context "when the comment is invalid" do
      let(:comment_hash) { attributes_for(:comment, content: nil).except(:task, :user).merge(task_id: comment.task.id) }
      it "does not create a new comment" do
        expect do
          post :create, params: { comment: comment_hash }
        end.to change(Comment, :count).by(1)
      end
    end

  end

  describe "DELETE #destroy" do
    context "when the comment belongs to the user" do
      let!(:comment) { create(:comment, user: user) }
      it "deletes a comment" do
        expect do
          delete :destroy, params: { id: comment.id }
        end.to change(Comment, :count).by(-1)
      end
    end

    context "when the comment does not belong to the user" do
      let!(:comment) { create(:comment) }
      it "does not delete a comment" do
        expect do
          delete :destroy, params: { id: comment.id }
        end.to change(Comment, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "when the comment belongs to the user" do
      let(:comment) { create(:comment, user: user) }
      it "updates a comment" do
        put :update, params: { id: comment.id, comment: { content: "new body" } }
        expect(Comment.first.content).to eq("new body")
      end
    end

    context "when the comment does not belong to the user" do
      it "does not update a comment" do
        put :update, params: { id: comment.id, comment: { content: "new body" } }
        expect(Comment.first.content).to_not eq("new body")
      end
    end
  end
end
