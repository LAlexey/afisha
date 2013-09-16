class Asset < ActiveRecord::Base
  #include Ckeditor::Orm::ActiveRecord::AssetBase
  #include Ckeditor::Backend::Paperclip

  self.table_name = 'assets'

  has_attached_file :data,
                    url: '/upload/attachments/:id/:filename',
                    path: ':rails_root/public/upload/attachments/:id/:filename'

  validates_attachment_size :data, less_than: 10.megabytes
  validates_attachment_presence :data

  attr_accessible :data, :title
end
