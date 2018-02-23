library(shiny)

extra.style <- tagList(
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
          div.checkbox {
            margin-top: 0px;
            margin-bottom: 5px;
          }
          .multicol { 
            height: 50px;
            margin-bottom: 0px;
            -webkit-column-count: 4; /* Chrome, Safari, Opera */ 
            -moz-column-count: 4;    /* Firefox */ 
            column-count: 4; 
            -moz-column-fill: balance;
            -column-fill: balance;
          } 
          .multicol2 { 
            height: 100px;
            -webkit-column-count: 4; /* Chrome, Safari, Opera */ 
            -moz-column-count: 4;    /* Firefox */ 
            column-count: 4; 
            -moz-column-fill: auto;
            -column-fill: auto;
          } 
          "
      )
    ) 
  )
)
