class CreateAtividades < ActiveRecord::Migration[5.2]
  def change
    create_table :atividades do |t|
      t.string :name
      t.string :description
      t.references :turma, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
