class Ticket < ActiveRecord::Base
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
