class User < ActiveRecord::Base
	# attr_accessible :email, :password, :password_confirmation, :authentications_attributes
	authenticates_with_sorcery! do |config|
		config.authentications_class = Authentication
	end

	has_many :authentications, :dependent => :destroy
	accepts_nested_attributes_for :authentications

	has_and_belongs_to_many :stocks
	has_many :logs

	# after_create :initialize_user_logs

	def initialize_user_logs
		self.logs.investor_type = "New user"
		self.logs.points = 100000
		self.logs.asset_points = 100000
		self.logs.transactions = "Initialize"
		self.logs.user_id = current_user
	end
end
