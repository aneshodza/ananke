# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all
  end
end
