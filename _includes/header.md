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

Some fields are not required by the template. However, you should reconsider including them in the template, so that the other users could get a better impression of what your template does. Currently supported fields are:

- **Email** - author's email address
- **Packages** - a comma-separated list of packages required by the template
- **Data required** - does template require a dataset (accepts TRUE or FALSE, defaults to FALSE)
- **Example** - newline-separated example calls to `rapport` function, including template data and inputs
- **Strict** - return only last warning per chunk (accepts TRUE or FALSE, defaults to FALSE)

#### Input Specifications

Apart from _template metadata_, header also requires specification for template _inputs_. In most cases, _inputs_ refer to variable names in provided dataset, but some inputs have special meaning inside `rapport`, and some of them don't have anything to do with provided dataset whatsoever.

However, most _inputs_ are compatible with eponymous _R_ modes: _character_, _complex_, _logical_, _numeric_, or R classes like _factor_. Some are used as "wildcards", like _variable_, and some do not refer to dataset variables, such as: _logical_, _number_, _string_ and _option_. Here we'll discuss each input type in detail.

Let's start with dummy input specification:

```
a    | numeric[1,6] | Numeric variable | A set of up to 6 numeric variables
b    | factor       | Factor variable  | A factor variable
c    | variable     | A variable       | Variable of any type
d    | a,b,c,d,e    | Option input     | A list of options
e    | TRUE         | Boolean input    | A boolean input
f    | number=3     | Number input     | A number input with default value
g    | string[2]    | String input     | A string input (requires exactly 2 strings)
```

###### Standard Inputs

These input types match vectors in a dataset with following modes: _character_, _complex_, _logical_, _numeric_. If you define an input with these options, they will check if 
