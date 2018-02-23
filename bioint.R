setwd("~/Documents/R/shiny/bioint")
library(shiny)

source("extra.style.r")
dat <- readRDS("data/bioint.rds")

F.mnd.nam <- F.mnd.val <- levels(dat$F.mnd)[c(2:13, 1)]
F.mnd.nam[F.mnd.nam == 0] <- "NA"

ui <- fluidPage(
  extra.style,
	titlePanel("Responser fra NOU: \"Interesse for biologifagene\""),
  sidebarLayout(
    sidebarPanel(
    	h5("Skole"),
    	tags$div(class="multicol", 
    		checkboxGroupInput(inputId="skole",
          label=NULL,
          choiceNames=levels(dat$Skole),
          choiceValues=levels(dat$Skole),
          selected=levels(dat$Skole),
          inline=TRUE
    		)
    	),
      h5("Trinn"),
      checkboxGroupInput(inputId="trinn",
      	label=NULL,
      	choiceNames=levels(dat$Trinn),
      	choiceValues=levels(dat$Trinn),
      	selected=levels(dat$Trinn),
      	inline=TRUE
      ),
      h5("Fødselsmåned"),
      tags$div(class="multicol2", 
        checkboxGroupInput(inputId="mnd",
          label=NULL,
          choiceNames=F.mnd.nam,
          choiceValues=F.mnd.val,
          selected=F.mnd.val,
          inline=FALSE
        )
      ),
    	h5("Velg responsvariabler [1, 61]"),
    	textInput(inputId="spm", 
        label=NULL, 
        value="1, 3:5, 7, 9"
      )
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
       dat$Trinn %in% c(input$trinn) & 
       dat$F.mnd %in% c(input$mnd),
       spm, drop=FALSE]
    
    barplot(prop.table(table(unlist(sel))), density=20, col="grey95", space=2/3)
    
#    plot(unlist(dat[1:input$num, spm]))
  })
}

shinyApp(ui = ui, server = server)