class Chef < ApplicationRecord

#    has_secure_password

    has_many :recipes
    has_many :friendships_as_requestor, :class_name => "Friendship", :foreign_key => "acceptor_id"
    has_many :friendships_as_acceptor, :class_name => "Friendship", :foreign_key => "requestor_id"
    has_many :likes
    has_many :liked_recipes, :class_name => "Like", :foreign_key => "chef_id"

#    validates :e_mail, uniqueness: true, message: "This e-mall address has an existing account.  Please log in or reset your password"
#    validates :e_mail, inclusion: {in: "@"}, message: "Please provide a valid e-mail address."
#    validates :password, length: {minimum: 6}
end
