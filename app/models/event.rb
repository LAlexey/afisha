class Event
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :r_id, type: String # redom id
  field :age_restricted, type: Integer
  field :original, type: String
  field :aka, type: String
  field :year, type: Integer
  field :release_date, type: DateTime # maybe should be DateTime
  field :director, type: String
  field :cast, type: String
  field :runtime, type: Integer # event length in minutes
  field :url, type: String

  field :countries, type: Array

  belongs_to :category
  has_many :seances

  embeds_one :poster, class_name: 'Event::EventPicture', cascade_callbacks: true
  embeds_one :image, class_name: 'Event::EventPicture', cascade_callbacks: true

  accepts_nested_attributes_for :poster
  accepts_nested_attributes_for :image

  class EventPicture
    include Mongoid::Document
    include Mongoid::Paperclip

    embedded_in :event

    has_mongoid_attached_file :data,
                              :path           => ':rails_root/public/upload/event_pictures/:id_partition/:basename_:style.:extension',
                              :url            => '/upload/event_pictures/:id_partition/:basename_:style.:extension',
                              :styles => {
                                  :content  =>  ['800>',    :jpg],
                                  :thumb    =>  ['118x100#',:jpg],
                              }#,
                              #:convert_options => { :all => '-background white -flatten +matte' }
  end
end
