class StudentindexController < ApplicationController
  load_and_authorize_resource :class => false

  def show
   render template: "welcome/#{params[:studentindex]}"
 end
end
