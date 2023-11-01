---
layout: post
title: 10 Tips for Leading Data Teams in Biotech
tags: 
---


> This blog post is a work in progress. Need to cut one topic to bring 11 down to 10.

> Alternate title: "How to operate as a technical leader in a biotech"


## You

You are a technical leader at a biotech startup. Perhaps your job title is Director, or VP of Data Science / Machine Learning / Engineering, or CTO / CDO. Your company wants to develop a "platform" or "engine", an exciting opportunity that is now your responsibility. This post is for you. Here I share ten tips that I hope you find useful on your path to success.


## Background

In early 2021 I joined Prometheus, a small biotech startup, as employee #27 and the head of data science and software engineering ("DSE"). Our mission was to develop precision therapeutics for autoimmune disease, with an initial focus on inflammatory bowel disease (IBD). Fresh off a $130M fundraise, we had a validated drug target (TL1A), a pipeline of antibody candidates, and an exclusive license to data and samples in the Cedars-Sinai Medical Center's IBD biobank. However, we lacked technical talent, curated data, and compute infrastructure to support our ambitions of precision medicine, as outlined in press releases at the time:

> The company's precision medicine platform, Prometheus 360 (P360), combines proprietary bioinformatics discovery methods with one of the world's largest gastrointestinal bioinformatics databases to identify novel therapeutic targets and develop therapeutic candidates to engage those targets.

My job was to build this. Over the next two years, we defined the product roadmap, recruited a small but stellar team of data scientists and software engineers, stood up our cloud architecture, and ingested terabtyes of multimodal biological data. Our infrastructure, capabilities, and expertise enabled target validation and companion diagnostics (CDx) development.

In March 2021, we went public (with the ticker `$RXDX`), announced positive phase 1 data, and expanded indications to systemic scleroderma. At the end of 2022, we announced positive phase 2 data in IBD. In 2023, after two years as the best-performing biotech stock, we were acquired by Merck for $10.8B. This outcome was a win for patients and shareholders, but the journey was not without adversity, tribulation, and failure. Although your context will differ from mine, I hope this list of "things I wish I knew" serves as a helpful resource.


## Table of Contents

> To add when draft is finalized.
>

## 1. Inform the company of your team's progress via a biweekly digest

Every two weeks I wrote and shared a "DSE Digest" to our VPs and C-suite. This cadence aligned with our sprint length and balanced speed with substance. I covered 5-7 topics per digest. For each topic, e.g., "Data ingestion and curation from Cedars-Sinai Medical Center", I summarized "Wins", "Challenges", and "Next Steps".

For "Wins", highlight team members by name. This is an opportunity to highlight valuable work done by data scientists and engineers who rarely interface with the c-suite. This was especially important at Prometheus because the C-suite was on-site but our team was distributed.

For "Challenges", I surfaced issues that we needed leadership to help us solve, such as a lack of resources or an unresponsive collaborator (especially if within our company). 

For "Next Steps", I listed 2-3 upcoming milestones. I omitted future goals that were months away or abstract. I like accountability so I was precise with who owned each next step, and the date of expected completion.

I realized (painfully late in my tenure) nobody else really cares about platforms, infrastructure, and capabilities. We found the best way to convey value of platform work was by connecting every bullet point in the digest to the relevant therapeutic program, and how the capability mattered for the top-line goal.

For example, our Principal Software Engineer rewrote our genetic imputation pipeline to be 200x faster. This statistic alone is robust justification of the work if you are an engineer. But nobody else cared until they realized turnaround time from new sequenced samples to results was now 1 hour instead of 1 week. This much faster QC iteration time enabled us to find and correct several key errors in both the upstream sample handling process and the computational pipeline. This enabled us to achieve the desired statistical power for our CDx work related to our lead program.

I emailed a link and also attached the exported PDF if readers preferred that, e.g., were on a plane flight without internet access.

At first, I wrote the entire digest, circulated to my reports for feedback, and sent it out. Over time, I delegated more and more of the digest to my reports. The topics also eventually stabilized into our ~5 platform-related goals. The digest became the channel for each goal owner to share progress with the company.


## 2. Conduct monthly retrospectives with your team to reflect and learn.

I first experienced this reflection / ritual / group therapy session at the Broad Institute as a collaborating member of the Machine Learning For Healthcare team, led by Puneet Batra. I immediately loved it, and later brough it to Prometheus.

Every month, the DSE team met (over Zoom) to hold a retrospective (retro, for short). We covered three topics:

1. Rose - what is going well?
2. Thorn - what is going poorly?
3. Bud - what should we change?

I opened a templated Notion page and shared the link. Each section had subsections with every team member's name. We would spend 10 minutes typing bullet points in silence. Next, we'd go around the room and talk through each bullet point.

I obtained permission to share retro notes with anyone else in the company. The Notion pages were accessible by anyone with a Prometheus login. I occasionally sent our notes with our CSO, CEO, or DSE Advisors so they had a sense of "boots on the ground", but most of the utility was within our team.

Your team members do not just want to "be heard". They want to see their managers act on their suggestions and solve problems. I prioritized acting on what I learned in retros. We changed many team norms - such as Git branch management - as a result.

Retros are a powerful and fun tool for teams with a culture of candor, trust, critical feedback, and positive intent. If your corporate culture has issues with these factors, you have bigger problems that are not solved by a popular management framework or 1-on-1 template.

You can also do a focused retro (sometimes called "post-mortems") after finishing a big sprint, technical milestone, or project. Pre-mortems are a fun variation where a project is kicked off by hypothesizing the reasons it might fail.


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
