# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Student < ApplicationRecord
    validates(:name,
    {
      :presence => true,
      :uniqueness => { :case_sensitive => false }
    }
  )

    has_secure_password
end
