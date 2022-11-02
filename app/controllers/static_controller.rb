class StaticController < ApplicationController
  def index
    render inertia: 'Home',
      props: {
        user: current_user
      }
  end
end
