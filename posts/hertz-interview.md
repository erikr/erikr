---
layout: post
title: Hertz Fellowship interview questions
tags: academia, engineering, research
---

Over a year ago, I applied for the [Hertz Foundation Fellowship](http://hertzfoundation.org/dx/fellowships/fellowshipaward.aspx), and was invited to the first round of interviews.

MD/PhD students are eligible for the Hertz Fellowship, unlike the NSF Graduate Fellowship.

The Hertz interviews are technical, and similar to PhD qualifying exams (which I wrote about in [this post](http://erikreinertsen.com/phd-quals-gtbme/)).

Here I describe the questions I was asked and the answers I gave. Each interview covers different topics, some of which are selected by the applicant, so your experience will differ.

Interview questions are block quoted, and my responses are plain text.

---

> Tell me how your journey started, back when you chose a college, then decided to pursue MD/PhD training.

 Don't feel like writing this out, but same information as was in my essays when I applied to MD/PhD.

> Why did you switch your interests from biomaterials to software?

 Software is eating the world (shoutout to A16Z).

> Where do you see yourself after finishing school, then after that?

Residency, then faculty with joint appointments in medicine and engineering. I want to balance patient care, research, and teaching in a synergistic fashion.

This sounds cliched, but interestingly it is also one of the rarest outcomes for any academic doctor. Everyone says they want to do it because they think the admissions committees want to hear it. They may be right. Lots of us say this because we truly want to do it. But the actual number of MDs and MD/PhDs who successfully attain synergy between three very demanding and sometimes conflicting endeavors is small - based on my anecdotal experiences with faculty over the years.

(This interview was a while ago and my interests have evolved. These days I am considering non-academic careers.)

> Tell me about a situation in which you exercised creativity?

I talked about my senior design project at UCLA where we attempted to reduce cell death in polymer scaffolds by seeding cells in a gradient to better control oxygen consumption and diffusion. Our team was limited to 1 or 2-dimensional modeling in COMSOL because of mathematical complexity. To match computational and experimental paradigms, we fabricated polymer discs that fit exactly in the wells of a 48-well plate. Like stacking pancakes of different chocolate chip densities, we stacked discs with different cell densities to crudely control cell distribution.

> Another thing Hertz looks for is technical skill. What are some areas we can talk about?

Chemical engineering, transport, biology / physiology, statistics.

> We play a game where I have 1000 coins and you have 1000 coins. We take turns flipping one coin at a time. If it lands heads, I get the coin (or keep it if it was my flip). If it lands tails, you get it. What does the sample space of game outcomes look like? How would you determine the length of the game?

I would write some very simple code and run a Monte Carlo simulation, then plot a histogram of outcomes against simulation number. I would expect to see the distribution of game outcome follow a normal distribution if sufficient samples were taken. At this point I cited the central limit theorem.

> What is an analogous process to this coin-flipping game? What would both the game and the analogous process look like at infinite time?

I did not immediately answer correctly, but we ended up discussing diffusion.

> What is the relationship between length scale and diffusion, and why?

The Stokes-Einstein equation can be used to relate time scale Tau, length scale lambda, and diffusivity D[^1]:

Tau = (lambda)^2 / D

The above expression is correct for 2D or 3D space. I incorrectly thought it solely applied to 3D space, which was the scenario in which I derived it.

> Switching gears - how would you construct a biological circuit that can perform logical operations?

I would introduce two receptors on the surface of a cell that had specific binding to two different ligands; say, calcium versus a neurotransmitter.

> In real life what do the kinetics of ligands binding to a receptor look like, and why?

Sometimes the response looks like sigmoidal curve, because of allosteric effects, e.g. hemoglobin. Activity reaches an asymptote. There is also lots of noise in biological systems.

> How would you make a sigmoidal curve sharper?

First, I thought to increase the binding affinity of the ligand for the receptor, but that would probably just increase binding at all concentrations.

Next, I thought about how hemoglobin works; you could make the receptor or enzyme decrease activity at higher concentrations of ligand.

Another way is to add a 3rd party allosteric modulator, so I used 2,3-BPG acting on hemoglobin as an example.

> Let us suppose you construct a surface receptor system that lets you signal 1 or 0 using two separate ligand inputs. How would you build an 'AND' and an 'OR' gate?

Use a downstream signaling integrator, or traffic the signal to a different part of the cell, a la trafficking motifs. I also talked about a very superficial neural network approach.

> Describe an organ system from a clinical perspective, then contrast that to an engineering or science view.

The brain; neurologists think of disease in terms of clinical symptoms or vascular localization. Neuroscientists think about a more microscopic scale, drawing on graph / information theory, electrophysiology, etc.

Also, the heart; physiologists clasically think of CV systems as a network of resistors, capacitors, and pumps (I cited Guyton). Cardiologists integrate a lot of physiology: clots to the brain from atrial fib, or fluid overload hitting the lungs, etc.

In hindsight, cardiology was a bad example because that is a fairly quantitative medical specialty. But I summarized by saying the major difference between the two views was a quantitative approach, or for a bench scientist, length scale versus clinical integration.

> You mentioned in your application you enjoy cooking. Give me an example of chemical engineering or chemistry in cooking.

I talked about heat transport in making the perfect filet mignon. Pink in the middle, but seared with a beautiful crust on the outside. You have to use high, intense heat in the beginning to lock in the color and flavor (Maillard reaction), then reduce heat to gently cook the center of the meat further from the heat source. If you want more even diffusion, you can sear on the stovetop and transfer to a convection oven.

> Outside of your research, what are the three big-picture problems you want to work on?

1. Instill rigorous management practices into academia.
2. Apply behavioral economics and psychology so society chooses truly impactful problems to work on instead of problems people think are important.
3. Use technology in a broad sense (mobile, cloud, analytics) to radically transform training and education.

I asked my interviewer two questions:

> Why do you contribute to / get out of Hertz?

He likes meeting and interviewing fellows.

> What do you strongly believe in that most people disagree with you about?[^2]

Global health requires technology innovation, but also cultural and policy approaches. People tend to lie in one camp or the other and criticize work outside of their view. I disagree with both extremists and believe we need a combined approach to improve healthcare in underresourced environments.

---

I felt I answered the questions well, but was not invited for a final interview. The rest of my application (GPA, publication record, etc.) was probably not as strong as the competition. Congratulations to the brilliant people who won the fellowship.

---

[^1]: I learned this and much more from [Daniel Kamei](http://kameilab.seas.ucla.edu/daniel-kamei.html), one of my favorite professors at UCLA.

[^2]: This is (purportedly) Peter Thiel's favorite interview question.
