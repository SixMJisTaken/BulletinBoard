class AddRelationshipToPosts < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :posts , :user, foreign_key: true
  end
end
