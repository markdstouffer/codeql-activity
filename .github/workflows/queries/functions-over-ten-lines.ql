/**
 * @description Find functions over 10 lines long
 * @kind problem
 * @id javascript/functions-over-ten-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isOverTenLines(Function func) {
  func.getNumLines() > 10
}

from Function func
where isOverTenLines(func)
select func, "is over ten lines long"