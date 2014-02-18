class Reservation < MailForm::Base
  
  attribute :site_id
  attribute :first_name, :validate => true
  attribute :last_name, :validate => true
  attribute :email, :validate => true, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone, :validate => true
  attribute :address, :validate => true
  attribute :city, :validate => true
  attribute :zip_code, :validate => true
  attribute :car_model, :validate => true	
  attribute :pick_up_date, :validate => true	        
  attribute :return_date, :validate => true	        
  attribute :arrival, :validate => true
  attribute :company, :validate => true
  attribute :time, :validate => true
  attribute :delivery, :validate => true	
  attribute :time, :validate => true
  attribute :comment, :validate => true  
  attribute :baby_seat, :validate => true	
  attribute :message
  attribute :nickname, :captcha => true
  
  #validates :email, :presence => true, :email => true
  
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Demande de réservation",
      :to => Site.current.email,
      :from => %("#{first_name} #{last_name}" <#{email}>)
    }
  end
  
  def to_s
    "#{first_name} #{last_name}"
  end
  
end



 	
