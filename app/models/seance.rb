class Seance
  include Mongoid::Document

  field :r_id, type: Integer
  field :date_start, type: Date
  field :date_finish, type: Date
  field :times, type: Array

  field :format, type: String

  belongs_to :event
  belongs_to :place
end
