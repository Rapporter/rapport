<!--head
Title:          Numeric value
Author:         Gergely Daróczi
Description:    Method based reporting of a numeric value
Strict:         TRUE
x           | *whatever     | Numeric       | A numeric value
digits      | number=4      | Digits        | Number of significant digits are to be used
decimal.mark| string=.      | Decimal mark  | Decimal mark
Example:        rapport('classes/numeric.tpl', x=pi, digits=3)
                rapport('classes/numeric.tpl', x=pi, digits=20)
head-->
<%as.character(format(x, digits = digits, decimal.mark = decimal.mark))%>
