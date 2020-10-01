# R Package Development: Core --------------------------------------------------
FROM rocker/tidyverse:4.0.2

# Setup ------------------------------------------------------------------------
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    dos2unix \
    libcurl4-openssl-dev \
    libssl-dev \
	libxt-dev \
    libxml2-dev \
    libcairo2-dev \
    libsqlite-dev \
    libmariadbd-dev \
    libmariadbclient-dev \
    libpq-dev \
	libsodium-dev \
    libssh2-1-dev \
    libsasl2-dev \
    unixodbc-dev \
    libsqliteodbc \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure RStudio Server -----------------------------------------------------
ARG R_REPOS=\'https://mran.microsoft.com/snapshot/2020-06-22\'
RUN touch .env .Rprofile
RUN echo "options(repos = ${R_REPOS})" >> .Rprofile
RUN R -q -e "if(!require(remotes)) install.packages('remotes')"
RUN echo "require(remotes)" >> .Rprofile

RUN R -q -e "install_cran('tidyverse', dependencies = TRUE)"
RUN R -q -e "update_packages(upgrade  = 'always')"

RUN R -q -e "install_cran(c('odbc', 'profvis', 'renv'))"
RUN R -q -e "install_cran(c('devtools', 'testthat', 'covr', 'roxygen2'))"
RUN R -q -e "install_cran(('tinytex')); tinytex::install_tinytex()"

# Install Project Dependencies -------------------------------------------------
COPY ./DESCRIPTION ./DESCRIPTION
RUN R -q -e "install_deps(dependencies = 'Depends')"
RUN R -q -e "install_deps(dependencies = 'Imports')"
RUN R -q -e "install_deps(dependencies = 'Suggests')"

# Run RStudio Server -----------------------------------------------------------
ENV HOME /home/rstudio
ENV R_USER /home/rstudio
RUN printenv >> .env
RUN cp .env home/rstudio/.Renviron
RUN chown rstudio:rstudio home/rstudio/
RUN mkdir -p /home/rstudio/.local/share/renv
ENV PASSWORD 1234
ENV ROOT true

# Run Rproject -----------------------------------------------------------------
RUN touch .env .Rprofile
RUN echo "setwd('./rproject')" >> .Rprofile
RUN echo "try(source('.Rprofile'))" >> .Rprofile
RUN cp .Rprofile home/rstudio/.Rprofile
