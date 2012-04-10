class PositionGenerator < Rails::Generators::NamedBase
  
  desc "Creates a rails migration to add a position column on specified model"

  def create_migration
    generate("migration", "add_position_to_#{table_name} position:integer")
  end

end
