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
          tags$div(class="topmar", h5("Skole")),
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
        ),
        ###
        tabPanel("Utvalg 3",
          tags$div(class="topmar", h5("Skole")),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="skole3",
              label=NULL,
              choiceNames=levels(dat$Skole),
              choiceValues=levels(dat$Skole),
              selected=levels(dat$Skole),
              inline=FALSE
            )
          ),
          h5("Trinn"),
          checkboxGroupInput(inputId="trinn3",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse3",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn3",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år3",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd3",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm3", 
            label=NULL, 
            value="1, 3:5, 7, 9"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        ),
        ###
        tabPanel("Utvalg 4",
          tags$div(class="topmar", h5("Skole")),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="skole4",
              label=NULL,
              choiceNames=levels(dat$Skole),
              choiceValues=levels(dat$Skole),
              selected=levels(dat$Skole),
              inline=FALSE
            )
          ),
          h5("Trinn"),
          checkboxGroupInput(inputId="trinn4",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse4",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn4",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år4",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd4",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm4", 
            label=NULL, 
            value="1, 3:5, 7, 9"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        ),
        ###
        tabPanel("Utvalg 5",
          tags$div(class="topmar", h5("Skole")),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="skole5",
              label=NULL,
              choiceNames=levels(dat$Skole),
              choiceValues=levels(dat$Skole),
              selected=levels(dat$Skole),
              inline=FALSE
            )
          ),
          h5("Trinn"),
          checkboxGroupInput(inputId="trinn5",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse5",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn5",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år5",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd5",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm5", 
            label=NULL, 
            value="1, 3:5, 7, 9"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        ),
        ###
        tabPanel("Utvalg 6",
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
          checkboxGroupInput(inputId="trinn6",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse6",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn6",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år6",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd6",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm6", 
            label=NULL, 
            value="1, 3:5, 7, 9"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        ),
        ###
        tabPanel("Utvalg 7",
          tags$div(class="topmar", h5("Skole")),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="skole7",
              label=NULL,
              choiceNames=levels(dat$Skole),
              choiceValues=levels(dat$Skole),
              selected=levels(dat$Skole),
              inline=FALSE
            )
          ),
          h5("Trinn"),
          checkboxGroupInput(inputId="trinn7",
            label=NULL,
            choiceNames=levels(dat$Trinn),
            choiceValues=levels(dat$Trinn),
            selected=levels(dat$Trinn),
            inline=TRUE
          ),
          h5("Klasse"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="klasse7",
              label=NULL,
              choiceNames=levels(dat$Klasse),
              choiceValues=levels(dat$Klasse),
              selected=levels(dat$Klasse),
              inline=FALSE
            )
          ),
          h5("Kjønn"),
          checkboxGroupInput(inputId="kjønn7",
            label=NULL,
            choiceNames=nam(dat$Kj),
            choiceValues=val(dat$Kj),
            selected=val(dat$Kj),
            inline=TRUE
          ),
          h5("Fødselsår"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="år7",
              label=NULL,
              choiceNames=nam(dat$F.aar),
              choiceValues=val(dat$F.aar),
              selected=val(dat$F.aar),
              inline=FALSE
            )
          ),
          h5("Fødselsmåned"),
          tags$div(class="multicol", 
            checkboxGroupInput(inputId="mnd7",
              label=NULL,
              choiceNames=nam(dat$F.mnd),
              choiceValues=val(dat$F.mnd),
              selected=val(dat$F.mnd),
              inline=FALSE
            )
          ),
          h5("Velg responsvariabler [1, 61]"),
          textInput(inputId="spm7", 
            label=NULL, 
            value="1, 3:5, 7, 9"
          ),
          helpText(a("Source", href="https://github.com/AkselA/R-Shiny-bioint"))
        ),
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

    # utvalg 3
    z <- paste0("c(", input$spm3, ")")
    z <- eval(parse(text=z))
    spm3 <- paste0("X", z)
    sel3 <- dat[
      dat$Skole %in% c(input$skole3) & 
      dat$Trinn %in% c(input$trinn3) & 
      dat$Klasse %in% c(input$klasse3) & 
      dat$Kj %in% c(input$kjønn3) & 
      dat$F.aar %in% c(input$år3) & 
      dat$F.mnd %in% c(input$mnd3),
      spm3, drop=FALSE]
    
    n3 <- nrow(sel3)
    sel3 <- prop.table(table(unlist(sel3)))

    # utvalg 4
    z <- paste0("c(", input$spm4, ")")
    z <- eval(parse(text=z))
    spm4 <- paste0("X", z)
    sel4 <- dat[
      dat$Skole %in% c(input$skole4) & 
      dat$Trinn %in% c(input$trinn4) & 
      dat$Klasse %in% c(input$klasse4) & 
      dat$Kj %in% c(input$kjønn4) & 
      dat$F.aar %in% c(input$år4) & 
      dat$F.mnd %in% c(input$mnd4),
      spm4, drop=FALSE]
    
    n4 <- nrow(sel4)
    sel4 <- prop.table(table(unlist(sel4)))

    # utvalg 5
    z <- paste0("c(", input$spm5, ")")
    z <- eval(parse(text=z))
    spm5 <- paste0("X", z)
    sel5 <- dat[
      dat$Skole %in% c(input$skole5) & 
      dat$Trinn %in% c(input$trinn5) & 
      dat$Klasse %in% c(input$klasse5) & 
      dat$Kj %in% c(input$kjønn5) & 
      dat$F.aar %in% c(input$år5) & 
      dat$F.mnd %in% c(input$mnd5),
      spm5, drop=FALSE]
    
    n5 <- nrow(sel5)
    sel5 <- prop.table(table(unlist(sel5)))

    # utvalg 6
    z <- paste0("c(", input$spm6, ")")
    z <- eval(parse(text=z))
    spm6 <- paste0("X", z)
    sel6 <- dat[
      dat$Skole %in% c(input$skole6) & 
      dat$Trinn %in% c(input$trinn6) & 
      dat$Klasse %in% c(input$klasse6) & 
      dat$Kj %in% c(input$kjønn6) & 
      dat$F.aar %in% c(input$år6) & 
      dat$F.mnd %in% c(input$mnd6),
      spm3, drop=FALSE]
    
    n6 <- nrow(sel6)
    sel6 <- prop.table(table(unlist(sel6)))

    # utvalg 7
    z <- paste0("c(", input$spm7, ")")
    z <- eval(parse(text=z))
    spm7 <- paste0("X", z)
    sel7 <- dat[
      dat$Skole %in% c(input$skole7) & 
      dat$Trinn %in% c(input$trinn7) & 
      dat$Klasse %in% c(input$klasse7) & 
      dat$Kj %in% c(input$kjønn7) & 
      dat$F.aar %in% c(input$år7) & 
      dat$F.mnd %in% c(input$mnd7),
      spm7, drop=FALSE]
    
    n7 <- nrow(sel7)
    sel7 <- prop.table(table(unlist(sel7)))


    tab <- rbind(sel1, sel2, sel3, sel4, sel5, sel6, sel7)
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
