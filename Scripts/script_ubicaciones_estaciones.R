
# Extraer tabla con datos de estaciones

library(rvest)
library(xml2)
library(dplyr)
library(magrittr)

# Actualmente no funciona
# Definir URL como variable
URL = 'https://climatologia.meteochile.gob.cl/application/informacion/buscadorDeEstaciones/RE3017'

# Guardamos la página el el objeto PAGE (documento html)
PAGE = xml2::read_html(URL)

# Extraemos la tabla con rvest
# Por alguna razon no reconoce nada mas alla del cuarto div :()
full_path = "/html/body/div/div[1]/div[2]/div/div/div[2]/table"
xpath_to_table = "/html/body/div/div[1]/div[2]/div[1]"
node = PAGE %>% rvest::html_elements(xpath = xpath_to_table) 
tabla1 = node %>% rvest::html_table(header = TRUE)

# Otra opcion, cargar el archivo html localmente
# Para esto debo copiar el codigo html desde la pag. en un archivo local
# SI funciona
raw_html = xml2::read_html(x = "tabla_estaciones.html",
                           encoding = "UTF-8")
tabla_estaciones =  raw_html %>% rvest::html_element(xpath = "/html/body/table")  %>% rvest::html_table(header = TRUE)
tabla_estaciones

save(tabla_estaciones, file = "tabla_estaciones.RData")





