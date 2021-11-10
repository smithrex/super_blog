# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Punto 10 Crea 5 usuarios

a = User.new
a.first_name = "Usuario 1"
a.last_name = "Usuario 1"
a.email_address = "Usuario1@email.com"
a.save  

a = User.new
a.first_name = "Usuario 2"
a.last_name = "Usuario 2"
a.email_address = "Usuario2@email.com"
a.save  

a = User.new
a.first_name = "Usuario 3"
a.last_name = "Usuario 3"
a.email_address = "Usuario3@email.com"
a.save  

a = User.new
a.first_name = "Usuario 4"
a.last_name = "Usuario 4"
a.email_address = "Usuario4@email.com"
a.save 

a = User.new
a.first_name = "Usuario 5"
a.last_name = "Usuario 5"
a.email_address = "Usuario5@email.com"
a.save 


#version acortada 
#5.times do |nusuario|
  #a.first_name = "Usuario #{1 + nusuario}"
  #a.last_name = "Usuario 1"
  #a.email_address = "Usuario1email"
  #a.save  
#end
#se va a repetir 5 veces con referencia en el first_name

#version con upto
#1.upto(5) do |nusuario|
  #a = User.new
  #a.first_name = "Usuario #{nusuario}"
  
  #a.last_name = "Usuario 1"
  #a.email_address = "Usuario1email"
  #a.save
#end
# 1er => first_name Usuario 1
# 2do => first_name Usuario 2
# 3er => first_name Usuario 3
# 4t0 => first_name Usuario 4
# 5to => first_name Usuario 5

puts "n usuarios: #{User.all.count}"
puts "tarea 10 hecha."

#Punto 11 Crear 5 blogs

b = Blog.new
b.name = "Blog 1"
b.description = "descripcion blog 1"
b.save

b = Blog.new
b.name = "Blog 2"
b.description = "descripcion blog 2"
b.save

b = Blog.new
b.name = "Blog 3"
b.description = "descripcion blog 3"
b.save

b = Blog.new
b.name = "Blog 4"
b.description = "descripcion blog 4"
b.save

b = Blog.new
b.name = "Blog 5"
b.description = "descripcion blog 5"
b.save

puts "Nblogs: #{Blog.all.count}"
puts "tarea 11 hecha"

#version corta con upto
#1.upto(5) do |nblog|
  #b = Blog.new
  #b.name = "Blog #{nblog}"
  #b.description = "descripcion blog 1"
  #b.save
#end



#Punto 12 Establecer que los primeros 3 blogs pertenezcan al primer usuario.

ow = Owner.new
ow.blog = Blog.where(name: "Blog 1").first
ow.user = User.where(first_name: "Usuario 1").first
ow.save()

ow = Owner.new
ow.blog = Blog.where(name: "Blog 2").first
ow.user = User.where(first_name: "Usuario 1").first
ow.save()

ow = Owner.new
ow.blog = Blog.where(name: "Blog 3").first
ow.user = User.where(first_name: "Usuario 1").first
ow.save()

#version acortada
#3.times do |nblog|
  #ow = Owner.new
  #ow.blog = Blog.where(name: "Blog #{nblog + 1}").first
  #ow.user = User.where(name: "Usuario 1").first
  #ow.save()
#end

#version con upto
#1.upto(3) do |nblog|
  #ow = Owner.new
  #ow.user = User.where(first_name: "Usuario 1").first
  #ow.blog = Blog.where(name: "Blog #{nblog}").first
  #ow.save()
#end
puts User.where(first_name: "Usuario 1").first.owner.count
puts "tarea 12 hecha"

#Tarea 13 Establecer que el blog 4, pertenezca al segundo usuario

ow = Owner.new
ow.user = User.where(first_name: "Usuario 2").first
ow.blog = Blog.where(name: "Blog 4").first
ow.save()

puts User.where(first_name: "Usuario 2").first.owner.count #para contar el numero de propiedades

puts User.where(first_name: "Usuario 2").first.owner.where(blog: Blog.where(name: "Blog 4").first).count #sobre las propiedades revisa los blogs

puts "# de propiedades: #{User.where(first_name: "Usuario 2").first.owner.count}"
## de propiedades: 3

puts "El blog 4 esta asinado #{User
  .where(first_name: "Usuario 2")
  .first.owner
  .where(blog: Blog.where(name: "Blog 4").first)
  .count}"

puts "tarea 13 hecha"



#Tarea 14 Establecer que el blog 5, pertenezca al ultimo usuario

ow = Owner.new
ow.user = User.where(first_name: "Usuario 5").first
ow.blog = Blog.where(name: "Blog 5").first
ow.save()

puts User.where(first_name: "Usuario 5").first.owner.count

puts User.where(first_name: "Usuario 5")
  .first.owner
  .where(blog: Blog.where(name: "Blog 5").first).count

puts "Tarea 14 hecha"


#Tarea 15 Establecer que tercer usuario, sea propietario de todos los usuarios que se crearon.
#Usuario3 debe ser dueño de 5 blogs.

ow = Owner.new
ow.user = User.where(first_name: "Usuario 3").first
ow.blog = Blog.where(name: "Blog 1").first
ow.save

ow = Owner.new
ow.user = User.where(first_name: "Usuario 3").first
ow.blog = Blog.where(name: "Blog 2").first
ow.save

ow = Owner.new
ow.user = User.where(first_name: "Usuario 3").first
ow.blog = Blog.where(name: "Blog 3").first
ow.save

ow = Owner.new
ow.user = User.where(first_name: "Usuario 3").first
ow.blog = Blog.where(name: "Blog 4").first
ow.save

ow = Owner.new
ow.user = User.where(first_name: "Usuario 3").first
ow.blog = Blog.where(name: "Blog 5").first
ow.save

#version corta ---importa el cambio en los blogs

#1.upto(5) do |nblog|
  #ow = Owner.new
  #ow.user = User.where(first_name: "Usuario 3").first
  #ow.blog = Blog.where(name: "Blog #{nblog}").first
  #ow.save
#end

#Comprobación contando el numero de propiedades (trae el numero de propiedades y los cuenta)

puts User.where(first_name: "Usuario 3").first.owner.count

#comprobacion avanzada

puts User.where(first_name: "Usuario 3").first.owner
  .where(blog: Blog
    .where(name: [
      "Blog 1", "Blog 2", "Blog 3", "Blog 4", "Blog 5"])).count

puts "Tarea 15 Hecha"

#Tarea 16 Haz que el primer usuario cree tres publicaciones para el blog con id = 2. 
#Recuerde que no debe hacer Publicacion.create(usuario: Usuario.first, blog_id: 2), sino algo como Publicacion.create(usuario: Usuario.first, blog: Blog.find(2)). 
#Repito, nunca se debe hacer referencia a las claves foráneas en Rails.


#version corta con upto
1.upto(3) do |npost|
	p = Post.new
	p.title = "Post #{npost}"
	p.content = "Contenido 1"
	p.blog = Blog.where(name: "Blog 2").first
	p.user = User.where(first_name: "Usuario 1").first
	p.save()
end

#version larga---repetir 3 veces este codigo, cambiando el nombre a post 1, post 2, post 3
#p = Post.new
#p.title = "Post #{npost}"
#p.content = "Contenido 1"
#p.blog = Blog.where(name: "Blog 2").first
#p.user = User.where(first_name: "Usuario 1").first
#p.save()

#Comprobacion se asignan nuevas variables ue--user encontrado y be ---blog encontrado
ue= User.where(first_name: "Usuario 1").first
be= Blog.where(name: "Blog 2").first

#puts "Posts: #{Post.where(user: ue, blog: be)}"
puts "Posts: #{Post.where(user: ue, blog: be).count}"

puts "Tarea 16 hecha" 

#Tarea 17 Haz que el segundo usuario cree 5 publicaciones para el último blog.

us2 = User.where(first_name: "Usuario 2").first
ulb = Blog.where(name: "Blog 5").first

1.upto(5) do |npost|
	p = Post.new
  p.title = "Post #{npost}"
  p.content = "contenido"
  p.user = us2
  p.blog = ulb
  p.save()
end

puts "Posts: #{Post.where(blog: ulb, user:us2).count}"
puts " Tarea 17 Hecha."

#Tarea 18
#Haz que el tercer usuario cree varias publicaciones en diferentes blogs

us3 = User.where(first_name: "Usuario 3").first

Blog.all.each do |t|
  p = Post.new
  #p.blog = Blog.find(t.id)
  #p.blog = Blog.where(id: t.id).first
  p.blog = t
  p.user = us3
  p.title = "Title"
  p.content = "Un nuevo contenido"
  p.save
end

puts "Cantidad de posts: #{Post.where(user: us3).count}" #version belongs_to
puts "Cantidad de posts: #{us3.post.count}" #version has_many

puts "Tarea 18 hecha"

#Tarea 19 Haz que el tercer usuario cree 2 mensajes para la primera publicación creada y 3 mensajes para la segunda publicación creada.

us3 = User.where(first_name: "Usuario 3").first #hace redundancia, se mencionó en la linea 286


primpub = Post.all[0]
secpub = Post.all[1]

1.upto(2) do |t|
  m = Message.new
  m.post = primpub
  m.user = us3
  m.author = "algun author"
  m.message = "Aqui va un message"
  m.save
end

1.upto(3) do |t|
  m = Message.new
  m.post = secpub
  m.user = us3
  m.author = "algun author"
  m.message = "Aqui va un message"
  m.save
end


#Comprobacion
#Contar el numero de Messages del usuario 3

puts "Cantidad de Messages Usuario 3: #{us3.message.count}" #ver has_many
puts "tarea 19 hecha"

#Tarea 20 Haz que el cuarto usuario cree 3 mensajes para la última publicación que tu creaste.

us4 = User.where(first_name: "Usuario 4").first
ulpub = Post.all.last

1.upto(3) do
  m = Message.new
  m.post = ulpub
  m.user = us4
  m.author = "algun author"
  m.message = "Aqui va un message x"
  m.save
end

#contar los messages del usuario 4
puts "Cantidad de Messages Usuario 4: #{us4.message.count}" #has_many
puts Message.where(user: us4).count #belongs to
puts "tarea 20 hecha"

#Tarea 21Cambie el propietario de la 2 publicación para que sea el último usuario.

#1 Buscar la publicacion 
#2 Buscar el ultimo usuario 

#Captura al segundo Post en la variable po2
po2 = Post.all[0]
puts "antes => #{po2.user.first_name}"
#po2 = Post.all[1] #----> Post.all.first
#Captura al ultimo usuario en la variable ulu 
ulu = User.all.last

#Actualizar usuario
po2.user = ulu
po2.save

puts "despues =>#{po2.user.first_name}"
puts "Tarea 21 Hecho"

#Tarea 22 Cambie el contenido de la segunda publicación por algo diferente.

#Capturar
po2 = Post.all[1]
po2.content = "Un nuevo contenido modificado"
#po2.content = nil #va a saltar la validacion

po2.save
puts po2.errors.full_messages #Si arroja un array vacío, está correcto; si arroja contenido, no paso las validaciones#se debe hacer despues del .save, ya que así se asegura que se haya guardado el dato.

puts "Content: #{po2.content}"
puts "Tarea 22 Hecho"

#Tarea 23 
#Obtenga todos los blog que son propiedad del tercer usuario (haz que esto funcione con un simple Usuario.find(3).blogs).---> metodo has_many

#User.find(3).owner #retorna todos los owner del usuario 3 ---cuando es un array, puedo usar .pluck para obtener un dato específico---ej. blog_id

us3 = User.find(3)
#us3 = User.where(first_name: "Usuario 3").first (version belongs_to)
owners = us3.owner
blogs_ids = owners.pluck(:blog_id)#relación inmediata
#blogs_ids => [45, 3, 34]
blogs = Blog.where(id: blogs_ids)#esto se puede filtrar e imprimir

puts "Blogs del Usuario 3: #{blogs}"
puts "tarea 23 hecha"

#Tarea 24 Obtenga todas las publicaciones que fueron creadas por el tercer usuario.

us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first

puts us3.post #has_many
puts Post.where(user: us3) #belongs_to

puts "Tarea 24 hecha"

#Tarea 25 Obtenga todos los mensajes escritos por el tercer usuario.
us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first

puts us3.message #has_many
puts Message.where(user: us3) #belongs_to
puts "tarea 25 hecho"

#tarea 26 Obtenga todas las publicaciones asociadas al blog con id = 5 y quién dejó cada publicación.  

bl5 = Blog.find(5)
posts = Post.where(blog: bl5)
users = posts.pluck(:user_id)
puts User.where(id: users)

puts "tarea 26 hecho"

# tarea 27 Obtenga todos los mensajes asociados al blog con id = 5, junto con toda la información de los usuarios que dejaron mensajes.  

bl5 = Blog.find(5)
posts= Post.where(blog: bl5)
msgs = Message.where(post: posts)
users = msgs.pluck(:user_id)
puts User.where(id: users)

puts "tarea 27 hecho"


#tarea 28 Obtenga toda la información de los usuarios que son propietarios del primer blog (haz que esto funcione con un simple Blog.first.propietarios). 

owners = Blog.first.owner
users = owners.pluck(:user_id)
User.where(id: users).each do |t|
  puts "#{t.first_name} ,  
  #{t.last_name} , 
  #{t.email_address}"
end
puts "tarea 28 hecho"
#tarea 29 Cámbielo, es decir, el primer usuario ya no es propietario del primer blog.

us1 = User.first
usul = User.last
bl1 = Blog.first
own = Owner.where(user: us1, blog: bl1)
own.update_all(user_id: usul.id)


#comprobacion
puts Owner.where(user: us1, blog: bl1).count
#debiera arrojar 0

puts "tarea 29 hecho"




