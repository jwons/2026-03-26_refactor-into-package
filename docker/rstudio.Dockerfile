FROM rocker/rstudio:4.4.2

RUN R -e "install.packages(c('testthat', 'dplyr'), repos='https://cloud.r-project.org')"

WORKDIR /project