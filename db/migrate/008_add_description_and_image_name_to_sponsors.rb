migration 8, :add_description_and_image_name_to_sponsors do
  up do
    modify_table :sponsors do
      add_column :description, 'TEXT'
    add_column :image_name, String
    end
  end

  down do
    modify_table :sponsors do
      drop_column :description
    drop_column :image_name
    end
  end
end
