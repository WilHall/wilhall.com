class ContactsController < ApplicationController
  def show
    render
  end

  def update
    params.permit(:name, :email, :message)

    ActionMailer::Base.mail(
      from: Rails.configuration.email[:from_address],
      to: "wil@wilhall.com",
      reply_to: params[:email],
      subject: "wilhall.com: Message from #{params[:name]} (#{params[:email]})",
      body: params[:message]
    ).deliver

    redirect_to contact_path, notice: "Your message has been received! I'll be in touch soon."
  end
end
