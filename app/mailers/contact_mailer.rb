class ContactMailer < ApplicationMailer
  def send_mail

    mail to: "tauryuan@seed.net.tw", subject: "gic mail test!"
  end
end
