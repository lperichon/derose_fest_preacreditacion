class ReminderMailer < ActionMailer::Base
  default from: "decana.ar@metododerose.org"

  def remind(participant)
    mail to:      participant.email,
         from:    "\"DeRose Festival BA\" <decana.ar@metododerose.org>",
         subject: 'Bienvenido al XII DeRose Festival de Buenos Aires'
    headers['X-MC-MergeVars'] = "{\"name\":\"#{participant.first_name}\"}" # variables
    headers['X-MC-Template'] = "recordatorio"  # template
    headers['X-MC-AutoText'] = 1 # generate text version
    headers['X-MC-InlineCSS'] = "true" # inline css
  end
end