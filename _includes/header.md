### Input Header

We have already mentioned that_rapport_ syntax uses _pandoc_ conventions with some extra features. In order to define a valid _rapport_ template, you'll have to specify some info in a distinct place called _template header_. Basically, it's nothing more than _HTML_ comment with template-specific data. _Template header_ consists of two parts: template _metadata_ and _input specifications_. Here we'll discuss both parts in detail.

#### Template Metadata

This part of template header consists of several _Key: value_ pairs, which define some basic template info, such as _Title_, _Example_, _Strict_, etc. If you're familiar with package development in R, you'll probably find this approach very similar to `DESCRIPTION` file.

##### Mandatory Fields

The following fields must be specified in the template header (their size limits are specified in round brackets):

- **Title** - a template title (500 characters)
- **Author** - author's (nick)name (100 characters)
- **Description** - template description (5000 characters)

##### Optional Fields

Some fields are not required by the template. However, you should reconsider including them in the template, so that the other users could get a better impression of what your template does. These are currently supported fields (default values are within round brackets):

- **Email** - author's email address (`NULL`)
- **Packages** - a comma-separated list of packages required by the template (`NA`)
- **Data required** - is dataset required by a template? Field accepts TRUE or FALSE, and defaults to `FALSE`.
- **Example** - newline-separated example calls to `rapport` function, including template data and inputs (`NULL`)
- **Strict** - _strict mode_ returns only the last warning from a chunk. Field accepts `TRUE` or `FALSE`, and defaults to `FALSE`.

#### Input Specifications

Apart from _template metadata_, header also requires specification for template _inputs_. In most cases, _inputs_ refer to variable names in provided dataset, but some inputs have special meaning inside `rapport`, and some of them don't have anything to do with provided dataset whatsoever. Most inputs can contain limit specification, and some inputs can also have a default value. At first we'll explain input specifications on the fly, and in following sections we'll discuss each part in thorough details. Let's start with a single dummy input specification:

```
*foo.bar | numeric[1,6] | Numeric variable | A set of up to 6 numeric variables
```

As you can see, it contains four distinct blocks delimited with `|` (pipe) character. Parser first trims all whitespaces from both ends, and extracts the value from a given block. The first block is reserved for input name (`*` indicates a required input), second block holds input type specification (in this case, with input limits), while third and fourth block contain label and description, respectively.

##### Required Inputs

Asterisk sign (`*`) in front of an input name indicates a mandatory input. So it is possible to omit input (unless it's required, of course), but you may want to use this feature carefully, as you may end up with ugly output. If an input isn't mandatory, NULL is assigned to provided input name, and the object is stored in transient evaluation environment.

##### Input Name

_rapport_ has its own naming conventions which are compatible, but different from traditional **R** naming conventions. Input name ("foo.bar" in previous example) must start with an alphabet letter, followed either by other alphabet letters or numbers, separated with `_` or `.`. For example, valid names are: `foo.bar`, `f00_bar`, or `Fo0_bar.input`. Input name length is limited on 30 characters by default. At any time you can check your desired input name with `check.name` function. Note that input names are case-sensitive, just like `symbol`s in **R**.

##### Input Type

_Input type_ is specified in the second input block. It is the most (read: "only") complex field in an input specification. It consists of _type specification_, _limit specification_ and sometimes a _default value specification_. Most input types are compatible with eponymous **R** modes: _character_, _complex_, _logical_, _numeric_, or **R** classes like _factor_. Some are used as "wildcards", like _variable_, and some do not refer to dataset variables at all: _boolean_, _number_, _string_ and _option_. Here we'll discuss each input type thoroughly. We will use term _variable_ to denote a vector taken from a dataset (for more details see documentation for `is.variable`). All inputs can be divided into two groups, depending on whether they require a dataset or not:

- **dataset inputs**
  - **character** - matches a character variable
  - **complex** - matches a complex variable
  - **numeric** - matches a numeric variable
  - **logical** - matches a logical variable
  - **numeric** -matches a numeric variable
  - **factor** - matches a factor variable (i.e. R object of *factor* class)
  - **variable** - matches any variable of previously defined types
- **standalone inputs**:
  - **string** - accepts a character vector
  - **number** - accepts a numeric vector
  - **boolean** - accepts a logical value
  - **option** - accepts a comma-separated list of values, that are to be matched with `match.arg`. The first value in a list is a default one.

Now we'll make a little digression and talk about **input limits**. You may have noticed some additional stuff in type specification, e.g. `numeric[1,6]`. All dataset inputs, as well as *string* and *numeric standalone inputs* can contain _limit specifications_. If you want to bundle several variables from dataset or provide a vector with several string/numeric values, you can apply some rules within square brackets in `[a,b]` format, where `[a,b]` stands for "from `a` to `b` inputs", e.g. `[1,6]` means "from 1 to 6 inputs". Limit specifications can be left out, but even in that case implicit limit rules are applied, with `a` and `b` being set to 1.

**Dataset inputs** will match one or more variables from a dataset (d'uh), and check its mode and/or class. `variable` type is a bit different, since it matches any kind of variable (not to confuse with `Any` type), but it still refers to variable(s) from a provided dataset. Dataset inputs cannot have default value, but can be optional (just leave out `*` sign in front of input name).

**Standalone inputs** are a bit different since they do not refer to any varible from a dataset. However, they are more complex than *dataset inputs*, especially because they can contain default values.

- **number** and **string** inputs are defined with `number` and `string` declaration, respectively. They can also contain limit specifications, e.g. `number[1,6]` accepts numeric vector with at least 1 and at most 6 elements. Of course, you can pass the same specification to string inputs: `string[1,6]`. In this case, you're setting length limits to a character vector. _number_ and _string_ inputs can have **default value**, which can be defined by placing `=` after type/limit specification followed by default value. For instance, `number[1,6]=3.14` sets value `3.14` as default. Same stands for string inputs: default value can be defined in the same manner: `string=foo` sets "foo" as default string value (note that you don't have to specify quotes unless they are the part of the default string).
- **boolean** inputs can contain either `TRUE` or `FALSE` values. The specified value is the default one. They cannot contain limit specification.
- **option** inputs are nothing more than a comma-separated list of strings. Even if you specify numbers in a list, they will be coerced to strings once the list is parsed. Values in _option_ list will be placed in a character vector, and matched with `match.arg` function. That means that you could only choose one value from a list. Partial matches are allowed, and the first value in _option_ list is the defalt one.
