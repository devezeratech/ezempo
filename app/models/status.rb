class Status < ActiveRecord::Base
  belongs_to :user
  validates :text_status, presence: true
end
