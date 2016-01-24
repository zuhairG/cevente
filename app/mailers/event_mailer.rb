class EventMailer < ApplicationMailer
  default from: "ceventee@gmail.com"

def invitation(email, event, member, inviter)
  @event = event
  @inviter = inviter
  @attend_url = rsvp_event_path(@event, invitation_token: member.invitation_token, rsvp_status: :attending, only_path: false)
  mail(to: email, subject: 'Event invitation')
end

end
