# == Schema Information
#
# Table name: pieces
#
#  id          :integer          not null, primary key
#  orig_title  :string(255)
#  orig_author :string(255)
#  orig_body   :text
#  title       :string(255)
#  body        :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Piece < ActiveRecord::Base
  attr_accessible :orig_title, :orig_author, :orig_body, :title, :body, :user_id
  belongs_to :user
end
