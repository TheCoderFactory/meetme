class InviteMailer < ApplicationMailer
	default from: "MeetMe Invites <info@coderfactory.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invited.subject
  #
  def invited(user_id, meeting_id)
    @user = User.find(user_id)
    @meeting = Meeting.find(meeting_id)
    mail(to: @user.email, subject: 'You have been invited to a meeting')
  end
end
