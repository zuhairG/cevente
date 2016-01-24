class WelcomeController < ApplicationController

def index
end

def about
  @title = "about"
end

def contact
  @title = "contact"
end

def faq
  @title = "faq"
end
end
