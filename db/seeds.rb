# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Création de villes
paris = City.create(name: 'Paris')
lyon = City.create(name: 'Lyon')

# Création d'utilisateurs
alice = User.create(username: 'AliceWonder', email: 'alice@example.com', city: paris)
bob = User.create(username: 'Bobby', email: 'bob@example.com', city: lyon)

# Création de potins
gossip1 = Gossip.create(content: "askip john est célib hihi", user: alice)
gossip2 = Gossip.create(content: "vraiment ?", user: bob)

# Création de tags
tag1 = Tag.create(name: '#romance')
tag2 = Tag.create(name: '#drama')

# Association de tags aux potins
GossipTag.create(gossip: gossip1, tag: tag1)
GossipTag.create(gossip: gossip2, tag: tag2)

# Création de commentaires
comment1 = Comment.create(content: "ahiii j'savé pa lol ptdr 💁‍♂️", user: bob, commentable: gossip1)
comment2 = Comment.create(content: "C'est faux!", user: alice, commentable: comment1)

# Création de likes
Like.create(user: alice, gossip: gossip1)
Like.create(user: bob, gossip: gossip2)

# Création de messages
message1 = Message.create(sender: alice, recipient: bob, content: "Salut, as-tu entendu le dernier potin?")
message2 = Message.create(sender: bob, recipient: alice, content: "Oui, c'est incroyable!")

puts "Seeds loaded successfully!"
