# == Schema Information
#
# Table name: norming_sheets
#
#  id                  :integer          not null, primary key
#  development_goals   :text
#  hidden_superpower   :text
#  life_beyond_kellogg :text
#  personality         :text
#  working_style       :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  class_id            :integer
#  sheet_list_id       :integer
#  student_id          :integer
#

class NormingSheet < ApplicationRecord
end
