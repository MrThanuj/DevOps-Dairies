# So What Actually *Is* DevOps?

I just wrapped up the first lecture of my DevOps Bootcamp, and I wanted to jot down what stuck with me. Partly to lock it in, partly to share with anyone else starting this journey.

## The problem DevOps was invented to solve

Before DevOps was a "thing," software teams were split into two separate worlds:

- **Development**: writing code, fixing bugs, shipping new features. Their whole incentive was speed, get new stuff out the door.
- **Operations**: running the servers, deploying software, keeping production stable. Their whole incentive was the opposite: don't break anything.

Put those two mindsets in a room together and you get friction. Devs want to move fast, Ops wants things to stay calm, and in between them sits a pile of manual checklists, manual deployments, and manual configuration. All of that manual work is slow, and it's exactly where releases get stuck.

## The "aha" moment: DevOps isn't a tool, it's a bridge

The simplest definition is almost too simple: **DevOps is the intersection of Development and Operations.**

But the more useful way to think about it is this: *DevOps is about making the release process fast and low-error, by removing the roadblocks between writing code and running it in production.*

It's less "one team learns to do the other team's job" and more "let's build a shared, streamlined process so speed and stability aren't fighting each other."

## Where "DevOps Engineer" comes from

Over time, this way of working turned into an actual job title. Sometimes it's a developer who picks up ops skills, sometimes it's an ops person who leans into automation, and sometimes it's a dedicated DevOps Engineer sitting between both worlds. Whoever it is, their job is the same: build a fully automated, repeatable release process instead of relying on manual steps.

## The toolbox behind the buzzword

What really made this click for me was seeing the pieces line up into a pipeline:

**Commit > Test > Build > Push > Deploy**

![DevOps pipeline: Commit, Test, Build, Push, Deploy](devops-pipeline.svg)

And each stage has its own category of tools:

- Source code management (Git)
- Package management (Docker)
- Infrastructure as Code (Terraform, Ansible)
- CI/CD (Jenkins, GitLab)
- Container orchestration (Kubernetes)
- Cloud platforms (AWS, Azure, Google Cloud)
- Monitoring (Prometheus)

None of these tools *is* DevOps on its own. They're just the technology that makes the DevOps way of working possible.

## My takeaway

This first lesson was the 30,000-foot view: understand *why* DevOps exists before diving into *how* to do it. Every tool I listed above is apparently its own rabbit hole we'll unpack later in the bootcamp, so for now, I'm just happy to have the big picture straight in my head.

---

*Notes based on the "Introduction to DevOps" lecture from the DevOps Bootcamp by [TechWorld with Nana](https://www.techworld-with-nana.com/).*
