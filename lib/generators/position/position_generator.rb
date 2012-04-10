class PositionGenerator < Rails::Generators::NamedBase

  source_root File.expand_path('../templates', __FILE__)
  
  desc "Creates a rails migration to add a position column on specified model"

  def create_migration
    generate("migration", "add_position_to_#{table_name} position:integer")
  end

end
