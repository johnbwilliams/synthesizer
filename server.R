## server.R   opemr-partient shiny app

shinyServer(function(input, output, session) {
  
  #--------------------------------------------------------------------------------------------------  
  # Synthetic Patient Records by State
  #
  # records1a
  #
  # input$state1
  # input$numPats1
  # input$button1
  #-------------------------------------------------------------------------------------------------
  
  state1x   <- eventReactive(input$button1,  {input$state1})
  numPats1x <- eventReactive(input$button1,  {input$numPats1 })
  
 # output$patientMap1 <- renderLeaflet({
  
    # Get state
    selected_state1 <- reactive({
      state_names %>%
      filter(state.name == state1x()) %>%
      select(state.abbrev) %>% 
      as.character
    })
      
    # filter records on selected state and selected number
    patientx <- reactive({
      patient %>%  filter(state == selected_state1()) %>% 
      sample_n(size = as.integer(numPats1x()))   
    })
    
#    print(nrow(patientx()))
    # check & abort for  zzero records
#    validate( need(nrow(patientx) != 0, paste("There are no patient records in", isolate(input$state1x), "for your input selections", sep = " ")  ))
    
    # z <- patientx()
    # print(nrow(z) ) #, as.numeric(z$lat[1]), as.numeric(z$lon[1]) )
    
    

    output$table <- renderTable( patientx() )
    
    
    
    # leaflet() %>%
    #   addProviderTiles(providers$Stamen.TonerLite,
    #                    options = providerTileOptions(noWrap = TRUE)) %>%
    #   addCircleMarkers(z$lat,
    #                    z$lon)
      
      
      # addTiles(
      #   urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
      #   attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>') %>%
      # addCircleMarkers(patientx$lat,
      #                  patientx$lon
                       # radius <- 1 # ifelse(isolate(mapDisp1x())  == 1, 1, 2.5),
                       #                   # fill = TRUE,
                       #                   # fillOpacity = 0.1,
                       #color = colorVal,  
                       #popup = paste(z$name,
                       #             ifelse(!is.na(z$addr2), paste(z$addr1, z$addr2, sep = ", "), z$addr1),
                       #              z$city,
                       #                 paste(z$state, z$zip, z$country, sep = " "),
                      #              paste(ifelse(z$nType, "NPI-I", "NPI-II"), z$npi, sep = " "),
                       #               sep = ", "
#                       ) # %>%
     # addLegend(position = c("bottomleft"),
      #          colors = c("#000080", "#FF0000"),
      #          labels = c("Individual Provider", "Organizational Provider")
    
#  })
})
  