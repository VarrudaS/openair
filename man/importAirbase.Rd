% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importAirbase.R
\name{importAirbase}
\alias{importAirbase}
\title{Import hourly data from the European Environment Agency airbase database}
\usage{
importAirbase(site = "gb0620a", year = 1969:2012, pollutant = NA,
  add = c("country", "site.type"), splice = FALSE, local = NA)
}
\arguments{
\item{site}{Site code(s) of the sites to be imported. Can be upper or lower case.}

\item{year}{The year or years of interest. For example to select
2010 to 2012 use \code{year = 2010:2012}.}

\item{pollutant}{The pollutant(s) to be selected. See the list in
\code{airbaseStats}.}

\item{add}{Additional fields to add to the returned data frame. By
default the country and site type are returned. Other useful options
include \dQuote{city}, \dQuote{site} (site name),
\dQuote{EMEP_station}, \dQuote{lat}, \dQuote{lon} and \dQuote{altitude}.}

\item{splice}{Should the pollutant fields be consolidated when
multiple measurements of individual pollutants are available? See
\code{airbaseSplice} for details.}

\item{local}{Used for tesing local imports.}
}
\value{
Returns an hourly data frame with POSIXct date, EEA site
code and each individual species.
}
\description{
Import European Environment Agency airbase hourly air quality data
}
\details{
The European Environment Agency (EEA) makes available hourly air
pollution data from across Europe (see
\url{http://acm.eionet.europa.eu/databases/airbase/}). The EEA go
to great lengths to compile, check and make available a huge
amount of air quality data. The EEA provide a range of interactive
maps and make all data available as csv files. These csv files are
split by country and can be very large.

The aim of the \code{importAirbase} function is to provide an
alternative and hopefully complementary approach to accessing
airbase data with a specific focus on integration with R and the
openair package.

Similar to other import functions in openair (see links), the
\code{importAirbase} function works with sites and combines all
species into one data frame. Rather than having year-specific
files there is only one file (data frame) per site covering all
years.

There are many potential issues that need to be dealt with,
although for the most part everything should be compiled in a
straightforward way. One of the key issues is the use of different
instrument techniques measuring the same species at a site, or an
instrument that was replaced at some point. The EEA usefully
record this information. Rather than attempt to combine several
potential time series for the same pollutant, they have been kept
separate. Examples include these use of different methods to
measure PM10 e.g. TEOM and FDMS. Because different instruments can
provide very different concentrations it is probably wise to keep
them separate and analyse them as separate species. In other cases
e.g. ozone or NO2, if an instrument was replaced half way through
a time series it would be reasonable to combine the time series
into a single set. There is a function \code{airbaseSplice} that
will combine pollutants once imported using \code{importAirbase}.

NOTE! This function should be considered as provisional and the
author would appreciate any feedback on its use.
}
\author{
David Carslaw
}
\seealso{
\code{\link{airbaseSplice}},
\code{\link{airbaseFindCode}}, \code{\link{airbaseStats}}, \code{\link{airbaseInfo}}
}

