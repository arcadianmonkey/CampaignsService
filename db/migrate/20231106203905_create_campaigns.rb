class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :email
      t.date :date

      t.timestamps
    end

    create_table :assets do |t|
      t.belongs_to :campaign
      t.string :name

      t.timestamps
    end

    create_table :criterions do |t|
      t.references :nestable, polymorphic: true
      t.string :criterion_type
      t.string :operand
      t.string :image
      t.integer :order

      t.timestamps
    end
  end
end
