# PersonalFinanceExplorer

This project is a work in progress. I would be more than happy to have suggested improvements or even better, code contributions!

![Preview (non-interactive) of the shiny report](Report/PREVIEW-MyFinances-summaryreport.pdf)

# Setting up

On the Rmd file, you should be able to set the path the absolute project directory. Edit the following line(s).

```{r}
ROOT = "/path/to/PersonalFinanceExplorer"
```

Also, in order to not exclude the categories mentioned (or to exclude other categories, edit this line:

```{r}
`CategoriesToExclude <- c("Reimbursed", "Miscellaneous")`
```

## Installation

I assume that you already have conda installed in your system. If not, install [miniconda](https://docs.conda.io/en/latest/miniconda.html) (or anaconda if you have lots of storage space on your system) as described on their webpage. For more detailed instructions feel free to search for something like "How to install conda on {-your OS-}" on your favourite seach engine.

The commands to use for setting up will work on linux and mac systems. For windows, you will have to look for equivalent commands on the terminal. You could also open the R-markdown file on [R studio](https://www.rstudio.com/products/rstudio/download/) and use R studio to make the shiny report.

Make sure that you are on this project directory while running everything.

Using the provided yaml file, to install required packages (from the terminal).

The yaml file uses "rmd-shiny-env" as the name for the environment. If you do not want this, please edit the yaml file.

```{bash}
conda env create -f Report/Analyse_finances.yml
conda activate rmd-shiny-env
```

# Running shiny

From the project directory run the following:

```{bash}
conda activate rmd-shiny-env
R -e "rmarkdown::run('Report/Analyse_finances.Rmd')"
```
This should get shiny to run the script and print at the end a message that looks like

```
Listening on http://127.0.0.1:4320
```

The numbers might be different each instance.

Now, copy `http://xxx.x.x.x:xxxx` and paste it in your favourite browser. This should render the report!