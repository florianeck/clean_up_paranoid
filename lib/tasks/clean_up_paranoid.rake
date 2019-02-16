namespace :clean_up_paranoid do

  desc "clean all tables from deleted records and move them to the back table"
  task :clean_up => :environment   do

    # ensure all models are loaded in order to checkout for deleted_at flags
    Rails.application.eager_load!
    Rails.configuration.eager_load_namespaces.each(&:eager_load!)


    expire_date = Time.now - CleanUpParanoid.backup_time

    puts "Data before #{expire_date.to_de} should be backuped/deleted!"

    # Select all ActiveRecord Classes that are using ActsAsParanoid
    ActiveRecord::Base.descendants.each do |ar_class|
      if ar_class.paranoid?
        puts "#{ar_class.name} is paranoid! - starting backup/cleanup check"

        # select entries to be removed
        old_entries = ar_class.unscoped.where("#{ar_class.paranoia_column} < ?", expire_date)

        puts "--- found #{old_entries.count}"
        cleaned_up_ids = []

        old_entries.each do |old_one|
          ParanoidBackup.create(source: old_one, data: old_one.attributes)
          puts "backed up #{ar_class.name} (#{old_one.id}) "
          cleaned_up_ids << old_one.id
        end

        # finally, really delete everything from classes table!
        puts "delete #{cleaned_up_ids.size} from #{ar_class.name}"
        ar_class.unscoped.where(ar_class.primary_key => cleaned_up_ids).delete_all
      end
    end
  end

end