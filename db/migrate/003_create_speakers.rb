migration 3, :create_speakers do
  up do
    create_table :speakers do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :github, String, :length => 255
      column :twitter, String, :length => 255
      column :url, String, :length => 255
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :speakers
  end
end
