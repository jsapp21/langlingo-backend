Category.destroy_all
Word.destroy_all
Image.destroy_all


category_1 = Category.create(name: "Animals")
category_2 = Category.create(name: "Emotions")
category_3 = Category.create(name: "Foods")
category_4 = Category.create(name: "Objects")
category_5 = Category.create(name: "Sports")

animals = ["dog", "cat", "mouse", "bear", "tiger", "pig", "frog", "monkey", "bunny", 
    "horse", "butterfly", "bee", "chicken", "cow", "eagle", "penguin", "snail", 
    "snake", "octopus", "whale"]

animal_image = [ "ðķ", "ð", "ð­", "ðŧ", "ðŊ", "ð·", "ðļ", "ð", "ð°", "ð", "ðĶ", "ð", "ð", "ðŪ", "ðĶ", "ð§", "ð", "ð", "ð", "ðģ" ]


emotions = ["happy", "sad", "laugh", "mad", "confused", "love", "nervous", "sick", "cool", "dead", "drunk", "tired", "shocked", "angry", "embarrassed", "joy", "excited", "quiet", "curious", "silly" ]

emotion_image = [ "ð", "âđïļ", "ð", "ðĄ", "ðĪ·ââïļ", "ðĨ°", "ðŽ", 'ð·', 'ð', 'ðĩ', "ðĨī" "ðĨą", "ðą", "ðĪŽ", "ðĪĶââïļ", "ðĨģ", "ðĪĐ", "ðĪŦ", "ðŊ", "ðĪŠ"]


foods = ['apple', 'orange', 'banana', 'strawberry', 'corn', 'cheese', 'avocado', 'bacon', 'burger', 'egg', 'pizza', 'salad', 'cake', 'ice cream', 'popcorn', 'cookie', 'carrot', 'watermelon', 'cherry', 'bread']

food_image = ['ð', 'ð', 'ð', 'ð', 'ð―', 'ð§', 'ðĨ', 'ðĨ', 'ð', 'ðĨ', 'ð', 'ðĨ', 'ð°', ' ðĶ', 'ðŋ', 'ðŠ', 'ðĨ', 'ð', 'ð', 'ðĨ' ]




objects = ['headphones', 'umbrella', 'game controller', 'telephone', 'clock', 'television', 'money', 'computer', 'axe', 'hammer', 'pencil', 'key', 'knife', 'present', 'calendar', 'telescope', 'pen', 'scissors', 'car', 'taxi' ]

object_image = ['ð§', 'âïļ', 'ðŪ', 'âïļ', 'â°', 'ðš', 'ðĩ', 'ðŧ', 'ðŠ', 'ðĻ', 'âïļ', 'ð', 'ðŠ', 'ð', 'ð', 'ð­', 'âïļ', 'âïļ', 'ð' , 'ð'] 




sports = ['soccer', 'basketball', 'volleyball', 'baseball', 'tennis', 'american football', 'boxing', 'skiing', 'wrestling', 'swimming', 'cycling', 'weight lifting', 'horse back riding', 'lacross', 'badminton', 'kayaking', 'karate', 'skateboard', 'surfing', 'ballet' ]

sport_image = [ 'â―ïļ', 'ð', 'ð', 'âūïļ', 'ðū', 'ð', 'ðĨ', 'â·', 'ðĪžââïļ', 'ðââïļ', 'ðĩââïļ', 'ðïļââïļ', 'ð', 'ðĨ', 'ðļ', 'ðĢââïļ', 'ðĨ', 'ðđ', 'ðââïļ', 'ðĐ°' ]

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
