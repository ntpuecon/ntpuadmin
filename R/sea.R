SEA <- function(){
  sea <- new.env()
  sea$initiate = function(){
    sea$session = econWeb::webdriverChromeSession()
    sea$login = login(sea)
  }

  return(sea)
}
attachMenuSubitems <- function(sea,
  submenuItemName){
  # submenuItemName = "成績登錄系統"
  submenuItemId =
    switch(
      submenuItemName,
      "成績登錄系統"="#dm0m2i0it")
  sea$成績相關 <- list()
  sea$成績相關[[submenuItemName]] <- function(){
    sea$session$executeScript(
      glue::glue(htmltools::includeHTML(
        system.file("extdata/js/menuselect3.js", package="ntpuadmin")),
        .open = "<<", .close=">>"
    ))
  }

}
attachMenuItems <- function(sea){
  sea$成績相關 <- function(){
    sea$session$executeScript(
      htmltools::includeHTML(
        system.file("extdata/js/menuselect2.js", package="ntpuadmin"))
    )
    submenuItemNames=c(
      '成績登錄系統'
    )
    purrr::walk(
      submenuItemNames,
      ~attachMenuSubitems(sea,.x)
    )
  }
}
attachOtherMethods <- function(sea){
  sea$教師功能 <- function(){
    sea$session$executeScript(
      htmltools::includeHTML(
        system.file("extdata/js/menuselect1.js", package="ntpuadmin"))
    )
    attachMenuItems(sea)
  }
  invisible(sea)
}
login = function(sea){
  function(){
  sea$session$start_session()
  sea$session$go("https://sea.cc.ntpu.edu.tw/teacher_new.htm")
  sea$session$waitFor(
    "document.readyState == 'complete'"
  )
  account=sea$session$findElement("body > table > tbody > tr > td:nth-child(1) > table:nth-child(3) > tbody > tr > td.bg7 > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(1) > td > input")
  account$setValue(Sys.getenv("sea_username"))
  pwd = sea$session$findElement("body > table > tbody > tr > td:nth-child(1) > table:nth-child(3) > tbody > tr > td.bg7 > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td > input")
  pwd$setValue(Sys.getenv("sea_password"))
  click = sea$session$findElement("#loginBtn1")
  click$click()


  attachOtherMethods(sea)
  }
}
