migration 2, :create_slots do
  up do
    create_table :slots do
      column :id, Integer, :serial => true
      column :ordinal, Integer
      column :schedule, DateTime
      column :type, Integer
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :slots
  end
end
