library(shiny)

fluidPage(
    titlePanel("24 Extreme"),
    sidebarLayout(
      sidebarPanel(
        tags$form(
          actionButton("button1", "Deal")
        )
        , tags$form(
          actionButton("hintbutton", "Hint")
          , actionButton("solbutton", "Final Solution")
          , div(imageOutput(outputId = "timer", width = "50%")
              , style = "height: 100px;")
        )
      ),
      mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Simple", 
                             div(imageOutput("image", height = 300)
                             , textOutput("hint")
                             , textOutput("stext")
                             )),
                    tabPanel("Twins", 
                             imageOutput("twin1", height=250)
                                 , textOutput("hintw1")
                                 , textOutput("stextw1"),
                             imageOutput("twin2", height = 225)
                             , br()
                                 , textOutput("hintw2")
                                 , textOutput("stextw2")
                    ), 
                    tabPanel("Use Only 3", 
                             div(imageOutput("use3", height = 300)
                                 , textOutput("hintuse3")
                                 , textOutput("stextuse3")
                             ))
                    )
      )
    )
  )
