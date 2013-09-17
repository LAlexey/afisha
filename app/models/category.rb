class Category
  include Mongoid::Document

  #include Mongoid::Timestamps

  field :slug, type: String
  field :name, type: String

  has_many :events
  has_many :places

  def self.columns
    self.fields.collect{|c| c[1]}
  end
end
