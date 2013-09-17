class Place
  include Mongoid::Document

  field :r_id, type: Integer
  field :title, type: String
  field :description, type: String
  field :address, type: String
  field :phone, type: String
  field :city, type: String
  field :url, type: String

  belongs_to :category
  has_many :seances

  def self.columns
    self.fields.collect{|c| c[1]}
  end
end
