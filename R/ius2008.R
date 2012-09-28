#' Internet Usage Survey
#'
#' This dataset contains data gathered in a survey of Internet usage in Serbian population in the period from April to May 2008. During 90-day period, there were gathered 709 valid responses via on-line distributed questionnaire.
#'
#' However, this dataset does not contain the original data, as some random noise is added afterwards, in order to demonstrate functionality of \emph{rapport} helpers.
#'
#' Dataset variables can be divided into 3 sets: \emph{demographic data}, \emph{Internet usage aspects} and \emph{application usage/content preference}.
#'
#' \strong{Demographic variables}
#'
#' \itemize{
#'     \item \emph{gender} - respondent's gender (factor with 2 levels: "male" and "female")
#'     \item \emph{age} - respondent's age
#'     \item \emph{dwell} - dwelling (factor with 3 levels: "village", "small town" and "city")
#'     \item \emph{student} - is respondent a student? (factor with 2 levels: "no" and "yes")
#'     \item \emph{partner} - partnership status (factor with 3 levels: "single", "in a relationship" and "married")
#' }
#'
#' \strong{Internet usage aspects}
#'
#' Following variables depict various aspects of Internet usage:
#' \itemize{
#'     \item \emph{edu} - time spent on-line in educational purposes (expressed in hours)
#'     \item \emph{leisure} - time spent on-line in leisure time (expressed in hours)
#'     \item \emph{net.required} - is Internet access required for your profession? (factor with 5 levels: "never", "rarely", "sometimes", "often" and "always")
#'     \item \emph{net.pay} - who pays for Internet access? (factor with 5 levels: "parents", "school/faculty", "employer", "self-funded" and "other")
#'     \item \emph{net.use} - how long is respondent using Internet? (ordered factor with 7 levels, ranging from "less than 6 months" to "more than 5 years")
#' }
#'
#' \strong{Application usage and on-line content preference}
#'
#' These variables include data on the use of Internet applications and content available on the Internet. Practically, they contain responses from a set of 8 questions on a five-point Likert scale.
#' \itemize{
#'     \item \emph{chatim} - usage of chat and/or instant messaging applications
#'     \item \emph{game} - usage of on-line games
#'     \item \emph{surf} - frequency of web-surfing
#'     \item \emph{email} - usage of e-mail applications
#'     \item \emph{download} - frequency of file downloading
#'     \item \emph{forum} - attendance at web-forums
#'     \item \emph{socnet} - usage of social networking services
#'     \item \emph{xxx} - traffic to pornographic websites
#' }
#' @name ius2008
#' @docType data
#' @author Aleksandar Blagotic \email{aca.blagotic@@gmail.com}
#' @author Dusan Vuckovic \email{sylphs21125@@gmail.com}
#' @examples \dontrun{
#' rapport("example", ius2008, var = "it.leisure")
#' }
NULL
