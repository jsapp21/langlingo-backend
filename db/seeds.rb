# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Word.destroy_all
Image.destroy_all
Game.destroy_all

category_1 = Category.create(name: "Animals")
category_2 = Category.create(name: "Emotions")
category_3 = Category.create(name: "Foods")
category_4 = Category.create(name: "Objects")
category_5 = Category.create(name: "Sports")

animals = ["dog", "cat", "mouse", "bear", "tiger", "pig", "frog", "monkey", "bunny", 
    "horse", "butterfly", "bee", "chicken", "cow", "eagle", "penguin", "snail", 
    "snake", "octopus", "whale"]

animal_image = [ "🐶", "🐈", "🐭", "🐻", "🐯", "🐷", "🐸", "🐒", "🐰", "🐎", "🦋", "🐝", "🐓", "🐮", "🦅", "🐧", "🐌", "🐍", "🐙", "🐳" ]


emotions = ["happy", "sad", "laugh", "mad", "confused", "love", "nervous", "sick", "cool", "dead", "drunk", "tired", "shocked", "angry", "embarrassed", "joy", "excited", "quiet", "curious", "silly" ]

emotion_image = [ "😄", "☹️", "😂", "😡", "🤷‍♂️", "🥰", "😬", '😷', '😎', '😵', "🥴" "🥱", "😱", "🤬", "🤦‍♂️", "🥳", "🤩", "🤫", "😯", "🤪"]


foods = ['apple', 'orange', 'banana', 'strawberry', 'corn', 'cheese', 'avocado', 'bacon', 'burger', 'egg', 'pizza', 'salad', 'cake', 'ice cream', 'popcorn', 'cookie', 'carrot', 'watermelon', 'cherry', 'bread']

food_image = ['🍎', '🍊', '🍌', '🍓', '🌽', '🧀', '🥑', '🥓', '🍔', '🥚', '🍕', '🥗', '🍰', ' 🍦', '🍿', '🍪', '🥕', '🍉', '🍒', '🥖' ]




objects = ['headphones', 'umbrella', 'game controller', 'telephone', 'clock', 'television', 'money', 'computer', 'axe', 'hammer', 'pencil', 'key', 'knife', 'present', 'calendar', 'telescope', 'pen', 'scissors', 'car', 'taxi' ]

object_image = ['🎧', '☂️', '🎮', '☎️', '⏰', '📺', '💵', '💻', '🪓', '🔨', '✏️', '🔑', '🔪', '🎁', '🗓', '🔭', '✒️', '✂️', '🚗' , '🚕'] 




sports = ['soccer', 'basketball', 'volleyball', 'baseball', 'tennis', 'american football', 'boxing', 'skiing', 'wrestling', 'swimming', 'cycling', 'weight lifting', 'horse back riding', 'lacross', 'badminton', 'kayaking', 'karate', 'skateboard', 'surfing', 'ballet' ]

sport_image = [ '⚽️', '🏀', '🏐', '⚾️', '🎾', '🏈', '🥊', '⛷', '🤼‍♂️', '🏊‍♀️', '🚵‍♂️', '🏋️‍♀️', '🏇', '🥍', '🏸', '🚣‍♂️', '🥋', '🛹', '🏄‍♂️', '🩰' ]

i=0
while i < 20 do 
    Word.create(name: animals[i], category_id: 1)
    Word.create(name: emotions[i], category_id: 2)
    Word.create(name: foods[i], category_id: 3)
    Word.create(name: objects[i], category_id: 4)
    Word.create(name: sports[i], category_id: 5)
    i +=1
end


i=0
while i < 20 do 
    Image.create(image: animal_image[i], category_id: 1)
    Image.create(image: emotion_image[i], category_id: 2)
    Image.create(image: food_image[i], category_id: 3)
    Image.create(image: object_image[i], category_id: 4)
    Image.create(image: sport_image[i], category_id: 5)
    i +=1
end
