setwd("~/Documents/R/shiny/bioint")
library(shiny)

dat <- readRDS("data/bioint.rds")

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(inputId="skole",
        label="Skole",
        choiceNames=levels(dat$Skole),
        choiceValues=levels(dat$Skole),
        selected=levels(dat$Skole),
        inline=FALSE
      ),
      checkboxGroupInput(inputId="mnd",
        label="Fødselsmåned",
        choiceNames=levels(dat$F.mnd),
        choiceValues=levels(dat$F.mnd),
        selected=levels(dat$F.mnd),
        inline=FALSE
      ),
      textInput(inputId = "spm", 
        label = "Velg responsvariabler [1, 67]", 
        value = "1, 3:5, 7, 9")
      ),
    mainPanel(
    	plotOutput("hist")
    )
  )
)

server <- function(input, output) {
  
  output$hist <- renderPlot({

    z <- paste0("c(", input$spm, ")")
    z <- eval(parse(text=z))
    spm <- paste0("X", z)
    sel <- dat[
       dat$Skole %in% c(input$skole) & 
         dat$F.mnd %in% c(input$mnd),
       spm , drop=FALSE]
    
    barplot(prop.table(table(unlist(sel))), density=20, col="grey95", space=2/3)
    
#    plot(unlist(dat[1:input$num, spm]))
  })
}

shinyApp(ui = ui, server = server)