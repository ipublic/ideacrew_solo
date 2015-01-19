class WelcomeController < ApplicationController
  def index
  end

  def contact_us
    @email = String.new(params[:email])
    
    if @email.to_s.length > 5
      OmBetaMailer.beta_email(@email).deliver
      msg = "Thank you for your message! We will direct it to the appropriate representative and follow up with you at #{@email} "
    else
      msg = "You must enter a valid email address"
    end

    redirect_to(welcome_index_path, 
      :notice => msg )
  end
end
