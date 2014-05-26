class CreateBiznesstypes < ActiveRecord::Migration
  def change
    create_table :biznesstypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
