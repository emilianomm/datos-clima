# Preparar los datos a un formato mas manejable por R

library(tidyverse)

# Estacion
cod.nac.estacion = 180005

path.temp = paste("Datos/",
             as.character(cod.nac.estacion),
             "/Temperatura.csv",
             sep = "")

path.agua = paste("Datos/",
                  as.character(cod.nac.estacion),
                  "/Agua24hrs.csv",
                  sep = "")

path.humd = paste("Datos/",
                  as.character(cod.nac.estacion),
                  "/Humedad.csv",
                  sep = "")

path.vnt = paste("Datos/",
                  as.character(cod.nac.estacion),
                  "/Viento.csv",
                 sep = "")

temperatura = read_csv2(file = path.temp)[,2:3]; names(temperatura) = c("momento", "Temperatura")
agua24      = read_csv2(file = path.agua)[,2:3]; names(agua24) = c("momento", "Agua24hrs")
humedad     = read_csv2(file = path.humd)[,2:3]; names(humedad) = c("momento", "Humedad")
viento      = read_csv2(file = path.vnt)[,2:3]; names(viento) = c("momento", "Viento")

temporal1 = full_join(temperatura, agua24,
                      by = "momento")

temporal2 = full_join(humedad, temporal1,
                      by = "momento")

temporal3 = full_join(viento, temporal2,
                      by = "momento")

datos.est.actual = temporal3

save(datos.est.actual, file = paste(
  "Datos/", as.character(cod.nac.estacion),"/datos.RData",
  sep = "")
  )

rm(temporal1,
   temporal2,
   temporal3,
   temperatura,
   agua24,
   humedad,
   viento)
