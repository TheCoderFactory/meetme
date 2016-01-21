class Meeting < ActiveRecord::Base

	validates :name, :reason, :street, :suburb, :state, :postcode, presence: true
	# validate :date_must_be_in_future

	acts_as_taggable

	geocoded_by :full_street_address
	after_validation :geocode

	def full_street_address
		[street, suburb, state, postcode].compact.join(', ')
	end

	def date_must_be_in_future
		if date.present? && date < Date.today
			errors.add(:date, "Can't be in the past")
		end
	end
end
