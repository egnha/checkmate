#' Check if an object is an element of a given set
#'
#' @templateVar fn Choice
#' @template x
#' @param choices [\code{atomic}]\cr
#'  Set of possible values.
#' @template checker
#' @family set
#' @export
#' @examples
#' testChoice("x", letters)
checkChoice = function(x, choices) {
  qassert(choices, "a")
  if (!qtest(x, "a1") || x %nin% choices)
    return(sprintf("Must be element of set {'%s'}", collapse(unique(choices), "','")))
  return(TRUE)
}

#' @include assert.R
checkers$choice = checkChoice

#' @export
#' @include makeAssertion.R
#' @template assert
#' @rdname checkChoice
assertChoice = makeAssertionFunction(checkChoice)

#' @export
#' @rdname checkChoice
assert_choice = assertChoice

#' @export
#' @include makeTest.R
#' @rdname checkChoice
testChoice = makeTestFunction(checkChoice)

#' @export
#' @rdname checkChoice
test_choice = testChoice

#' @export
#' @include makeExpectation.R
#' @template expect
#' @rdname checkChoice
expect_choice = makeExpectationFunction(checkChoice)