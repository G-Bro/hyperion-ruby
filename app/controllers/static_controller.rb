class StaticController < ApplicationController
  def index
    render inertia: 'Home',
      props: {
        
      }
  end
end
