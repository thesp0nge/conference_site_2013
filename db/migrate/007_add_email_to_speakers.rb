migration 7, :add_email_to_speakers do
  up do
    modify_table :speakers do
      add_column :email, String
    end
  end

  down do
    modify_table :speakers do
      drop_column :email
    end
  end
end
