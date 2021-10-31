# generar mapa con las ubicaciones de las estaciones

library(leaflet)

# solo si no esta cargado
load(file = "scripts/tabla_estaciones.RData")


leaflet(tabla_estaciones) %>% 
  addTiles() %>%
  setMaxBounds( lng1 = min(tabla_estaciones$Longitud) - 10,
                lat1 = -1,
                lng2 = max(tabla_estaciones$Longitud) + 10,
                lat2 = -179) %>% 
  addAwesomeMarkers(lng = ~ Longitud, lat = ~ Latitud, 
                    label = "VER DATOS ESTACIÓN",
                    popup = ~paste("Nombre:", as.character(Nombre), "</br>" ,
                                   "Código  Nacional:", "<a href='www.uc.cl'", "' target='_blank'>",
                                   as.character(tabla_estaciones$'Código  Nacional'), "</a>", 
                                   "</br>" ))

