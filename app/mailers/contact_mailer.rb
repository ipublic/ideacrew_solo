class ContactMailer < ActionMailer::Base
  default :from => "noreply@ideacrew.com"
  default :to => "Dan Thomas <dan.thomas@ideacrew.com>"  
  
  def contact_email(contact_email)
    @contact_email = contact_email
    mail
 end
end
