$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "clean_up_paranoid"
  s.version     = "0.0.1"
  s.authors     = ["Florian Eck"]
  s.email       = ["florian.eck@el-digital.de"]
  s.homepage    = "https://github.com/florianeck/clean_up_paranoid"
  s.summary     = "clean up records deleted by 'acts_as_paranoid' to improve DB performance, yet keeping them somewhere for safety"
  s.description = "This gem backups all DB entries that where marked as deletheheir ed by 'acts_as_parnoid' gem to a seperate table in order to free space in the working tables.
    Adjustments can be made on which entries will be moved based on their deleted_at timestamps"

  s.files = Dir["{app,config,db,lib}/**/*"]

  s.add_dependency 'acts_as_paranoid'
end
