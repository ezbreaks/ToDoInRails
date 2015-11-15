class Task < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :content, presence: true

	auto_html_for :content do 
		html_escape
		image
		soundcloud
		youtube(:width => '100%', :height => 250, :autplay => false)
		link :target => '_blank', :rel => 'nofollow'
		simple_format

	end

	AutoHtml.add_filter(:image) do |text|
	  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
	    %|<img src="#{match}" alt=""/>|
	  end
	end
end
