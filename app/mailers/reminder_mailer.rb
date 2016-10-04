class ReminderMailer < ActionMailer::Base
  default from: "decana.ar@metododerose.org"

  def remind(participant)
    @participant = participant

    mail to:      participant.email,
         from:    "\"DeRose Festival BA\" <decana.ar@metododerose.org>",
         subject: 'Compartí tu experiencia'
  end
end