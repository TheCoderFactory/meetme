class InviteEmailJob 
  include SuckerPunch::Job
  
  def perform(user_id, meeting_id)
  	ActiveRecord::Base.connection_pool.with_connection do
  		InviteMailer.invited(user_id, meeting_id).deliver_now!
  	end
    # raise NotImplementedError
  end
end
