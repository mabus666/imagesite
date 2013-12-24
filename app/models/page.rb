class Page < ActiveRecord::Base

 	validates :title, :status, presence: true
 	belongs_to :photo
 	has_many :menu_items, :as => :menuable, :dependent => :destroy

end
