module CleanUpParanoid

  cattr_accessor :backup_time

  # default value for cleanup
  # can be overwritten in Rails initializer in  'Rails.application.config.after_initialize' block
  self.backup_time = 30.days

end

require "clean_up_paranoid/engine"