class WelcomeMailer < ActionMailer::Base
  default from: "decana.ar@metododerose.org"

  def welcome(participant)
    attachments['filename.jpg'] = File.read(Rails.public_path + 'ProgramaA3.jpg')
    
    @participant = participant

    mail to:      participant.email,
         from:    "\"DeRose Festival BA\" <decana.ar@metododerose.org>",
         subject: 'Bienvenido al XIII DeRose Festival de Buenos Aires'
  end
end