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
#  student_id   :integer
#

class Course < ApplicationRecord
end
