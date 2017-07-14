---
layout: post
title:  "Representation in Psychology"
date: 2017-04-08
categories: research
---

I had long been confused about the concept of representation as it appears in psychology, most because it had been rather poorly taught and vaguely explained in my undergraduate years. I even remember remarking in an animal cognition course about how psychologist's don't seem to have a unified sense of what "representation" means. More recently the idea has become much clearer (for me), in particular after reading through Gallistel's book *The Organization of Learning*. There he identified representation psychologically with representation mathematically, which I think buys you a lot.

Representation, along with computation, is a word that does a lot of theoretical heavy lifting in psychology and neuroscience. In neuroscience the focus is on understanding how the brain "represents" external stimuli, values, actions, or memory, and is generally investigated using decoding and encoding principals.

For example, if you want to know how the brain represents some visual stimuli {% m %} S {% em %}, you can perform brain recordings{% sidenote "one" "I'm being flippant here about what I mean by 'brain recording', so take this as a first approximation." %} to get brain state {% m %} B {% em %} and try to infer {% m %} P(B | S) {% em %}. This is encoding - predicting brain activity from some external stimuli{% sidenote "two" "There's another notion of encoding and decoding that is brain centric, but they are highly related" %} - and one of the major goals of a lot of neuroimaging. To be clear, what we get out of this kind of analysis is a prediction. We don't necessarily get the result "this brain state *represents* the stimuli", but we do get "this brain state is predictable from this stimuli", which is related. While there's more to discuss in understanding brain representations, we haven't clarified what we mean by representation in the first place.

What can help us, oddly enough, is by trying to get more abstract and not even refer to the brain. What do we mean mathematically when we talk about representation? If we have a mathematical model of something in the world, where certain variables represent particular world states, factors, or concepts, we're talking about a relationship between the world and our symbols. This relationship can be considered a function, where we take some world state {% m %} S {% em %} and map it to a model variable {% m %} V {% em %} using some relationship {% m %} S \rightarrow M {% em %} where that arrow maps elements from {% m %} S {% em %} into {% m %} V {% em %}. This mapping should be [homomorphic](https://en.wikipedia.org/wiki/Homomorphism), meaning that it also preserves the operations of each group. So, if things change in the world, they should change in the same way in the model.

Similar ideas formalizing [measurement](http://suppes-corpus.stanford.edu/articles/mpm/382.pdf) had been developed by early mathematical psychologists, such as Duncan Luce, and Gallistel [used](http://www.annualreviews.org/doi/abs/10.1146/annurev.ps.40.020189.001103?journalCode=psych) these ideas to preface his discussion of a computational explanation of behavior. Computation, following this idea, is the transformation of one representation into another. Information processing in the brain or mind consists of these transformations of representations in the service of performing actions to satisfy goals.

Simple enough.

What I appreciate is how grounded these are mathematically, which makes it much easier to relate to modeling efforts and data analysis. Of course this is also just the theoretical beginning, but it definitely has helped clarify representations for me at least.
