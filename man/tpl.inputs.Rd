\name{tpl.inputs}
\alias{tpl.inputs}
\title{Template Inputs}
\usage{
  tpl.inputs(fp, use.header = FALSE)
}
\arguments{
  \item{fp}{a template file pointer (see
  \code{\link{tpl.find}} for details)}

  \item{use.header}{a logical value indicating whether the
  header section is provided in \code{h} argument}
}
\description{
  Displays summary for template inputs (if any). Note that
  as of version \code{0.5}, \code{rapport} template inputs
  should be defined using YAML syntax. See
  \code{deprecated-inputs} for details on old input syntax.
  The following sections describe new YAML input definition
  style.
}
\details{
  \strong{Introduction}

  The full power of \code{rapport} comes into play with
  \emph{template inputs}. One can match inputs against
  dataset variables or custom \code{R} objects. The inputs
  provide means of assigning \code{R} objects to
  \code{symbol}s in the template evaluation environment.
  Inputs themselves do not handle only the template names,
  but also provide an extensive set of rules that each
  dataset variable/user-provided \code{R} object has to
  satisfy. The new YAML input specification takes advantage
  of \code{R} class system. The input attributes should
  resemble common \code{R} object attributes and methods.

  Inputs can be divided into two categories:

  \itemize{ \item \emph{dataset inputs}, i.e. the inputs
  that refer to named element of an |code{R} object
  provided in \code{data} argument in \code{rapport} call.
  Currently, \code{rapport} supports only \code{data.frame}
  objects, but that may change in the (near) future.  \item
  \emph{standalone inputs} - the inputs that do not depend
  on the dataset. The user can just provide an \code{R}
  object of an appropriate class (and other input
  attributes) to match a \emph{standalone} input. }

  \strong{General input attributes}

  Following attributes are available for all inputs:

  \itemize{ \item \code{name} (character string, required)
  - input name. It acts as an identifier for a given input,
  and is required as such. Template cannot contain
  duplicate names. \code{rapport} inputs currently have
  custom naming conventions - see
  \code{\link{guess.input.name}} for details.  \item
  \code{label} (character string) - input label. It can be
  blank, but it's useful to provide input label as
  \code{rapport} helpers use that information in plot
  labels and/or exported HTML tables. Defaults to empty
  string.  \item \code{description} (character string) -
  similar to \code{label}, but should contain long
  description of given input.  \item \code{class}
  (character string) - defines an input class. Currently
  supported input classes are: \code{character},
  \code{complex}, \code{factor}, \code{integer},
  \code{logical}, \code{numeric} and \code{raw} (all atomic
  vector classes are supported). Class attribute should
  usually be provided, but it can also be \code{NULL}
  (default) - in that case the input class will be guessed
  based on matched \code{R} object's value.  \item
  \code{required} (logical value) - does the input require
  a value? Defaults to \code{FALSE}.  \item
  \code{standalone} (logical value) - indicates that the
  input depends on a dataset. Defaults to \code{FALSE}.
  \item \code{length} (either an integer value or a named
  list with integer values) - provides a set of rules for
  input value's length. \code{length} attribute can be
  defined via: \itemize{ \item an integer value, e.g.
  \code{length: 10}, which sets restriction to exactly 10
  vectors or values.  \item named list with \code{min}
  and/or \code{max} attributes nested under \code{length}
  attribute. This will define a range of values in which
  input length must must fall. Note that range limits are
  inclusive. Either \code{min} or \code{max} attribute can
  be omitted, and they will default to \code{1} and
  \code{Inf}, respectively.  } \strong{IMPORTANT!} Note
  that \code{rapport} treats input length in a bit
  different manner. If you match a subset of 10 character
  vectors from the dataset, input length will be \code{10},
  as you might expect. But if you select only one variable,
  length will be equal to \code{1}, and not to the number
  of vector elements. This stands both for standalone and
  dataset inputs. However, if you match a character vector
  against a standalone input, length will be stored
  correctly - as the number of vector elements.  \item
  \code{value} (a vector of an appropriate class). This
  attribute only exists for standalone inputs. Provided
  value must satisfy rules defined in \code{class} and
  \code{length} attributes, as well as any other
  class-specific rules (see below). }

  \strong{Class-specific attributes}

  \emph{character}

  \itemize{ \item \code{nchar} - restricts the number of
  characters of the input value. It accepts the same
  attribute format as \code{length}. If \code{NULL}
  (default), no checks will be performed.  \item
  \code{regexp} (character string) - contains a string with
  regular expression. If non-\code{NULL}, all strings in a
  character vector must match the given regular expression.
  Defaults to \code{NULL} - no checks are applied.  \item
  \code{matchable} (logical value) - if \code{TRUE},
  \code{options} attribute must be provided, while
  \code{value} is optional, though recommended.
  \code{options} should contain values to be chosen from,
  just like \code{<option>} tag does when nested in
  \code{<select>} HTML tag, while \code{value} must contain
  a value from \code{options} or it can be omitted
  (\code{NULL}). \code{allow_multiple} will allow values
  from \code{options} list to be matched multiple times.
  Note that unlike previous versions of \code{rapport},
  partial matching is not performed. }

  \emph{numeric}, \emph{integer}

  \itemize{ \item \code{limit} - similar to \code{length}
  attribute, but allows only \code{min} and \code{max}
  nested attributes. Unlike \code{length} attribute,
  \code{limit} checks input values rather than input
  length. \code{limit} attribute is \code{NULL} by default
  and the checks are performed only when \code{limit} is
  defined (non-\code{NULL}). }

  \emph{factor}

  \itemize{ \item \code{nlevels} - accepts the same format
  as \code{length} attribute, but the check is performed
  rather on the number of factor levels.  \item
  \code{matchable} - \emph{ibid} as in character inputs
  (note that in previous versions of \code{rapport}
  matching was performed against factor levels - well, not
  any more, now we match against values to make it
  consistent with \code{character} inputs). }
}

