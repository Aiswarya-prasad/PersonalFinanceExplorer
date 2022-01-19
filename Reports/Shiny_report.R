# install on conda using accompanying yaml file
# make sure that you have already run the two before
# conda config --add channels new_channel
# for channels bioconda and conda-forge
# use command,
# conda env create -f env.yaml

require(shiny)
require(dplyr)
require(leaflet)
require(DT)
require(xlsx)

################################
# # Filters to implement
################################
# year
# month
# between dates
# days/months/years from given date
# by category
# show sub categories in a sensible way
# on credit card T/F
# by transaction amount
# debits / credits
################################
################################
################################
# # Plots to implement
################################
# Expense vs category
# amount vs time (month/year/quater)
# amount vs time (Salary - to - salary, expanse / savings)
# visualise saving (monthly, yearly...)
################################


ROOT = "/Volumes/Storage/Finance/"

server <- shinyServer(function(input, output) {
  # Import Data and clean it
  all_df <- read.xlsx(paste0(ROOT, "/All_Transactions.xlsx"), 1, header=TRUE)[-1, ]
  cols_to_choose <- c("Booking.date", "Notification.text", "Credit.in.CHF", "Debit.in.CHF", "Balance.in.CHF", "Category", "Sub.category", "Notes")
  all_df <- all_df[, cols_to_choose]

  # all_df_filt <- reactive({metadata_shiny})
  all_df_filt <- reactive({
    all_df
  })

  output$data <-DT::renderDataTable(datatable(
      all_df_filt(),
      extensions = "Scroller",
      filter = c("top")
  ))


})

ui = navbarPage("Metadata map", id="main",
           tabPanel("Raw Data", DT::dataTableOutput("data")),
         )

shinyApp(ui = ui, server = server)
