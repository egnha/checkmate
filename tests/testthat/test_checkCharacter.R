context("checkCharacter")

test_that("checkCharacter", {
  myobj = c("a", "b")
  expect_succ_all(Character, myobj)
  myobj = 0
  expect_fail_all(Character, myobj)

  expect_true(testCharacter(character(0)))
  expect_false(testCharacter(NULL))
  expect_true(testCharacter("a"))
  expect_false(testCharacter(1))
  expect_true(testCharacter(NA))
  expect_true(testCharacter(NA_character_))

  expect_true(testCharacter("a", min.chars = 1))
  expect_false(testCharacter("a", min.chars = 2))
  # treat NA_character_ as zero-length string
  expect_true(testCharacter(NA_character_, min.chars = 0))
  expect_false(testCharacter(NA_character_, min.chars = 1))
  expect_false(testCharacter(NA, min.chars = 1))

  x = c("abba", "baab")
  expect_true(testCharacter(x, pattern="a"))
  expect_true(testCharacter(x, pattern="ab"))
  expect_false(testCharacter(x, pattern="aa"))
  expect_false(testCharacter(x, pattern="^ab"))
  expect_true(testCharacter(x, pattern="AB", ignore.case=TRUE))
  expect_true(testCharacter(x, pattern="AB", ignore.case=TRUE))
  expect_false(testCharacter(x, pattern="AB", ignore.case=FALSE))
  expect_false(testCharacter(x, pattern="AB", ignore.case=FALSE))
  expect_true(testCharacter(x, pattern="a+"))
  expect_false(testCharacter(x, fixed="a+"))

  x = letters[1:3]
  expect_true(testCharacter(x, any.missing=FALSE, min.len=1L, max.len=3L))
  expect_false(testCharacter(x, any.missing=FALSE, len=5))

  expect_error(assertCharacter(1), "character")
})


test_that("NAs are ignored for regexp matching (#106)", {
  expect_true(testCharacter(c("a", NA, "b"), pattern = "^[ab]$", any.missing = TRUE))
  expect_false(testCharacter(c("a", NA, "b"), pattern = "^[cd]$", any.missing = TRUE))
  expect_true(testCharacter(c("a", NA, "bbbabbb"), fixed = "a", any.missing = TRUE))
  expect_false(testCharacter(c("a", NA, "bbbabbb"), fixed = "b", any.missing = TRUE))
})
