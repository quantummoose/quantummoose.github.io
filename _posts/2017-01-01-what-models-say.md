---
layout: post
title:  "Model fitting: testing versus using"
date: 2017-01-01
categories: research
---
{% newthought "I've been dwelling" %} recently on what a model does, in terms of how it can be used and what it means. In particular, *Mathematical Psychology: An elementary introduction*{% sidenote "one" "By Coombs, Dawes, and Tversky from 1970" %}, describes two very different ways of using a model that I want to talk about here.

{% marginnote "zero" "*\"For such a model there is no need to ask the question \'Is the model true?\'. If \'truth\' is to be the \'whole truth\' the answer must be \'No\'. The only question of interest is \'Is the model illuminating and useful?\"* - [George Box](https://en.wikipedia.org/wiki/All_models_are_wrong#Quotations_of_George_Box) " %}
[All models are wrong](https://en.wikipedia.org/wiki/All_models_are_wrong). With that out of the way, it's important to then realize that models can be more or less useful in different ways. Newtonian theories are incredibly useful, and even if quantum or relativistic models are technically "more right" in some sense, they might be less useful practically. Same goes for trying to have an overly detailed neural model of behavior when you're not actually making a claim about neurons or measuring neural activity. This can easily encourage [overfitting](https://en.wikipedia.org/wiki/Overfitting) given all those extra parameters, and might not help you learn anything.

Any model with parameters you have to fit to data, and you can generally then test that fit. However the question you have isn't always solved by a fit - often you don't care really if the model is correct or not but rather what the parameter fit tells you. Coombs, Dawes, and Tvsersky give an interesting example comparing testing a model's fit to test a theory versus using the model as a method of data analysis to extract information.

{% marginfigure "one" "assets/img/models_say/markovgif2.gif" "There's a really good [interactive introduction to Markov Chains here](http://setosa.io/ev/markov-chains/). I'd also suggest looking at all the other tutorials there." %}
{% newthought "Markov chains" %} are really useful for a range of applications, since they're so easy to analyze. Let's say you have an experiment where the subject ran through multiple trials. Now you might want to see whether performance subsequent trials *n* and *n+1* are correlated - that is whether a Markov chain actually fits the data.

If a Markov chain fits, then something from each trial is impacting the next. This can easily be the case in many cognitive psychology tasks, and can imply something about the cognitive processes involved in the experiment For example, there might be "interference" from the previous trial due to working memory stuff.

{% marginfigure "two" "assets/img/models_say/kinematicDiagram.png" "An example Markov chain from the development of an [ethogram](http://college.holycross.edu/faculty/kprestwi/behavior/e&be_notes/E&BE_ethograms.pdf), called a kinematic diagram in ethology. Here the different states are different behaviors, and the interest is in seeing how it changes." %}
However you might not want to actually be *testing* a Markov assumption per say, but just using it as a way to get at the trial by trial (or time by time) correlations in the data. This is common in [ethological](https://en.wikipedia.org/wiki/Ethology) research, where the question isn't whether the behavior is best fit by a Markov chain, but using that assumption to help analyze behavior.

The second part is really important I think, as basically every data analysis method does this. Fitting a gaussian is less interesting than talking about the mean and standard deviation. The drift diffusion model can be fit to almost every set of reaction time data, so the real question is what it helps you say about the parameters.

Of course, the model could be so off that the parameters are completely uninterpretable. Practice safe analysis and check your assumptions!
