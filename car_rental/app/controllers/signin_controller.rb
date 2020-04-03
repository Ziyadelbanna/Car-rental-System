class SigninController < ApplicationController
  def login
  end
  layout 'signin', only: [:login]
end
