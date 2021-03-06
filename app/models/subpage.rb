class Subpage < ActiveRecord::Base
	has_attached_file :image,
		:styles => {
			:thumb => "50x50#",
			:display => "348x232>"
		},
		:processors => [:thumbnail, :compression]

	validates_attachment_content_type :image,
	content_type: /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"

	auto_html_for :content  do
		html_escape
		image
		youtube(:width => "100%", :height => "250", :autoplay => false)
		vimeo(:width => "100%", :height => "250", :autoplay => false)	
		link	:target => "_blank", :rel => "nofollow"
		simple_format
	end

	validates :image, attachment_presence: true
	
	extend FriendlyId
	friendly_id :name, use: :slugged

	after_save :reload_routes

	def reload_routes
		DynamicRouter.reload
	end

	def self.search(query)
	  where('name like :query OR category like :query', query: "%#{query}%")
	end
end
