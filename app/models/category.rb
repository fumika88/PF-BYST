class Category < ActiveHash::Base #activehashに書き替える

self.data = [
    { id: 1, name: 'Outer' },
    { id: 2, name: 'Tops' },
    { id: 3, name: 'Bottoms' },
    { id: 4, name: 'Dress' },
    { id: 5, name: 'Knit' },
    { id: 6, name: 'Shoes' },
    { id: 7, name: 'Accessories' },
    { id: 8, name: 'Bag' },

  ]

  include ActiveHash::Associations
  has_many :photos

end
