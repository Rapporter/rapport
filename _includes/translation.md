Translating an existing template could not be easier: just copy the content of the desired template to a new file and translate the text in the header and body of the template. **Warning: this is harder than it seems!**

See e.g. `tpl.find('hu/correlations')` which is based on `tpl.find('correlations')`. Check out the [colorized diff of the two files](http://diffchecker.com/BN316P7)!

Fields to be translated in header section (between `<!--head` and `head-->` tags):

 * Title
 * Author/Email
 * Description
 * Example (updating the name/path of the template is sufficient)
 * variable information (3rd and 4th block)

In the body of the report (after `head-->` tag) you may change any text, reorder R code (stuff between `<%` and `%>` tags) or even tweak those (if you know what you are doing).

We suggest placing the translated templates in a directory named to the [short, alpha-2 abbreviation of the language](http://www.loc.gov/standards/iso639-2/php/code_list.php) (e.g. `hu` for Hungarian).

Translated (or just altered) templates are highly welcome, so please give the [pull request](https://github.com/aL3xa/rapport/pull/new/master) a try or [open an issue](https://github.com/aL3xa/rapport/issues/new) on GitHub, or you can send us your template via [email](mailto:info@rapport-package.info).
