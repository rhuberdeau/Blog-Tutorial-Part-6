class Comment < ActiveRecord::Base
	validates_presence_of :name, :email, :body
	
	belongs_to :article
end
