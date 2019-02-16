class ParanoidBackup < ActiveRecord::Base

  belongs_to :source, polymorphic: true

  serialize :data, JSON

  validates_uniqueness_of :source_type, :scope => :source_id


  def source_class
    self.source_type.constantize
  end

  def restore_data
    source_class.new(self.data)
  end

end