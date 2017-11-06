module Admin
  class SessionsController < ApplicationController
    def new
      @user = Fae::User.new
    end
  end
end