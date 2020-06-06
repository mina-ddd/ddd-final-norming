# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  course_name  :string
#  group_number :string
#  quarter      :string
#  year         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Course < ApplicationRecord
end
