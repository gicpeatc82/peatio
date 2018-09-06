class Comment < ActiveRecord::Base

end

# == Schema Information
# Schema version: 20180905013112
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  author_id  :integer
#  ticket_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
