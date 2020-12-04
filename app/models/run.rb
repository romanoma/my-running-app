# == Schema Information
#
# Table name: runs
#
#  id         :integer          not null, primary key
#  city       :string
#  details    :string
#  distance   :string
#  end        :string
#  hills      :string
#  runner     :integer
#  start      :string
#  track_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Run < ApplicationRecord
end
