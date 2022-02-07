class AddActivityTypeToActivities < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE activity_type AS ENUM ('clase', 'ejercicio', 'recurso');
    SQL
    add_column :activities, :activity_type, :activity_type
    add_index :activities, :activity_type
  end

  def down
    remove_column :activities, :activity_type
    execute <<-SQL
      DROP TYPE activity_type;
    SQL
  end
end
