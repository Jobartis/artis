class CreateServiceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :service_types do |t|
      t.text :name

      t.timestamps
    end
  end
end
