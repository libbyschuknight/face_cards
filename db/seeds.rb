roa = [
  {email: "kyle.snowschwartz@gmail.com", password: "password", facecard: [{name: "Kyle", face_url: "https://avatars2.githubusercontent.com/u/11069001?v=3&s=460"}]},
  {email: "elisabeth.mckoy@gmail.com", password: "password", facecard: [{face_url: "https://avatars2.githubusercontent.com/u/11071977?v=3&s=400", name: "Liz"}]},
  {email: "libbysk@gmail.com", password: "password", facecard: [{face_url: "https://avatars2.githubusercontent.com/u/7097235?v=3&s=400", name: "Libby"}]},
  {email: "carolyn034@gmail.com", password: "password", facecard: [{face_url: "https://avatars3.githubusercontent.com/u/11232780?v=3&s=400", name: "Carolyn"}]},
  {email: "samnzd19@gmail.com", password: "password", facecard: [{face_url: "https://avatars0.githubusercontent.com/u/9012936?v=3&s=400", name: "Shambu"}]},
  {email: "Deepa.joby@gmail.com", password: "password", facecard: [{face_url: "https://avatars3.githubusercontent.com/u/11072797?v=3&s=400", name: "Deepika"}]},
  {email: "maxalot@gmail.com", password: "password", facecard: [{face_url: "https://avatars0.githubusercontent.com/u/11280532?v=3&s=400", name: "Max"}]},
  {email: "matthew.bullock@gmail.com", password: "password", facecard: [{face_url: "https://avatars2.githubusercontent.com/u/11070821?v=3&s=400", name: "Matt"}]},
  {email: "Alex.duke@gmail.com", password: "password", facecard: [{face_url: "https://avatars3.githubusercontent.com/u/8731644?v=3&s=400", name: "Alex"}]}
]

# user = User.create(email: "kyle.snowschwartz@gmail.com", password: "password")

# facecard = Facecard.create(name: "Kyle", face_url: "https://avatars2.githubusercontent.com/u/11069001?v=3&s=460")

# stack = Stack.create(name: "The Many Faces of Roa", user_id: user.id, facecard_id: facecard.id)

User.delete_all
Facecard.delete_all
Stack.delete_all

roa.each do |face_hash|

  user = User.find_or_create_by(email: face_hash[:email], password:face_hash[:password])

  stack = user.stacks.find_or_create_by(name: "The Many Faces of Roa")

  face_hash[:facecard].each do |face_info|
    stack.facecards.find_or_create_by(name: face_info[:name], face_url: face_info[:face_url], stack_id: stack.id)
  end

end