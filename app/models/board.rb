# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  title      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
end
