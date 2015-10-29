class StudentindexController < ApplicationController
  def show
   render template: "welcome/#{params[:studentindex]}"
 end
end
