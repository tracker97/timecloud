class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  
  validates :type_bien, presence: true
  validates :nb_personne, presence: true
  validates :nb_chambre, presence: true
  validates :nb_sdb, presence: true
  validates :nom_annonce, presence: true, length: {maximum: 75}
  validates :description_annonce, presence: true, length: {maximum: 600}
  validates :adresse_annonce, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 5}
  
  #Geocoder 
  geocoded_by :adresse_annonce
  after_validation :geocode, if: :adresse_annonce_changed?
  
end
