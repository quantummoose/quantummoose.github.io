---
layout: post
title:  "Linear regression with different lenses"
date:   2022-03-10
categories: research
published: false
---

{% newthought "Linear regression" %} is one of the most common models used across statistics and machine learning, and a large set of methods can be thought of as natural extensions. This makes it a useful pedagogical tool to introduce and explore various approaches, such as comparing maximum likelihood or Bayesian statistics. Unfortunately, the standard explanations can make it hard to see what the tradeoffs clearly are, down to the basic terminology used{% sidenote "one" "This seems to mostly be due to historical incidentals, but sometimes it's really useful to have these different viewpoints." %}.

In this post I want to explicitly compare some basic regression approaches, with the goal of making it easier to compare the overall approaches. In particular; work through the simple ordinary least squares (OLS) method, the more general maximum likelihood approach (MLE), Bayesian regression in particular maximum a-posteriori (MAP), some constrained approaches (RIDGE/LASSO), and deep learning (computational graphs). While this provides a simple survey of major approaches, it will also highlight these different tools (probabilistic, curve fitting, point estimation, and differential programming) and show how they are often different lenses on the same (or at least similar) underlying model. 

I should mention that my general preference is to adopt a more probabilistic frame in general, such as [this great summary of variate-covariate modeling](https://betanalpha.github.io/assets/case_studies/variate_covariate_modeling.html){% sidenote "two" "Variate-covariate modeling is another term for "regression", but the latter is more common so I'm keeping with that." %}. However, I also really love geometric interpretations, which can be easy to see with curve fitting. And deep learning has developed really powerful frameworks with great code toolboxes.

Briefly to mention, I'll be a bit flippant about some technical notation and proofs here. I'll try to link to various more detailed documents on the side, when useful. I'll try to adopt consistent notation and introduce as it's used. I might move from single to multiple dimensions (vector to scalar) at certain points without clarifying, but I will when I remember, and I'll keep to vector notation in general. I'm going to try to provide simple code examples as well, but don't suggest you use them directly as I don't promise any guarentee of them working.

First, general set up of "regression problem". The simplest version is just curve fitting.

*Fit a line figure.*

## Ordinary Least Squares

https://en.wikipedia.org/wiki/Ordinary_least_squares

Imagine we have a set of points and we're interested in fitting a line to it. Why? 

Problem. Given a bunch of points, find the line

$$ y = X \beta $$

that is "closest" to those points.

$$ \beta = arg min \mid y - X \beta \mid^2 $$

The solution is:

$$ \beta = (X^T X)^{-1} X^T y $$

What's useful about this is in the solution we can see something interesting, for those who know linear algebra. We're just comparing how similar points are, but in terms of the line. $$ (X X^T) $$ is the auto-correlation matrix of $$X$$, and $$X^T y$$ is a _projection_ of y into X space.

To compare, look at k nearest neighbor...

Look, it's a Kernal! https://en.wikipedia.org/wiki/Support-vector_machine

## Maximum Likelihood regression

https://en.wikipedia.org/wiki/Maximum_likelihood_estimation

The above approach does not deal with uncertainty at all, which is an issue. Also it's hard to generalize to nonlinear problems.

$$ y = \beta x + \epsilon $$

Which is also written as:

$$ y \sim N(\mu, \sigma) $$
$$ \mu = \beta x $$

Where we might ignore $$\sigma$$ or treat as 1. More compactly, this is:

$$ y \sim N(\beta x, \sigma) $$

But we can do MLE.

$$ \beta = arg max L(y \mid \beta, x) $$

This simplifies to OLS in this special case. So we can see how MLE is basically the same, but more generalized. Now we can play with not just real-values points, but classification or other issues.

We essentially made a bunch of unstated assumptions when doing OLS. But we also have assumptions when doing MLE we haven't really thought through.

## Bayesian regression

When we work with MLE, we talk about "fitting" our model to data, or finding the "best fit". However, if we want to know our uncertainty on the fit parameters, we had to do this other work. Well, why optimize for a single value when we can find the _probability of any parameter value for a set of data_? Well that sounds like Bayes to me.

Use of conditional probability. We have this Bayes theorem that everyone loves. Ok but why? Well look at the likelihood function above. We just need to add the prior. 

$$ posterior \approx likelihood \times prior $$

### Maximum a-posterior regression

MAP regression is the case where we don't want the distribution but want to use the prior information. In that case, we do something similar to MLE but instead...

### Comparing MAP to MLE

$$ p(y \mid \theta x) p(\theta) $$
$$ = log[p(y \mid \theta x) p(\theta)]$$
$$ = log[p(y \mid \theta x)] + log[p( \theta)] $$

why is log fine? It’s a monotonic transformation! Won’t change fit.
remember: log(xy) = log(x) + log(y)

So what have we here? We have the log likelihood, which we often use, and the log posterior. So we consider the maximum a posterior estimate:

$$ max_\theta [ p( \theta \mid y, x)]$$
$$ \approx  max_\theta [p(y \mid \theta x) p(\theta)] $$
$$ = max_\theta log[p(y \mid \theta x)] + log[p( \theta)] $$
$$ = max of log likelihood plus some other term $$

Via bayes rule and our work above. This is the max log likelihood, plus an added term for theta. In other words, by using MAP, we’ve done the same as MLE but add a term based only on the parameters to our objective function. In other words, we are saying “find the best, but under these constraints of our parameters”. 

This is the same as constrained MLE. In other words, this is the same kind of thing as ridge regression or lasso! 

## Constrained regression

How can we see that? Well, in constrained regression, we add a constraint to our terms:

$$ max[L(y \mid \theta,x) - g(\theta)] $$

Where g(*) is some term that penalizes the objective function if, for instance, all the thetas are too large. For ridge regression g(theta) = sum(theta^2) while for lasso we use g(theta) = sum(abs(theta)). In both cases we have a term, lambda, that helps us adjust how important the value is.

So why bayesian? It’s honestly not different, in fact it’s the same thing here. The benefit of the full probabilistic way, that is using bayes theorem and all but keeping on to the full distribution, is it explicitly carries along the uncertainty we have in our parameters. The other way is to derive another estimate of our error terms, which of course can and have been done for most models. But if you want a new model, you’ll have to do that work.

## Deep learning

https://en.wikipedia.org/wiki/Differentiable_programming

Finally, how does this all compare to deep learning approaches?

Again, same constraints can be put in place, or as computations. Dropout is another way of regularizing, but this time it’s thought of as part of the computation. Why is it the same? Prior on weights, which are parameters.

## Some final thoughts

Now so far I’ve been saying “the same as” in a rather informal way. To be clear, whether these equations are equivalent depends on the exact distributions used. In fact, OLS is equivalent to MLE for a gaussian distribution. By comparison, it’s hard to directly relate dropout to regularization or priors, because it’s not clear how to rewrite it (at least for me!). It’s not that these details don’t matter of course, in fact they’re incredibly important. But focusing on them can make it hard to see the general patterns and relationships. 

So why use one rather than the other? Why write down an MLE, or MAP, or do a full bayesian posterior, or use a deeply learned neural network? The simple answer is that it honestly depends on your goal. There are very practical tradeoffs between these methods. Often, it’s not feasible to consider a probability distribution approach to some problem, but it’s easy to think of a computation graph for the data. Maybe you can’t work with just a point estimate, but need a full distribution instead, so go bayesian

In addition, we can often directly rewrite one method in terms of another, at which point we mostly need to compare the implementation details. Which library or function is faster? Does someone already have code that’s guaranteed to work for this problem? How much data do I have? What programming languages am I familiar with or will be best to use due to other aspects of the project? It’s a challenge to learn all these different approaches, and if this is not your primary research it can be an uphill battle. But knowing that there are relations makes the comparison much more straightforward.

The best thing is to write your problem in a general probabilistic way, find the inference you want to make or the decision you want, and then find the tool that best works for that. If you only want a point estimate have at it. And so on.