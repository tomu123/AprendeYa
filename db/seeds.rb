# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adding Courses

Course.all.each do |c|
  c.course_img.purge
end
Course.destroy_all
course = Course.create(name: 'Comunicación')
course.course_img.attach(io: File.open('./ImagesAprendeYa/communication.png'), filename: 'course_img_comunicacion.png')
course = Course.create(name: 'Matemáticas')
course.course_img.attach(io: File.open('./ImagesAprendeYa/math.png'), filename: 'course_img_matematicas.png')
course = Course.create(name: 'Ciencia y Ambiente')
course.course_img.attach(io: File.open('./ImagesAprendeYa/nature.png'), filename: 'course_img_ciencia_y_ambiente.png')
course = Course.create(name: 'Personal Social')
course.course_img.attach(io: File.open('./ImagesAprendeYa/history.png'), filename: 'course_img_personal_social.png')
course = Course.create(name: 'Inglés')
course.course_img.attach(io: File.open('./ImagesAprendeYa/english.png'), filename: 'course_img_ingles.png')

# Adding Units
Unit.all.each do |u|
  u.unit_img.purge
end
Unit.destroy_all
course = Course.find_by(name: 'Matemáticas')
title = 'Estadística: Interpretación y Análisis de Patrones y Probabilidades'
description = 'Descubriremos que son los patrones y las probabilidades, además analizaremos e interpretaremos patrones y probabilidades en distintas situaciones de nuestra vida cotidiana utilizando la moda y otros conceptos de estadística'
unit = Unit.create(title: title,description: description,course: course)
unit.unit_img.attach(io: File.open('./ImagesAprendeYa/statistics.png'), filename: 'unit_img_estadistica.png')
title = 'Fracciones: Partes iguales de un todo'
description = 'Descubriremos que son las fracciones y que podemos hacer con ellas, a través del estudio de proporciones y repartición de partes de un todo en distintas situaciones de nuestra vida cotidiana'
unit = Unit.create(title: title,description: description,course: course)
unit.unit_img.attach(io: File.open('./ImagesAprendeYa/fraction.png'), filename: 'unit_img_fracciones.png')

# Adding Activities
Activity.all.each do |a|
  a.file.purge
end
Activity.destroy_all

# Ejercicios
unit = Unit.find_by(title: 'Estadística: Interpretación y Análisis de Patrones y Probabilidades')
title = 'Lanza un dado y adivina cada vez'
description = 'Aprenderás a organizar en una tabla de frecuencia y a representar en un gráfico de barras los resultados que obtengas al lanzar un dado.'
activity = Activity.create(title: title,description: description,unit: unit,activity_type: 'ejercicio')
activity.file.attach(io: File.open('./DocsAprendeYa/ejercicio_Lanza_un_dado_y_adivina_cada_vez.pdf'), filename: 'ejercicio_Lanza_un_dado_y_adivina_cada_vez.pdf')
title = 'Juego “Predice, pinta y gana”'
description = 'Aprenderás a determinar los posibles resultados y a realizar predicciones usando los términos “seguro”, “más probable” y “menos probable” en un juego con dados.'
activity = Activity.create(title: title,description: description,unit: unit,activity_type: 'ejercicio')
activity.file.attach(io: File.open('./DocsAprendeYa/ejercicio_Juego_Predice_pinta_y_gana.pdf'), filename: 'ejercicio_Juego_Predice_pinta_y_gana.pdf')

# Clases
unit = Unit.find_by(title: 'Estadística: Interpretación y Análisis de Patrones y Probabilidades')
title = 'La Moda'
description = 'Aprenderás que en la estadística, la moda es el valor que aparece con mayor frecuencia en un conjunto de datos.'
activity = Activity.create(title: title,description: description,unit: unit,activity_type: 'clase')
activity.file.attach(io: File.open('./VideosAprendeYa/clase_La_moda.mp4'), filename: 'clase_La_moda.mp4')
title = 'Descubrimos patrones en actividades físicas'
description = 'Los patrones se manifiestan en la vida cotidiana y en la naturaleza. El patrón es una secuencia que tiene una regla. Cuando un patrón o secuencia tiene un núcleo que se repite en forma periódica, se llama patrón de repetición. Con estos patrones, podemos elaborar, por ejemplo, diseños, rutinas y muchas otras actividades más. Estos se construyen o crean siguiendo una regla de repetición.'
activity = Activity.create(title: title,description: description,unit: unit,activity_type: 'clase')
activity.file.attach(io: File.open('./VideosAprendeYa/clase_Descubrimos_patrones_en_actividades_fisicas.mp4'), filename: 'clase_Descubrimos_patrones_en_actividades_fisicas.mp4')
