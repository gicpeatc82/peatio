class ContactMailer < ApplicationMailer
  def send_mail(ticket_id)
    @ticket = Ticket.find(ticket_id)
    mail to: "gicpeatc82@gmail.com", subject: @ticket.title
  end
end
