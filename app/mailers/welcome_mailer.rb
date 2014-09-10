class WelcomeMailer < MandrillMailer::TemplateMailer	
  default from: 'fnz@padm.am'

  def welcome(participant)
  	mandrill_mail template: 'welcome',
                  subject: "Bienvenido al XI DeRose Festival de Buenos Aires",
                  to: { email: participant.email, name: "#{participant.first_name} #{participant.last_name}" },
                  vars: {
                    'name' => participant.first_name
                  }
  end
end