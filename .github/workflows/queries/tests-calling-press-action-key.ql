/**
 * @description Find tests that call the function pressActionKey
 * @kind problem
 * @id javascript/tests-calling-press-action-key
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
* Holds if `caller` contains a call to `pressActionKey`.
*/
predicate callsPressActionKey(Function caller) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getCalleeName() = "pressActionKey"
  )
}

from Function test
where isTest(test) and callsPressActionKey(test)
select test, "calls pressActionKey"