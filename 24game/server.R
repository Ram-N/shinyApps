library(shiny)

df <- read.csv("24cards.csv", stringsAsFactors = FALSE)
iv <- df$filename
tn <- 0 
mn <- 0
sol <- df$Solution
hints <- df$Hint
num_images <- length(iv)

m3 <- subset(df, Use_3==1)
m3images <- m3$filename
num3_images <- length(m3images)
sol3 <- m3$Solution
hints3 <- m3$Hint

function(input, output) {

  values <- reactiveValues()
  
  observe({
    input$hintbutton
    values$showHint = TRUE
    values$showSolution = FALSE
  })
  
  observe({
    input$solbutton
    values$showHint = TRUE
    values$showSolution = TRUE
  })

    observe({
    input$button1
    values$showHint = FALSE
    values$showSolution = FALSE
  })
  
    output$timer <- renderImage({
      input$button1
      return(list(
        contentType = 'image/gif',
        src = "images/countdown.gif",
        height=100
      ))
    }, deleteFile = FALSE)
    
    
    output$stext <- renderText({
      if (values$showSolution){
        sol[n]
      }
    })
    output$stextw1 <- renderText({
      if (values$showSolution){
        sol[tn]
      }
    })
    output$stextw2 <- renderText({
      if (values$showSolution){
        sol[tn+1]
      }
    })
    
    output$hint <- renderText({
      if (values$showHint){
        hints[n]
      }
    })

    output$hintw1 <- renderText({
      if (values$showHint){
        hints[tn]
      }
    })
    output$hintw2 <- renderText({
      if (values$showHint){
        hints[tn+1]
      }
    })
    
  output$image <- renderImage({
    input$button1
    n <<- sample(num_images,1)
    return(list(
      src = paste0("images/", iv[n])
      , height = 200)
    )
  }, deleteFile = FALSE)

  output$twin1 <- renderImage({
    input$button1
    tn <<- sample(num_images,1)
    return(list(
      src = paste0("images/", iv[tn])
      , height = 200)
    )
  }, deleteFile = FALSE)
  
  output$twin2 <- renderImage({
    input$button1
    return(list(
      src = paste0("images/", iv[tn+1])
      , height = 200)
    )
  }, deleteFile = FALSE)
  
#######
  output$stextuse3 <- renderText({
    if (values$showSolution){
      sol3[mn]
    }
  })
  
  output$hintuse3 <- renderText({
    if (values$showHint){
      hints3[mn]
    }
  })
  output$use3 <- renderImage({
    input$button1
    mn <<- sample(num3_images,1)
    return(list(
      src = paste0("images/", m3images[mn])
      , height = 200)
    )
  }, deleteFile = FALSE)
  
    
}




