class Comment < ActiveRecord::Base
  after_commit :send_notification, on: [:create]

  acts_as_readable on: :created_at
  belongs_to :ticket
  belongs_to :author, class_name: 'Member', foreign_key: 'author_id'

  validates :content, presence: true

  private

  def send_notification
    ticket_author = self.ticket.author

    if ticket_author != self.author
      CommentMailer.user_notification(self.id).deliver
    else
      CommentMailer.admin_notification(self.id).deliver
    end
  end
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
