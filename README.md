`ddd` <img src="https://i.imgur.com/M8Jk1AL.png" align="right" height="75"/>
============================================================================

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/ddd)](https://CRAN.R-project.org/package=ddd)
[![R build
status](https://github.com/tidylab/ddd/workflows/R-CMD-check/badge.svg)](https://github.com/tidylab/ddd/actions)
[![codecov](https://codecov.io/gh/tidylab/ddd/branch/master/graph/badge.svg?token=U6FL5N32FL)](https://codecov.io/gh/tidylab/ddd)

<!-- badges: end -->

`Domain-driven Design (ddd)`
----------------------------

<img src="https://i.imgur.com/RLEQkhe.png" width="100%" style="display: block; margin: auto;" />

Hurry please, I have a short attention span, what is `ddd`?
-----------------------------------------------------------

Sorry, most likely `ddd` is not for you.

Who is `ddd` for?
-----------------

Here are a few assumptions about you:

-   You are an R user

-   You are an experienced Data Scientist

-   You have seen and created clunkers, that is, analytic applications
    with an abundance of cruft

-   You have a passion for producing analytic applications of
    high-quality every day

If you belong to the intersection of all the sets above, then `ddd` may
benefit you.

What `ddd` is (but first, what it is not)
-----------------------------------------

Because `ddd` is an R package that caters for Data Scientists, it is
natural to think it may contain a new learning algorithm, statistical
method, a visualisation tool, or data processing toolkit. `ddd` offers
none of these things. Instead, `ddd` automates repetitive tasks that
arise during software development in R. In that sense, `ddd` is akin to
the [`usethis`](https://usethis.r-lib.org/) package.

`ddd` is an acronym of a software development approach called
[***domain-driven
design***](https://en.wikipedia.org/wiki/Domain-driven_design), or DDD
for short. `ddd` facilitates the implementation of key DDD patterns
including Entity, Value Object and Domain Services. Together these
building blocks form a domain model.

Before getting into specifics about **domain-driven design**, lets first
discuss the importance of software design and how it is inevitable.

Why should I use software design?
---------------------------------

![](https://i.imgur.com/pSbxSxl.png "guardrails and guiderails")

When you develop software to solve a new business problem, what guides
your software design? Obviously, you strive to eliminate unintended
behaviours (bugs) from the software. Perhaps you are using tests and
even a Test-Driven Development (TDD) approach. However, guiding your
design with tests is analogous to driving a car by using the guardrails.
It keeps you safe from the bar ditches while you drive, though it has no
navigation utility.

All too often, Data Scientists produce software without thoughtful
design. On the one hand, Data Scientists are typically not Software
Engineers, nor are they taught good practices of software engineering.
On the other hand, Data Scientists often take the role of Software
Engineers when they develop analytic applications. Perhaps, the lack of
software engineering knowledge, leads Data Scientists to overlook the
significance of good design.
<!--While some Data Scientists are unaware of the concept, others may see any 
design process as an over-engineering task-->

No design is a fallacy. This is because design still flows from the
brains of the Data Scientists through their fingertips as they wrangle
with the code. Thus, questions about whether a design is necessary or
affordable are quite beside the point: design is inevitable. The
alternative to good design is bad design, not no design at all.

<!-- There common (guiderails) driven-desing approaches are Database-driven design, -->
<!-- Class-driven design and Domain-driven design. -->
<!-- Although each domain model is different, many patterns occur repeatedly. -->

Installation
------------

You can install `ddd` by using:

    install.packages("remotes")
    remotes::install_github("tidylab/ddd")

Optionally, you can make a project independent of the `ddd` package by
calling `use_ddd()`. `ddd` is needed for software development and has no
added value in production. `use_ddd()` will copy the necessary R classes
and functions into your project.

References
----------

Evans, Eric. 2004. *Domain-driven design: tackling complexity in the
heart of software*. Addison-Wesley Professional.

Percival, Harry, and Bob Gregory. 2020. *Architecture Patterns with
Python Enabling Test-Driven Development, Domain-Driven Design, and
Event-Driven Microservice*. Edited by 1 Edition. O’Reilly Media, Inc.

Vernon, Vaughn. 2013. *Implementing Domain-Driven Design*. 1st Editio.
Addison-Wesley Professional.

Wlaschin, Scott. 2018. *Domain Modeling Made Functional*. Pragmatic
Bookshelf.
