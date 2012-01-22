Translating an existing template could not be easier: just copy the content of the desired template to a new file and translate the text in the header and body of the template.

See e.g. `tpl.find('hu/correlations')` which is based on `tpl.find('correlations')`. Check out the [colorized diff of the two files](http://diffchecker.com/BN316P7)!

Fields to be translated in header section (between `<!--head` and `head-->` tags):

 * Title
 * Author/Email
 * Description
 * Example (updating the name/path of the template is enough)
 * variable informations (3rd and 4th columns)

In the body of the report (below `head-->` tag) you may change any text, reorder R code (stuff between `<%` and `%>` tags) or even tweak those - if you know what you are doing :)

We suggest placing the translated templates in a directory named to the [short, alpha-2 abbreviation of the language](http://www.loc.gov/standards/iso639-2/php/code_list.php) (e.g. `hu` for Hungarian).

Translated (and even altered) templates are really welcomed, please shoot a [Pull Request on GH](https://github.com/aL3xa/rapport/pull/new/master), [open an issue](https://github.com/aL3xa/rapport/issues/new) or just send us in an e-mail!
