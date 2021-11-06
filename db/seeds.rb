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
