## ui.R   opemr-partient shiny app

shinyUI(navbarPage("Patient Panel Synthesizer", inverse = TRUE,
                   
  theme = shinytheme("cerulean"),                   
  
  #--------------------------------------------------------------------------------------
  #  Welcome Page
  #--------------------------------------------------------------------------------------  
  
  tabPanel("Welcome",
          
          includeHTML("welcome.html")
  ), 
  
  #--------------------------------------------------------------------------------------
  #  Records NavbarMenu
  #--------------------------------------------------------------------------------------  
  
  
  navbarMenu("Synthesizer",
            
    tabPanel("Demographics by State",                   
            sidebarLayout(
              sidebarPanel(
                wellPanel(selectInput('state1', h5('State'), state_names$state.name, selectize = TRUE),
                          sliderInput("numPats1", 
                                      h5("Panel Size"), 
                                      value = 100, 
                                      min = 1, 
                                      max = 200 #max_patients$max_pats[which(max_patients$state == input.state1)]
                                      ),
              #           selectInput('ageClass1', h5('Select Age Group'), CCS_desc$CCS_label, selectize = TRUE),
              #           radioButtons("sex1", h5("Select gender"), choices = list("Both" = 1, "Male only" = 2, "Female only" = 3), selected = 1),
                          actionButton("button1", h5('Update Panel'))
                ) # wellPanel(
              ),  # sidebarPanel(
              mainPanel(
                conditionalPanel("!input.button1",
                                 includeHTML("RecordByState1.html" )),
                
                conditionalPanel("input.button1",
                                 tableOutput("table"))
                
                # conditionalPanel("input.button1",
                #                  plotOutput("patientMap1",  height = 800))
              ) # mainPanel(
            )  # sidebarLayout(
    ) #tabPanel
  ), # NavBarMenu

#--------------------------------------------------------------------------------------
#  Analytics NavbarMenu
#--------------------------------------------------------------------------------------  

navbarMenu("Analytics",

    tabPanel("Spatial View"), #tabPanel
    tabPanel("Summary Statistics"), #tabPanel
    tabPanel("Correlations"), #tabPanel
    tabPanel("Modeling"), #tabPanel
    tabPanel("Cluster Analysis") #tabPanel

  ), # NavBarMenu

  
#--------------------------------------------------------------------------------------
#  OpenEMR NavbarMenu
#--------------------------------------------------------------------------------------  

  navbarMenu("OpenEMR",
             tabPanel("Connect"), #tabPanel
             tabPanel("Export Panel"), #tabPanel
             tabPanel("Import Panel"), #tabPanel
             tabPanel("Support") #tabPanel 
  ), # NavBarMenu
           

#--------------------------------------------------------------------------------------
#  About NavbarMenu
#--------------------------------------------------------------------------------------  

  navbarMenu("About",

   tabPanel("Synthesizer"), #tabPanel
   tabPanel("Analytics"), #tabPanel
   tabPanel("OpenEMR"), #tabPanel



    tabPanel("Compliance",

      includeHTML("compliance.html")
    ), #tabPanel



    tabPanel("Terms Of Use",

      includeHTML("terms_of_use.html")
    ), #tabPanel

   tabPanel("Support"), #tabPanel 
   tabPanel("Contact Us") #tabPanel 

  )# NavBarMenu

))


