## global.R    opemr-partient shiny app

library(shiny)
library(sp)
library(leaflet)
library(dplyr)
#library(ggplot2)
library(shinythemes)

state_names  <- readRDS("./state_names34.Rds")
patient      <- readRDS("./patient_oemr.Rds")
max_patients <- readRDS("./max_addressable_patients.Rds")