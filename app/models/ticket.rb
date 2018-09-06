class Ticket < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  
  belongs_to :author, class_name: 'Member', foreign_key: 'author_id'

end

# == Schema Information
# Schema version: 20180905012520
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  aasm_state :string(255)
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
