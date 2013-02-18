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
<<<<<<< HEAD
  \strong{Input Specifications}

  Apart from \emph{template metadata}, header also requires
  specification for template \emph{inputs}. In most cases,
  \emph{inputs} refer to variable names in provided
  dataset, but some inputs have special meaning inside
  \code{rapport}, and some of them don't have anything to
  do with provided dataset whatsoever. Most inputs can
  contain limit specification, and some inputs can also
  have a default value. At first we'll explain input
  specifications on the fly, and in following sections
  we'll discuss each part in thorough details. Let's start
  with a single dummy input specification:

  \code{*foo.bar | numeric[1,6] | Numeric variable | A set
  of up to 6 numeric variables}

  \strong{Required Inputs}

  Asterisk sign (\code{*}) in front of an input name
  indicates a mandatory input. So it is possible to omit
  input (unless it's required, of course), but you may want
  to use this feature carefully, as you may end up with
  ugly output. If an input isn't mandatory,\code{NULL}is
  assigned to provided input name, and the object is stored
  in transient evaluation environment.

  \strong{Input Name}

  \emph{rapport} has its own naming conventions which are
  compatible, but different from traditional \strong{R}
  naming conventions. Input name ("foo.bar" in previous
  example) must start with an alphabet letter, followed
  either by other alphabet letters or numbers, separated
  with \code{_} or \code{.}. For example, valid names are:
  \code{foo.bar}, \code{f00_bar}, or \code{Fo0_bar.input}.
  Input name length is limited on 30 characters by default.
  At any time you can check your desired input name with
  \code{check.name} function. Note that input names are
  case-sensitive, just like \code{symbol}s in \strong{R}.

  \strong{Input Type}

  \emph{Input type} is specified in the second input block.
  It is the most (read: "only") complex field in an input
  specification. It consists of \emph{type specification},
  \emph{limit specification} and sometimes a \emph{default
  value specification}. Most input types are compatible
  with eponymous \strong{R} modes: \emph{character},
  \emph{complex}, \emph{logical}, \emph{numeric}, or
  \strong{R} classes like \emph{factor}. Some are used as
  "wildcards", like \emph{variable}, and some do not refer
  to dataset variables at all: \emph{boolean},
  \emph{number}, \emph{string} and \emph{option}. Here
  we'll discuss each input type thoroughly. We will use
  term \emph{variable} to denote a vector taken from a
  dataset (for more details see documentation for
  \code{is.variable}). All inputs can be divided into two
  groups, depending on whether they require a dataset or
  not:

  \itemize{ \item \strong{dataset inputs}: \itemize{ \item
  \emph{character} - matches a character variable \item
  \emph{complex} - matches a character variable \item
  \emph{numeric} - matches a numeric variable \item
  \emph{factor} - matches a factor variable (i.e. R object
  of \code{factor} class) \item \emph{variable} - matches
  any variable of previously defined types } \item
  \strong{standalone inputs}: \itemize{ \item \emph{string}
  - accepts an atomic character vector \item \emph{number}
  - accepts an atomic numeric vector \item \emph{boolean} -
  accepts a logical value \item \emph{option} - accepts a
  comma-separated list of values, that are to be matched
  with \code{\link{match.arg}}. The first value in a list
  is the default one.  } }

  Now we'll make a little digression and talk about
  \strong{input limits}. You may have noticed some
  additional stuff in type specification, e.g.
  \code{numeric[1,6]}. All dataset inputs, as well as
  *string* and *numeric standalone inputs* can contain
  \emph{limit specifications}. If you want to bundle
  several variables from dataset or provide a vector with
  several string/numeric values, you can apply some rules
  within square brackets in \code{[a,b]} format, where
  \code{[a,b]} stands for "from \code{a} to \code{b}
  inputs", e.g. \code{[1,6]} means "from 1 to 6 inputs".
  Limit specifications can be left out, but even in that
  case implicit limit rules are applied - for variables, as
  well as boolean and option inputs it's \code{[1,1]}, for
  strings \code{[1,256]} and for number inputs
  \code{[-Inf,Inf]}.

  \strong{Dataset inputs} will match one or more variables
  from a dataset, and check its mode and/or class.
  \code{variable} type is a bit different, since it matches
  any kind of variable (not to confuse with \code{Any}
  type), but it still refers to variable(s) from a provided
  dataset. Dataset inputs cannot have default value, but
  can be optional (just leave out \code{*} sign in front of
  input name). Note that if you provide more than one
  variable name in \code{rapport} function call, that input
  will be stored as a \code{data.frame}, otherwise, it will
  be stored as a \emph{variable} (atomic vector).

  \strong{Standalone inputs} are a bit different since they
  do not refer to any variables from a dataset. However,
  they are more complex than *dataset inputs*, especially
  because they can contain default values. \itemize{ \item
  \strong{number} and \strong{string} inputs are defined
  with \code{number} and \code{string} respectively. They
  can also contain limit specifications, but the limits are
  treated in a slightly different manner.
  \code{number[-2.58,3]} will match any number within an
  interval from -2.58 to 3. If the limit specification is
  ommited, an implicit ones are assigned
  (\code{[-Inf,Inf]}. Note that range input specifications
  are required for number inputs (providing only
  \code{number[5]} will throw an error). Limit
  specifications for string inputs define the range of
  characters that provided string can have, e.g.
  \code{string[1,6]} matches the string with at least 1 and
  at most 6 characters. If ommited, limit specifications
  for strings are implicitly set to \code{[1,256]}.
  \emph{number} and \emph{string} inputs can have
  \emph{default value}, which can be defined by placing
  \code{=} after type/limit specification followed by
  default value. For instance, \code{number[1,6]=3.14} sets
  value \code{3.14} as default. Note that for number inputs
  an additional check will be applied to ensure that
  provided default number belongs to an interval defined in
  the limit specification (\code{[1,6]=7} will throw an
  error). For string inputs, the default value
  \code{string=foo} sets "foo" as default string value
  (note that you don't have to specify quotes unless they
  are the part of the default string). Default value will
  be checked to ensure that its length falls within the
  interval provided in the limit specification.  \item
  \strong{boolean} inputs can contain either \code{TRUE} or
  \code{FALSE} values. The specified value is the default
  one. They cannot contain limit specification, but
  implicitly the limits are set to \code{[1,1]}.  \item
  \strong{option} inputs are nothing more than a
  comma-separated list of strings. Even if you specify
  numbers in a list, they will be coerced to strings once
  the list is parsed. Values in \emph{option} list will be
  placed in a character vector, and matched with
  \code{match.arg} function. That means that you could only
  choose one value from a list. Partial matches are
  allowed, and the first value in \emph{option} list is the
  default one. Just like in \code{boolean} inputs, limits
  are implicitly set to \code{[1,1]}. }

  \strong{Input Label and Description}

  Third block in input definition is an input label. While
  \emph{variable} can have its own label (see
  \code{rp.label}), you may want to use the one defined in
  input specifications. At last, fourth block contains
  input description, which should be a lengthy description
  of current input. Note that all the fields in input
  specification are mandatory. You can cheat, though, by
  providing a non-space character (e.g. a dot) as an input
  label and/or description, but please don't do that unless
  you're testing the template. Labels and descriptions are
  meant to be informative.
=======
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
  \code{length: 10}, which is identical to: \code{exactly:
  10} nested within \code{length} attribute. In this case
  input length has to be equal to the provided integer
  value.  \item named list with \code{min} and/or
  \code{max} attributes nested under \code{length}
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
  \code{value} attribute must be provided. In that case,
  \code{value} will contain a set of values that will be
  passed to \code{link{match.arg}} function \code{choices}
  argument. Matching will be performed on the elements of
  user-specified vector, i.e. provided vector will be
  passed to \code{arg} argument. Multiple matches
  \code{several.ok} are allowed, and will be computed based
  on the \code{length} attribute. }

  \emph{numeric}, \emph{integer}

  \itemize{ \item \code{limit} - accepts the same format as
  \code{length} attribute, only that in this case it checks
  input values rather than input length. \code{limit}
  attribute is \code{NULL} by default and checks are
  performed only when \code{limit} is defined. }

  \emph{factor}

  \itemize{ \item \code{nlevels} - accepts the same format
  as \code{length} attribute, but the check is performed
  rather on the number of factor levels.  \item
  \code{matchable} - \emph{ibid} as in character inputs,
  but this time it's the factor levels that get passed to
  \code{arg} argument in \code{\link{match.arg}}. }
>>>>>>> development
}

