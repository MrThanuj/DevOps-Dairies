# Virtualization: How One Machine Pretends to Be Many

Your laptop can run a whole separate computer inside itself, and not notice

Right after operating systems, the bootcamp moved into virtualization. This is one of those topics that sounds intimidating until you realize you've probably already used it (anyone who's run a Windows app on a Mac has touched this).

## What a VM actually is

A **virtual machine (VM)** is a computer that exists only as software, running on top of a real, physical computer. It has its own OS, its own CPU allocation, its own memory, its own storage, all "borrowed" from the host machine.

The key word is *borrowed*. If your laptop has 8 GB of RAM total, and you give a VM 4 GB, your host OS is left working with the other 4 GB. Resources are shared, not duplicated. You can't hand out more than you actually have.

The VM is also fully isolated. It can't reach into your host system's files or mess with your main OS. Whatever happens inside the VM, stays inside the VM. That's exactly why it's the go-to way to safely experiment.

## The piece that makes it possible: the hypervisor

Sitting between the host and the VM is a piece of software called a **hypervisor**. It's the thing actually managing which hardware resources go where.

There are two types, and the difference is where they sit:

- **Type 1 (bare metal)**: runs directly on the hardware, no host OS underneath it. This is what cloud providers use, since it's built for squeezing maximum performance out of big servers. Examples: VMware ESXi, Microsoft Hyper-V.
- **Type 2 (hosted)**: runs as a program inside a regular OS you already have installed. This is what you'd use on your own laptop to learn and experiment. Examples: Oracle VM VirtualBox, Parallels.

For this bootcamp, we're using Type 2, specifically VirtualBox, since the goal is learning, not running a data center.

## Host OS vs Guest OS

Two terms that are easy to mix up:

- **Host OS**: the operating system running directly on the physical hardware. This is the OS you booted into normally.
- **Guest OS**: the operating system running inside the VM.

So on my machine: my regular OS is the host, and the Ubuntu VM I'm about to spin up is the guest.

## Why anyone bothers with this

A few reasons virtualization stuck around and became a foundational idea in DevOps:

- **Security**: isolate risky or untrusted software without touching your real system.
- **Speed**: spinning up a VM takes minutes. Buying and racking a new physical server does not.
- **Cost**: one big physical server can be sliced into many VMs, so hardware doesn't sit idle.
- **Portability**: a VM can be exported as a single file (a VMI, Virtual Machine Image) that includes the OS and everything installed on it. That file can be copied, backed up, or handed to someone else, and it'll boot exactly the same way elsewhere.

That portability point is really the seed that later grows into containers and Docker, more on that once the bootcamp gets there.

## Where this is heading

Next step after the theory: actually installing VirtualBox and spinning up a Linux Ubuntu VM, so all of this stops being diagrams and starts being something I can poke at directly.

---

*Notes based on the "Operating Systems & Linux Basics" lecture from the DevOps Bootcamp by [TechWorld with Nana](https://www.techworld-with-nana.com/).*
