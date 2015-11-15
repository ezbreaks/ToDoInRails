class Task < ActiveRecord::Base
	belongs_to :user

	auto_html_for :content do 
		html_escape
		image
		youtube(:width => '100%', :height => 250, :autplay => false)
		link :target => '_blank', :rel => 'nofollow'
		simple_format
	end
end
