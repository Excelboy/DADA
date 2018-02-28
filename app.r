# setwd("~/Documents/R/shiny/bioint")
library(shiny)

dat <- readRDS("supp/bioint.rds")

val <- function(lev) {
	lev <- levels(lev)
	lev <- lev[c(which(lev != 0), which(lev == 0))]
	lev
}

nam <- function(lev) {
	lev <- levels(lev)
	lev <- lev[c(which(lev != 0), which(lev == 0))]
	lev[lev == 0] <- "NA"
	lev
}

ui <- fluidPage(
  includeCSS("supp/styles.css"),
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
          inline=FALSE
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
      h5("Klasse"),
      tags$div(class="multicol", 
        checkboxGroupInput(inputId="klasse",
          label=NULL,
          choiceNames=levels(dat$Klasse),
          choiceValues=levels(dat$Klasse),
          selected=levels(dat$Klasse),
          inline=FALSE
        )
      ),
      h5("Kjønn"),
      checkboxGroupInput(inputId="kjønn",
        label=NULL,
        choiceNames=nam(dat$Kj),
        choiceValues=val(dat$Kj),
        selected=val(dat$Kj),
        inline=TRUE
      ),
      h5("Fødselsår"),
      tags$div(class="multicol", 
        checkboxGroupInput(inputId="år",
          label=NULL,
          choiceNames=nam(dat$F.aar),
          choiceValues=val(dat$F.aar),
          selected=val(dat$F.aar),
          inline=FALSE
        )
      ),
      h5("Fødselsmåned"),
      tags$div(class="multicol", 
        checkboxGroupInput(inputId="mnd",
          label=NULL,
          choiceNames=nam(dat$F.mnd),
          choiceValues=val(dat$F.mnd),
          selected=val(dat$F.mnd),
          inline=FALSE
        )
      ),
      h5("Velg responsvariabler [1, 61]"),
      textInput(inputId="spm", 
        label=NULL, 
        value="1, 3:5, 7, 9"
      ),
      textOutput("txt")
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
      dat$Klasse %in% c(input$klasse) & 
      dat$Kj %in% c(input$kjønn) & 
      dat$F.aar %in% c(input$år) & 
      dat$F.mnd %in% c(input$mnd),
      spm, drop=FALSE]
    
    barplot(prop.table(table(unlist(sel))), density=20, col="grey95", space=2/3)
    
  })
  output$txt <- renderPrint({
    print("…")
  })
}
 
shinyApp(ui = ui, server = server)

