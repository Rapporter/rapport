#### Input Specifications


Apart from apparently required R skills, you have to get familiar with _rapport_ input specifications. _rapport_ call requires a dataset and template inputs (though they are optional). In most cases, _inputs_ refer to variable names in provided dataset, but some inputs have special meaning inside `rapport`, and some of them don't have anything to do with provided dataset whatsoever.

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
