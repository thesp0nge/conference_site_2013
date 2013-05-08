migration 5, :create_talks do
  up do
    create_table :talks do
      column :id, Integer, :serial => true
      column :title, String, :length => 255
      column :abstract, "TEXT"
      column :slides, String, :length => 255
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :talks
  end
end
