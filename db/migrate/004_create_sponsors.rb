migration 4, :create_sponsors do
  up do
    create_table :sponsors do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :url, String, :length => 255
      column :type, Integer
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :sponsors
  end
end
