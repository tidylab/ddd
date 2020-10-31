# Seeing Patterns in a Domain Model

# 1. Simple values. These are the basic building blocks represented by built-in
# types. A domain expert does not think in terms of `person` but instead thinks
# in terms of Customer or User that are part of the ubiquitous language.
Customer <- utils::person
User <- utils::person

# 2. Groups of closely linked data
Customer <- function(given = NULL, family = NULL, middle = NULL,
                     email = NULL, role = NULL, comment = NULL,
                     first = NULL, last = NULL)
{
    list(given = given, family = family, middle = middle,
         email = email, role = role, comment = comment,
         first = first, last = last)
}

