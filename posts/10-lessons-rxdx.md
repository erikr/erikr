---
layout: post
title: 10 Tips for Leading Data Teams in Biotech
tags: 
---


> This blog post is a work in progress. Need to cut one topic to bring 11 down to 10.

> Alternate title: "How to operate as a technical leader in a biotech"


## You

You are a technical leader at a biotech startup. Perhaps your job title is Director, VP of Data Science / Machine Learning / Engineering, or CTO / CDO. Your company wants to develop a "platform" or "engine", an exciting opportunity that is now your responsibility. This post is for you. Here I share ten tips that I hope you find useful on your path to success.


## Background

In early 2021 I joined Prometheus, a small biotech startup, as employee #27 and the head of data science and software engineering ("DSE"). Our mission was to develop precision therapeutics for autoimmune disease, with an initial focus on inflammatory bowel disease. Fresh off a $130M fundraise, we had a validated drug target (TL1A), a pipeline of antibody candidates, and an exclusive license to data and samples in the Cedars-Sinai Medical Center's IBD biobank. However, we lacked technical talent, curated data, and compute infrastructure to support our ambitions of precision medicine, as outlined in press releases at the time:

> The company's precision medicine platform, Prometheus 360 (P360), combines proprietary bioinformatics discovery methods with one of the world's largest gastrointestinal bioinformatics databases to identify novel therapeutic targets and develop therapeutic candidates to engage those targets.

My job was to build this. Over the next two years, we defined the product roadmap, recruited a small but stellar team of distributed data scientists and software engineers, learned from world-class advisors, engaged CROs and consultants, stood up our cloud architecture, and ingested terabtyes of multimodal biological data. Our infrastructure, capabilities, and expertise enabled and supported target validation and companion diagnostics (CDx) development.

In March 2021, we went public (with the ticker `$RXDX`), announced positive phase 1 data in IBD, and expanded indications to systemic scleroderma. At the end of 2022, we announced positive phase 2 data in IBD. In 2023, after two years as the best-performing biotech stock, we were acquired by Merck for $10.8B. This outcome was a win for patients and shareholders, but the journey was not without adversity, tribulation, and failure.

When I started, I lacked operating experience, nor did I have a background in genetics or immunology - although attending medical school helped. I learned as much as I could from mentors, papers, books, and blog posts, especially about technical management. I was surprised when almost all of our challenges turned out to be cultural, interpersonal, and communication-related rather than scientific or technical. I wish I had the benefit of hindsight; a concise and practical guide that was specific to the nuances of leading a technical team within a biotech. My hope is that you learn from my experiences.


## Table of Contents

--

## 1. Align platform progress with leadership at a regular cadence and via a biweekly digest

An inflection point of alignment between our C-suite and technical team ocurred when I presented (in-person, face-to-face) our product vision and road map for Prometheus 360. This long-overdue sync had previously taken place in bits and pieces; 1-on-1s with the CEO, casual conversations with the COO over lunch, etc. My boss, our Chief Scientific Officer, would give a brief overview of P360 progress in 1-2 slides at regular leadership team meetings. However, we had not yet huddled in the same room for a start-to-finish overview of the platform. Preparing a deck was a (tad corporate) forcing function to decide what to build, when (how long does it take), why (justify the cost), and how much $ it would cost. It was also key to call out what we chose to NOT build, and why. More importantly, this provided a forum for dialogue so people could ask questions and we could illustrate the value we added.

To set our road map, we had to face the reality that we were a biotech with interests in technology, not a platform "TechBio" company like Recursion or In Sitro. DSE's role was to enable and support R&D efforts such as target validation and CDx development. It was not to generate revenue from services. Our bottleneck was not novel targets, so we didn't need to turbocharge target discovery with technology. Our culture, org chart (I reported to the CSO, and we did not have a CTO or CDO), budget, and positioning to the market reflected this reality. I share this to provide context to the reader, but also to encourage the same reality check for all companies in this space. I think surprisingly many people don't know who they truly are, or what kind of company they truly work at. If I joined a TechBio startup instead of a biotech, I might have had more fun, learned more, suffered less, and had a larger impact. But life does not give you access to the counterfactual. Play your best with the hand you are dealt.

After this sync, I started sending a biweekly, asynchronous "DSE Digest" to all VPs and C-level executives per the advice of our Chief Business Officer (one of the most effective operators I've had the privilege to work with). You can choose a different cadence, but we liked every two week because this aligned with our sprint length and balanced speed with substance. I covered between 5-7 topics each digest. For each topic, e.g., "Data ingestion and curation from Cedars-Sinai Medical Center", I summarized "Wins", "Challenges / Blockers", and "Next Steps".

For "Wins", I suggest you highlight team members by name. Corporate gamesmanship is distasteful, but this is an opportunity to highlight valuable work done by data scientists and engineers who rarely interface with the c-suite. This was especially important at Prometheus because most of the c-suite was on-site whereas the entire DSE team was distributed.

For "Challenges / Blockers", our company culture mandated a tone of optimism, and dissuaded mentioning people by name. Praise in public, critique in private. I did not find this optimal. The opposite culture might be seen at a place like Bridgewater, where a mistake, failure, or impediment is precisely called out as Bob's error. The practical use here was to surface issues that we needed leadership help with, such as a lack of resources, an unresponsive collaborator (especially if within our company), or 

For "Next Steps", I listed 2-3 upcoming milestones. I omitted future goals that were months away or abstract. I like accountability so I was precise with who owned each next step, and the date of expected completion.

This digest was redundant for intra-DSE alignment since we met weekly and referenced a single source of truth (SSOT) for our tasks. However, it was useful for inter-team alignment even at the lower levels of the org chart. We occasionally sent the digest to our colleagues in CDx or Immunology so they had more context on our priorities and progress. It would have also been a valuable resource for onboarding new hires to our team, although we stopped growing before we started this practice.

I realized (painfully late in my tenure) nobody else really cares about platforms, infrastructure, and capabilities. At a biotech, people care about clinical and scientific results that move assets forward. PM means Project or Program Manager, not Product Manager. I lost track of how many times Accounting asked me what program an expense was for followed by my response "my team doesn't work on programs; we work on the platform that applies to all past and future programs". We found the best way to convey value was by connecting every bullet point in the digest to the relevant therapeutic program, and how the capability mattered for the top-line goal.

For example, our Principal Software Engineer rewrote our genetic imputation pipeline to be 200x faster. This statistic alone is robust justification of the work if you are an engineer. But nobody else cared until they realized turnaround time from new sequenced samples to results was now 1 hour instead of 1 week. This much faster QC iteration time enabled us to find and correct several key errors in both the upstream sample handling process and the computational pipeline. This enabled us to achieve the desired statistical power for our CDx work related to our lead program.

Lastly, a practical tip if you are in a corporate / legacy / old school company. We used Notion as a SSOT, and shared our digests by emailing a link to people. But many readers preferred to be emailed an exported PDF so they could read the content without installing Notion, opening a link, or needing internet access, e.g., on a plane flight. So I emailed a link and also attached the exported PDF even if it was technically redundant.


## 2. Conduct monthly retrospectives with your team to build candor, trust, and alignment.

I first experienced this reflection / ritual / group therapy session at the Broad Institute as a collaborating member of the Machine Learning For Healthcare team, led by Puneet Batra. I immediately loved it, and later brough it to Prometheus.

Every month, the DSE team met (over Zoom) to hold a retrospective (retro, for short). We covered three topics:

1. Rose - what is going well?
2. Thorn - what is going poorly?
3. Bud - what should we change?

I opened a templated Notion page and shared the link. Each section had subsections with every team member's name. We would spend 10 minutes typing bullet points in silence. Next, we'd go around the room and talk through each bullet point.

Candor was vital, and achieving candor required psychological safety. We felt comfortable being critical and direct with each other because we had long established a culture of positive intent and mutual respect. This is cultivated by continually doing what you say, saying what you do, and acting in the best interests of your team (which ideally aligns with the best interests of the company). I saw team members provide direct, critical feedback to each other, then immediately act on it rather than get defensive. To me, this was excellent culture.

I obtained permission from each team member to share the retro notes with anyone else in the company. The Notion pages were accessible by anyone with a Prometheus login. I occasionally shared the notes with our CSO, CEO, or DSE Advisors so they had a sense of "boots on the ground", but nobody else cared about our retro notes.

Team members don't just want to "be heard". They want to see their managers act on their suggestions and solve problems. I heavily prioritized acting on what my reports shared with me under the "Bud" section. I also paid close attention to the causes of their "Thorns", 10% of which were technical challenges and 90% were other teams or external collaborators misbehaving.

I eventually got in trouble when I criticized a superior by name in a retro note and shared the content with them. Rather than act on the feedback, they retaliated against the entire team from their position of authority. The death of trust quickly spelled the end of retros, and more generally, shifted the culture away from candor and toward secrecy. Thankfully, we were acquired not long thereafter.

Retros are a powerful and fun tool for teams with a culture of candor, trust, critical feedback, and positive intent. If your corporate culture has issues with these factors, you have bigger problems that are not solved by a popular management framework or 1-on-1 template.

Technical leaders can also do focused retros (sometimes morbidly called "post-mortems") after finishing a big sprint, technical milestone, or project. Pre-mortems are a fun variation where a project is kicked off by hypothesizing all the reasons it might fail.


## 3. Pay CROs, consultants, and vendors for deliverables, not time.
- Build vs. Buy
- How to find CROs, consultants
- RFP-style super explicit and precise projects
- Start with pilot
- Align on what good and done is
- Align on how you want them to work
- Overspecify for your first engagement
- How to manage and delegate; take foot off throat over time as you build trust
- Crack the whip, push them hard, demand high quality work
- Call out bad vendor: never work with Genedata again


## 4. Track work in a single source of truth (SSOT), and only reference that place.
- The way you use the tool, e.g., the workflow, matters more than what specific tool you choose.


## 5. Establish intentional intentional communication and workflow norms, especially if your team is distributed.
- Async
- Tracking work
- Meeting norms, a/v, equipment
- Conference rooms, working with on-site people
- Terminology of "San Diego" vs "Remote" not helpful
- Norms are set by the C-suite


## 6. Follow good practices for hiring talent, and be confident you will improve
- Ask the same questions, ref checks, view past work, select builders, no luck hiring from pure tech, hybrids good, one off vs craftsmen


## 7. Develop a culture of critical feedback, candor, and positive regard.


## 8. Define overloaded terminology when you work with people in different disciplines.
- Technical people call input data "data", and outputs of computational manipulations "output" or "results"
- Biotech people in CSO or CMOs orgs call results "data"; perhaps they call input data "raw data"?
- Technical people call an entity or object an "artifact". Scientists call noise or error "artifact".
- Biotech people call a portfolio of therapeutic programs (e.g., drug candidates) a "pipeline".
- Technical people call a sequence of computational manipulations a "pipeline".
- 


## 9. Build an advisory board of experts to offset your weaknesses


## 10. Document data and code (need to make more powerful)
- Document the details of data provenance, workflow, etc.
- If you don't know the details, don't assume it is documented.
- If it isn't documented, don't assume other people know.
- If someone knows one aspect, don't assume they or anyone else knows the entire process.
- Sometimes the necessary work is to sit in a room for 7 hours, ask a thousand questions, and document every step of what is going on.
- Engineers and data scientists did not join your team so they could document data provenance.


## 11. Expect legacy systems, file formats, and thinking.
- Many people in biotech are default private vs default public. Closed-source vs open-source. Secrets, IP, risk management, compliance vs accessibility, openness, sharing.
- In a dysfunctional corporate bureaucracy, information is power, so naturally people desire control over the flow of information.
- Examples: engineer tags a Comp Bio colleague in a GitHub comment, never hears back. Asks for code, receives a Dropbox link or email instead of a link to a repo. Commit frequency substantially high in software team, low in Comp Bio team.
- Microsoft Office is everywhere. People will email files instead of reference a cloud-based SSOT. This seems bizarre to you but natural to them.
- Regulatory filings.
- Data from the wetlab in a dozen Excel files with inconsistent schema.
- Doesn't mean you accept these formats and workflows as globally optimal; world needs to change.
- But you also cannot accomplish anything tangible by ignoring it.
- Palmer Lucky talks about the value of out-of-the-box thinkers being willing to endure interfacing with people who live in the box.
- Spend some time to understand why files and systems are set up the way they are, while keeping in mind the subsequent improvement or evolution you want to achieve.
