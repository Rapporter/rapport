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
foo.bar | numeric[1,6] | Numeric variable | A set of up to 6 numeric variables
```

As you can see, it contains four distinct blocks delimited with `|` (pipe) character. Parser first trims all whitespaces from both ends, and extracts the value from a given block. The first block is reserved for input name, second block holds input type specification, while third and fourth block contain label and description, respectively.

##### Input Name

_rapport_ has its own naming conventions which are compatible, but different from traditional **R** naming conventions. Input name ("foo.bar" in previous example) must start with an alphabet letter, followed either by other alphabet letters or numbers, separated with `_` or `.`. For example, valid names are: `foo.bar`, `f00_bar`, or `Fo0_bar.input`. Input name length is limited on 30 characters by default. At any time you can check your desired input name with `check.name` function. Note that input names are case-sensitive, just like `symbol`s in **R**.

##### Input Type

_Input type_ is specified in second input block. It is the most (read: "only") complex field in an input specification. It consists of _type specification_, _limit specification_ and sometimes a _default value specification_. Most input types are compatible with eponymous **R** modes: _character_, _complex_, _logical_, _numeric_, or **R** classes like _factor_. Some are used as "wildcards", like _variable_, and some do not refer to dataset variables at all: _boolean_, _number_, _string_ and _option_. Here we'll discuss each input type in detail. We will use term _variable_ to denote a vector from a dataset (for more details see documentation for `is.variable`). All inputs can be divided into two groups, depending on whether they require a dataset or not:

- **dataset inputs**
  - **character** - matches a character variable
  - **complex** - matches a complex variable
  - **numeric** - matches a numeric variable
  - **logical** - matches a logical variable
  - **numeric** -matches a numeric variable
  - **factor** - matches a factor variable (i.e. R object of *factor* class)
  - **variable** - matches any variable of previously defined types
- **standalone inputs**:
  - **string** - accepts a character string
  - **number** - accepts a numeric value
  - **boolean** - accepts a logical value
  - **option** - accepts a comma-separated list of values, that are to be matched with `match.arg`. The first value in a list is a default one.

**Dataset inputs** will match variable from a dataset (d'uh), and check its mode and/or class. _Variable_ type is a bit different, since it matches any kind of variable (not to confuse with `Any` type). Dataset inputs cannot contain default value.

**Standalone inputs** 
<!-- resume from here -->


Let's start with dummy input specifications:

```
a    | numeric[1,6] | Numeric variable | A set of up to 6 numeric variables
b    | factor       | Factor variable  | A factor variable
c    | variable     | A variable       | Variable of any type
d    | a,b,c,d,e    | Option input     | A list of options
e    | TRUE         | Boolean input    | A boolean input
f    | number=3     | Number input     | A number input with default value
g    | string[2]    | String input     | A string input (requires exactly 2 strings)
```
