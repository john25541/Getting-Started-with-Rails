class Article < ApplicationRecord
  has_many :comments , dependent: :destroy

  validates :title, presence: true, 
                  length: {minimum:5}
  

  def change
    create_table :article do |t|
      t.tring :title
      t.text :text
    
      t.timestamps
    end
    
  end
end
