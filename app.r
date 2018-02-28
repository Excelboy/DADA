# setwd("~/Documents/R/shiny/bioint")
library(shiny)

dat <- readRDS("supp/bioint.rds")

source("supp/fun.r")

ui <- fluidPage(
  includeCSS("supp/styles.css"),
  titlePanel("Responser fra utgreiinga \"Interesse for biologifaget\""),
  sidebarLayout(
    sidebarPanel(
      tabsetPanel(
        ###
        tabPanel("Utvalg 1",
          tags$div(class="topmar", h5("Skole")),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="skole1",
              label=NULL,
              choiceNames=levels(dat$Skole),
              choiceValues=levels(dat$Skole),
              selected=levels(dat$Skole),
              inline=FALSE
            )
          ),
          h5("Trinn"),
          checkboxGroupInput(inputId="trinn1",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse1",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn1",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år1",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd1",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm1", 
            label=NULL, 
            value="1, 3:5, 7, 9"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        ),
        ###
        tabPanel("Utvalg 2",
          h5("Skole"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="skole2",
              label=NULL,
              choiceNames=levels(dat$Skole),
              choiceValues=levels(dat$Skole),
              selected=levels(dat$Skole),
              inline=FALSE
            )
          ),
          h5("Trinn"),
          checkboxGroupInput(inputId="trinn2",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse2",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn2",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år2",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd2",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm2", 
            label=NULL, 
            value="seq(1, 61, by=2)"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        )
      )
    ),
    mainPanel(
        plotOutput("hist", height="550px")
    )
  )
)

server <- function(input, output) {
  
  output$hist <- renderPlot({
    
    # utvalg 1
    z <- paste0("c(", input$spm1, ")")
    z <- eval(parse(text=z))
    spm1 <- paste0("X", z)
    sel1 <- dat[
      dat$Skole %in% c(input$skole1) & 
      dat$Trinn %in% c(input$trinn1) & 
      dat$Klasse %in% c(input$klasse1) & 
      dat$Kj %in% c(input$kjønn1) & 
      dat$F.aar %in% c(input$år1) & 
      dat$F.mnd %in% c(input$mnd1),
      spm1, drop=FALSE]

    n1 <- nrow(sel1)
    sel1 <- prop.table(table(unlist(sel1)))

    # utvalg 2
    z <- paste0("c(", input$spm2, ")")
    z <- eval(parse(text=z))
    spm2 <- paste0("X", z)
    sel2 <- dat[
      dat$Skole %in% c(input$skole2) & 
      dat$Trinn %in% c(input$trinn2) & 
      dat$Klasse %in% c(input$klasse2) & 
      dat$Kj %in% c(input$kjønn2) & 
      dat$F.aar %in% c(input$år2) & 
      dat$F.mnd %in% c(input$mnd2),
      spm2, drop=FALSE]
    
    n2 <- nrow(sel2)
    sel2 <- prop.table(table(unlist(sel2)))

    tab <- rbind(sel1, sel2)
    colnames(tab) <- c("Uinteressert", "Lite interessert", 
                       "Litt interessert", "Veldig interessert")
    
    par(mgp=c(2.5, 0.8, 0), mar=c(2, 3.8, 4, 1))

    barplot(tab, beside=TRUE, cex.names=1.5, cex.lab=1.5, density=c(15, 10), 
      col=c(1, "#27c93a"), ylab="Relativ frekvens")

    ltext <- c(paste("Utvalg 1: n =", n1), paste("Utvalg 2: n =", n2))
    legend("top", legend=ltext, fill=c(1, "#27c93a"),
      bty="n", cex=1.6, density=c(15, 10), ncol=2, xpd=NA, inset=-0.15)
    
  })
  
  output$link <- renderText("test, test")
}
 
shinyApp(ui = ui, server = server)

