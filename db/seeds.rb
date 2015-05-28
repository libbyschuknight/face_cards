roa = [
  {email: "kyle.snowschwartz@gmail.com", password: "password", facecard: [{name: "Kyle", face_url: "https://avatars2.githubusercontent.com/u/11069001?v=3&s=460"}]},
  {email: "elisabeth.mckoy@gmail.com", password: "password", facecard: [{face_url: "https://avatars2.githubusercontent.com/u/11071977?v=3&s=400", name: "Liz"}]},
  {email: "libbysk@gmail.com", password: "password", facecard: [{face_url: "https://avatars2.githubusercontent.com/u/7097235?v=3&s=400", name: "Libby"}]},
  {email: "carolyn034@gmail.com", password: "password", facecard: [{face_url: "https://avatars3.githubusercontent.com/u/11232780?v=3&s=400", name: "Carolyn"}]}
]

# user = User.create(email: "kyle.snowschwartz@gmail.com", password: "password")

# facecard = Facecard.create(name: "Kyle", face_url: "https://avatars2.githubusercontent.com/u/11069001?v=3&s=460")

# stack = Stack.create(name: "The Many Faces of Roa", user_id: user.id, facecard_id: facecard.id)

  roa.each do |face_hash|
    user = User.create(email: face_hash[:email], password:face_hash[:password])

    face_hash[:facecard].each do |face_info|
      unless facecard = Facecard.find_by(face_url: face_info[:name])
        facecard = Facecard.create(name: face_info[:name], face_url: face_info[:face_url])
      end
      stack = Stack.create(name: "The Many Faces of Roa", user_id: user.id, facecard_id: facecard.id)
    end
  end