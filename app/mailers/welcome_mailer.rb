class WelcomeMailer < ActionMailer::Base
  default from: "decana.ar@metododerose.org"

  def welcome(participant)
    mail to:      participant.email,
         from:    "\"DeRose Festival BA\" <decana.ar@metododerose.org>",
         subject: 'Bienvenido al XI DeRose Festival de Buenos Aires'
    headers['X-MC-MergeVars'] = "{\"name\":\"#{participant.first_name}\"}" # variables
    headers['X-MC-Template'] = "welcome"  # template
    headers['X-MC-AutoText'] = 1 # generate text version
    headers['X-MC-InlineCSS'] = "true" # inline css
  end
end