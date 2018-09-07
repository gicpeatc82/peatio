class ContactMailer < ApplicationMailer
  def send_mail(ticket_id)
    @ticket = Ticket.find(ticket_id)
    mail to: "tauryuan@seed.net.tw", subject: @ticket.title
  end
end
