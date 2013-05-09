migration 6, :add_ids_to_talks do
  up do
    modify_table :talks do
      add_column :speaker_id, Integer
      add_column :slot_id, Integer
    end
  end

  down do
    modify_table :talks do
      drop_column :speaker_id
      drop_column :slot_id
    end
  end
end
