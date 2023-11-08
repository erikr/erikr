---
layout: post
title: What I learned about leading a data & software team in biotech
tags: 
---

> Reading time: 10 minutes

## You

You are a technical leader at a biotech startup. Your title is Director, or VP of Data Science / Machine Learning / Engineering, or CTO / CDO. Your company wants to develop a "platform" or "engine", an exciting opportunity that is now your responsibility. This post is for you. Here I share ten tips that I wish I had when I started, and I hope you find useful. 


## Background

In early 2021 I joined Prometheus, a small biotech startup, as employee #27 and the head of data science and software engineering ("DSE"). Our mission was to develop precision therapeutics for autoimmune disease, with an initial focus on inflammatory bowel disease (IBD). Fresh off a $130M fundraise, we had a validated drug target (TL1A), a pipeline of antibody candidates, and an exclusive license to data and samples in the Cedars-Sinai Medical Center's IBD biobank. However, we lacked technical talent, curated data, and compute infrastructure to support our ambitions of precision medicine, as outlined in press releases at the time:

> The company's precision medicine platform, Prometheus 360 (P360), combines proprietary bioinformatics discovery methods with one of the world's largest gastrointestinal bioinformatics databases to identify novel therapeutic targets and develop therapeutic candidates to engage those targets.

My job was to build this. Over the next two years, we defined the product roadmap, recruited a small but stellar team of data scientists and software engineers, stood up our cloud architecture, and ingested terabtyes of multimodal biological data. Our infrastructure, capabilities, and expertise enabled target validation and companion diagnostics (CDx) development.

In March 2021, we IPO'd, announced positive phase 1 data, and expanded indications to systemic scleroderma. At the end of 2022, we announced positive phase 2 data in IBD. In 2023, after two years as the best-performing biotech stock, we were acquired by Merck for $10.8B. This outcome was a win for patients and shareholders, but the journey was not without adversity, tribulation, and failure. Although your context will differ from mine, I hope this list of "things I wish I knew" serves as a helpful resource.


## Table of Contents

> To add when draft is finalized.


## Biotechs care about scientific or clinical results, not platforms. 

Nobody else cares about your data science / computational platform. To convey value, connect each "Win" to the related therapeutic program and how the capability helps the top-line goal. For example, an engineer rewrote our genetic imputation pipeline to be 200x faster. Nobody cared until they realized turnaround time from new sequenced samples to results was now 1 hour instead of 1 week. This enabled us to find and correct several errors in the upstream sample handling and downstream imputation process. Consequently, we achieved the desired statistical power for our lead program CDx.


## Share your team's progress via a biweekly digest.

Every two weeks I wrote and shared a "DSE Digest" to our VPs and C-suite. This cadence aligned with our sprint length and balanced speed with substance. I covered 5-7 topics per digest, and eventually we used our corporate goals as topics. For each topic, e.g., "Data ingestion and curation from Cedars-Sinai Medical Center", I summarized "Wins", "Challenges", and "Next Steps".

For "Wins", mention team members by name. This is an opportunity to highlight valuable work done by data scientists and engineers who rarely interact with the C-suite. This was important at Prometheus because the C-suite was on-site but our team was distributed.

For "Challenges", surface issues that you want leadership to be aware of, or better, help you solve. Examples include lack of resources, an unresponsive collaborator, or a decision that involves tradeoffs to another team.

For "Next Steps", I listed 2-3 upcoming milestones. I omitted future goals that were months away or abstract. I like accountability so I was precise with who owned each next step, and the date of expected completion.

Initially I wrote the digest, circulated to my team for feedback, and sent it out. Over time, I delegated more.


## Conduct monthly retrospectives with your team to reflect and learn.

Every month, the DSE team met (over Zoom) to hold a retrospective (retro, for short). We covered three topics:

1. Rose - what is going well?
2. Thorn - what is going poorly?
3. Bud - what should we change?

I opened a templated Notion page and shared the link. Each section had subsections with every team member's name. We would spend 10 minutes typing bullet points in silence. Next, we'd go around the room and talk through each bullet point.

My reports gave me permission to share our retro notes with anyone else in the company. The Notion pages were accessible by anyone with a Prometheus login. I occasionally sent retro notes to our CSO, CEO, or DSE Advisors so they had a sense of "boots on the ground", but most of the utility was within our team.

Your team members do not just want to "be heard". They want their boss to act on their suggestions and solve problems. I prioritized acting on what I learned in retros. We changed many team norms - such as Git branch management - as a result.

Retros are a powerful and fun tool for teams with a culture of candor, trust, critical feedback, and positive intent. If your corporate culture is lacking in these areas, you have bigger problems that won't be solved by a popular management framework or 1-on-1 template.


## Biotechs buy, tech firms build.

Your decision to build versus buy depends on how your firm generates value, what you promised your investors, who you hired, and the culture you already built. We built a lean, focused platform and bought assistance.

In the early days, we explored a vision of creating the world's largest and best-curated IBD database, alongside novel computational tools to support new target discovery. This ambition would require a larger investment and more time than originally planned.

To adddress this mismatch, we reduced scope. The platform would support target validation, MoA studies, and CDx development. We also engaged consultants to help us curate data, develop bioinformatics pipelines (e.g., genomic imputation), and build our CDx pipeline (e.g., supervised ML to find SNPs associated with proxies of treatment response).

In hindsight, this path better fit our eventual outcome. However, it was a tough reality check for me. We could have better aligned our branding to emphasize we were a biotech with data science and engineering interests, not a "techbio" firm. Or maybe it was clear to everyone else and I was in my own waking dream.

As we worked with consultants, we learned lessons we wish we knew earlier. Initially, we loosely defined project scopes to be a flexible partner. We assessed competitors and signed with the one that looked best on paper. We gave regular feedback so they could converge on our preferred working style. We were gentle and understanding if they missed a deadline or had resource constraints. But then we got smarter and developed some process.

Later, we provided detailed project proposals and defined milestones. We conducted head-to-head (paid) pilots to compare competitors. We defined *how* we wanted them to work with us -- commit code in GitHub, track work in issues, etc. We held consultants accountable to commitments and parted ways if they failed. When evaluating new consultants, we indexed on compatibility of working style, tech stack, and energy.

We worked with superb partners such as Recursis, Rancho, Bridge Informatics, Code Ocean, and Manifold. Working with the best people is expensive but worth every cent. Bad consultants end up more expensive by wasting your time and patience. I recommend avoiding Genedata.


## Track work in a single source of truth. 

We used (and loved!) Notion for documentation, meeting notes, onboarding, etc., and GitHub Issues for tracking technical work. Tasks were categorized into `TODO`, `In Progress`, and `Done`. Every two weeks we opened the board, groomed the backlog, and synced on current priorities. However, the data scientists and data curators could not close issues via PRs since their deliverable was often solved without a pull request (PR). 

To remedy this gap, we migrated work tracking into Notion. Every task had a link, every person had a view of the task table, all tasks had due dates, and the board could be viewed as a timeline with one click. If anyone at Prometheus wanted to know what Mark was working on, or what Sarah was blocked by, they could go to a Notion page and in a few clicks see the same content as anyone else.

A pattern to avoid is to email or direct message the question, "what is the status of X?". Instead, go to the Notion page for the task and leave a comment.

Your org might use Jira, Asana, or Monday instead of Notion. The exact tool doesn't matter. What matters is if your entire team tracks their work in the same place. No work lives outside of the app, and all work inside of the app is current.

Tracking work in Notion beats emailing timelines in Powerpoint and tables in Excel. It aligns people without the pain of scheduling a meeting across time zones. Yet, if you work in biotech, you will encounter people who will request a slide with timelines and updates via email. Unless you are the founder or CEO, you don't have the mandate to change how people work. They are trying to accomplish something Screenshot your timeline and send them the slide they need. But also send them the Notion link and gently educate. Have empathy for those who have not yet seen the light.

Ben Balter's post on [Why you should work asynchronously](https://ben.balter.com/2022/03/17/why-async/) is required reading for technical leaders.


## Define words, norms, and workflow when you work with biotech people.

Biotechs employ scientists, accountants, manufacturing specialists, lab managers, lawyers, medical affairs specialists, software developers, etc. It is a naive mistake to think everyone shares an understanding of words, norms, and workflow. The experiences that correct this mistake are surprisingly painful.

Technical people call input data "data", and outputs of computational manipulations "output" or "results". Biotech people call results "data".

Technical people call an entity or object an "artifact". Biotech people call noise or error "artifact".

Technical people call a sequence of computational manipulations a "pipeline". Biotech people call a portfolio of therapeutic programs (e.g., drug candidates) a "pipeline".

Technical people think a deliverable is a pull request describing a new or changed capability. Biotech people think a deliverable is a Powerpoint slide or deck describing a scientific result.

Technical people think a platform is ... well, there is no definition, so the lack of clarity around this useless word is almost expected. But I noticed technical people thought about scalable software ("our platform of data and apps") whereas biotech people thought about expert human labor ("our platform of immunologists who review literature for new targets").


## Build an advisory board.

There are many smart, experienced, and supportive people with expertise in data science and software engineering within the context of biotech. Maybe you report to the CTO and have a board member or collaborator with a storied history at the intersection of technology and life science. I was not in that type of situation, so I recruited some mentors to the Prometheus Data Science Advisory Board. These advisors were distinct from our Scientific Advisory Board.

Advisors signed a mutual NDA and were compensated with hourly pay. Prometheus declined to compensate these advisors with equity, which was unusual; for more info about compensation, read this useful article by Halle Tecco, [On Being a Startup Advisor](https://www.halletecco.com/blog/on-being-a-startup-advisor).

In hindsight, I wish I approached my advisors like a medical doctor engages specialists -- [by calling a consult](https://www.boardvitals.com/blog/calling-a-consult/). Rather than an unstructured quarterly catchup, I should have asked more specific questions and provided necessary information and context.

Bad: "What do you think about biobanks? Would love some advice."

Better: "We must accomplish X scientific goal by 2024Q2. I think doing Y is possible with Biobanks Z1, Z2, or Z3. We only have budget and time to access one biobank. Our concerns are [insert list here]. I think we should proceed with Z2 because [reasons]. What else should I consider?"

I also wish I convened the entire DSE advisory board in the same room (or at least Zoom call). Smart people feed off each other's energy and stronger ideas can emerge from the interactions.


## Prepare for enormous friction from legacy systems, file formats, and workflow.

> Still in progress.

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
