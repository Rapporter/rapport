Writing a custom _rapport_ template or modifying an existing one is not trickier than writing an ordinary statistical report. It requires some basic **R** skills, and a familiarity with _rapport_ input specifications that we're about to cover thoroughly. Of course, sophisticated reports would require more proficiency in **R**.

#### Input Header

**Recent changes**

As of version 0.50, _rapport_ is using the new header specification that relies solely on YAML syntax. The old syntax is deprecated, though kept in the package for backwards compatibility.

In order to define a valid _rapport_ template, you'll have to specify some info at the beginning of the document, in the so-called _template header_. The header itself is nothing but a YAML syntax placed within custom HTML comment tags: `<!--head` and `head-->`. It consists of metadata and inputs sections defined under `meta` and `inputs` YAML keys, respectively.

##### Template metadata

Template metadata can contain following fields:

 - `title` - template title (**required**)
 - `author` - template author (**required**)
 - `description` - template description (**required**)
 - `email` - email of the author
 - `packages` - list of packages that the template depends on
 - `example` - a list of example `rapport()` calls for the given template.

If you're familiar with the package development in R, you'll probably find this specification similar to the `DESCRIPTION` file. Here's an example of metadata section:

{% highlight yaml %}
meta:
  title: Custom template
  author: John Doe
  description: Just a custom template
  packages:
	- lme4
    - nortest
	- ggplot2
  example:
    - rapport("custom-template", mtcars, x = "wt")
	- rapport("custom-template", mtcars, x = c("mpg", "hp"))
{% endhighlight %}

As you can see, it depends on `lme4`, `nortest` and `ggplot2` packages, and it has 2 example calls to rapport.

#### Template inputs

The template inputs are probably the most important feature of _rapport_. By using the template inputs, you can match a dataset variable or custom **R** object and assign it to a symbol in a template evaluation environment. That way you can use given input's name throughout the template. Since the version 0.50, we wanted to make inputs more familiar to **R** users, so we ditched previous input definition syntax as it was inconsistent with **R** conventions. New input specification relies on **R** class system and resembles all important methods and/or attributes of **R** objects.

Template inputs can be divided into two categories:

 - _dataset inputs_ that hold names of the elements of the object provided in `data` argument in `rapport` function. This usually refers to a vector containing column names of a `data.frame` object, but it can be any **R** object that has named elements.
 - _standalone inputs_ do not depend on the object provided in the `data` argument. They usually accept an **R** object passed by the user, or the value of the `value` attribute provided in the input definition (see below).
 
##### General input attributes

Following options are available for all inputs:

 - `name` (character string, required) - input name. It acts as an identifier for a given input, and is required as such. Template cannot contain duplicate input names. _rapport_ inputs currently have custom naming conventions - see `?guess.input.name` for details.
 - `label` (character string) - input label. It can be blank, but it's useful to provide an input label as _rapport_ helpers use that information in plot labels and/or exported HTML tables. Defaults to empty string.
 - `description` (character string) - similar to `label`, but should contain long(er) description of given input. 
 - `class` (character string) - defines an input class. Currently supported input classes are: `character`, `complex`, `factor`, `integer`, `logical`, `numeric` and `raw` (all atomic vector classes). Class attribute should usually be provided, but it can also be `NULL` (default) - in that case the input class will be guessed based on matched **R** object's value.
 - `required` (logical value) - does an input require a value? Defaults to `FALSE.` 
 - `standalone` (logical value) - indicates that the input depends on a dataset. Defaults to `FALSE` (inputs are standalone).
 - `length` (integer value, or a specific `key: value` pair) - sets restrictions on the matched **R** object's `lenght` attribute. `length` input attribute can be defined in various ways:
    - an integer value, e.g. `length: 10`, which require all R object values to have the length of 10.
    - `exactly` tag - previous example (`length: 10`) will be interpreted as:
    {% highlight yaml %}
    length:
      exactly: 10
    {% endhighlight %}
   
    - `min` and/or `max` tags that define the range within which an input length must fall. Note that the range limits are inclusive - for instance: 
    {% highlight yaml %}
    length:
      min: 2
	  max: 10
    {% endhighlight %}
    will accept all **R** objects with length of at least 2 and at most 10.
    Either `min` or `max` tag can be omitted, and they will default to `1` and `Inf`, respectively. For example:
    {% highlight yaml %}
    length:
      min: 1
    {% endhighlight %}
    is identical to:
    {% highlight yaml %}
    length:
      min: 1
      max: Inf
    {% endhighlight %}
    Similarly,
    {% highlight yaml %}
    length:
      max: 10
    {% endhighlight %}
    is identical to:
    {% highlight yaml %}
    length:
      min: 1
	  max: 10
    {% endhighlight %}
    - if omitted (`NULL`) `length` will default to:
    {% highlight yaml %}
    length:
      exactly: 10
    {% endhighlight %}
   
    It's worth noting that _rapport_ treats input length in a bit different manner. If you match a subset of, e.g. 10 character vectors from the dataset, the input length will be 10, as you might expect. But if you select only one variable, length will be equal to 1, and not equal to the number of vector elements. This stands both for standalone and dataset inputs. However, if you match a character vector against a standalone input, length will be stored correctly - as the number of vector elements. 

 - `value` (vector(s) of an appropriate `class`) - this attribute only exists for standalone inputs. Provided value must satisfy rules defined in `class` and `length` attributes, as well as any other class-specific rules (see below).
 
##### Class-specific attributes

###### `character`

 - `nchar` - restricts the number of characters of the input value. It accepts the same attribute format as `length` attribute. If `NULL` (default), no checks will be performed.
 - `regexp` (character string) - contains a string with regular expression. If non-`NULL`, all strings in the character vector must match the given regular expression. Defaults to `NULL` - no checks are applied.
 - `matchable` (logical value) - if `TRUE`, `value` attribute must be provided. In that case, `value` will contain a vector of character values that will be passed to `match.arg` function `choices` argument. Matching will be performed on the elements of user-specified vector, i.e. provided vector will be passed to `arg` argument. Multiple matches (`several.ok`) are allowed, and will be computed based on the input `length` attribute.

###### `numeric`, `integer`

 - `limit` - accepts the same format as `length` attribute, only that it checks input `value`s rather than input `length`. `limit` attribute is `NULL` by default and checks are performed only when limit is defined.

###### `factor`

 - `nlevels` - accepts the same format as `length` attribute, but the check is performed on the number of factor levels.
 - `matchable` - ibid as `character` inputs, but this time it's the factor levels that get passed to `arg` argument in `match.arg`.

#### Body

The body of the template uses `brew` syntax with a forked back-end. Please check out [pander's documentation](http://rapporter.github.com/pander/#brew-to-pandoc) for details.
