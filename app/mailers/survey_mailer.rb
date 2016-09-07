class SurveyMailer < ActionMailer::Base
  default from: "decana.ar@metododerose.org"

  def survey(participant)
    mail to:      participant.email,
         from:    "\"DeRose Festival BA\" <decana.ar@metododerose.org>",
         subject: 'Encuesta de calidad - XIII DeRose Festival de Buenos Aires'
  end
end