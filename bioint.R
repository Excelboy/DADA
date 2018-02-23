setwd("~/Documents/R/shiny/bioint")
library(shiny)

dat <- readRDS("data/bioint.rds")

ui <- fluidPage(
	# modifisere checkbox-layout slik at det ser litt penere ut
  tags$head(
	  tags$style(
		  HTML(
				"
        .checkbox-inline { 
				  margin-left: 0px;
				  margin-right: 10px;
				}
				.checkbox-inline+.checkbox-inline {
				  margin-left: 0px;
				  margin-right: 10px;
				}
				"
			)
		) 
	),
	titlePanel("Responser fra NOU: \"Interesse for biologifagene\""),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(inputId="skole",
        label="Skole",
        choiceNames=levels(dat$Skole),
        choiceValues=levels(dat$Skole),
        selected=levels(dat$Skole),
        inline=TRUE
      ),
      checkboxGroupInput(inputId="trinn",
      	label="Trinn",
      	choiceNames=levels(dat$Trinn),
      	choiceValues=levels(dat$Trinn),
      	selected=levels(dat$Trinn),
      	inline=TRUE
      ),
      checkboxGroupInput(inputId="mnd",
        label="Fødselsmåned",
        choiceNames=levels(dat$F.mnd),
        choiceValues=levels(dat$F.mnd),
        selected=levels(dat$F.mnd),
        inline=TRUE
      ),
      textInput(inputId="spm", 
        label="Velg responsvariabler [1, 67]", 
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