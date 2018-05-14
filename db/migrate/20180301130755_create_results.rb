class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.text :name
      t.integer :kokuho_res1
      t.integer :kokuho_res2
      t.integer :kokuho_res3
      t.integer :kouki_res1
      t.integer :kouki_res2
      t.integer :kouki_res3

      t.timestamps
    end
  end
end
