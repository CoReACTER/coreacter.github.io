+++
title = "Research"
hascode = true
date = Date(2024, 6, 16)
rss = "A description of the research that happens in and around the CoReACTER. We focus primarily on computational and data chemistry, supplemented and supported by (mostly high-throughput) experiments. We work on method development, but our efforts are generally focused on applications related to sustainability. Currently, we are thinking about battery energy storage, electrocatalysis, and plastic waste management."

tags = ["research"]
+++

# Research

\toc

## Chemical Data and Software

We develop and contribute to a range of datasets and software packages, providing new tools for the community to use to address diverse chemical problems.

To maximize utility, we focus on making our datasets [FAIR](https://www.nature.com/articles/sdata201618) (findable, accessible, interoperable, and reusable). To date, our data generation efforts have been focused on computational data generated using methods such as high-throughput density functional theory (see Prof. Spotte-Smith's work on the [Materials Project](https://doi.org/10.1039/D3DD00153A)). However, we are interested in developing experimental datasets as well, for instance leveraging the [CMU Cloud Lab](https://cloudlab.cmu.edu/).

In line with our commitment to [open science](/philosophy/openscience.md), we ensure that all of the data that we produce and contribute to is freely available to the community, generally via permissive [Creative Commons licenses](https://creativecommons.org/), and we only contribute to open source software projects.

## Data Science for Reactivity

The CoReACTER is broadly interested in explorations of chemical transformations. We see many opportunities to leverage machine learning (ML) and data science to make our studies faster and more efficient, and to allow us to obtain insights that would be impossible using conventional methods.

Machine learning interatomic potentials (MLIPs) are ML models that are trained to predict the energies of molecules and materials given their elemental species and atomic positions. We are currently investigating ways to apply MLIPs to automatically construct and analyze chemical reaction networks (CRNs). We are also working to develop new MLIPs that are more flexible and better suited for complex reactive chemistry. In particular, we are interested in strategies to incorporate spin and charge information in MLIPs so that they can differentiate between systems at different spin and charge states.

We are also interested in combining high-throughput experimentation (HTE) with ML-based optimization to discover new reactions and optimize product yields. HTE, either using lab-scale liquid handlers or full-scale autonomous lab systems, offers a means to rapidly explore chemical space. However, even with high-throughput methods, it is often difficult or impossible to thoroughly search the domain of interest, making methods to effectively select promising experiments crucial. 

## Understanding Materials Synthesis

Materials synthesis is a field driven by empiricism and lacking in predictive theory or well-founded design rules. Trial-and-error experiments are expensive and time-consuming and are unlikely to yield optimal synthesis recipes. And while recent years have introduced a range of computational approaches to predict synthesizability and suggest precursors for synthesizing stable and metastable target phases, they have to date been limited by a near-exclusive focus on bulk thermodynamics, ignoring such important aspects as mass transport, kinetics, surface and grain boundary effects, defects, and the synthesis environment.

Our approach is to leverage molecular dynamics (MD) using MLIPs to simulate solid-state reactions, thereby allowing for the direct prediction of transport and reaction kinetics while accounting for a range of complicating variables (e.g., impurities, defects, crystallographic orientations, fluid environments, etc.). This dynamics-based method will allow us to explain observed synthesis outcomes, including the presence of impurity phases and the order of phase emergence. Combining this approach with bulk thermodynamics calculations and CRNs, we can also improve materials retrosynthesis, predicting which precursors and reaction conditions will produce target phases with high purity and low energy and time input.

## Electrochemical Transformations

Electrochemistry is well poised to help us reduce greenhouse gas emissions and mitigate the disastrous effects of anthropogenic climate change. Battery energy storage is replacing internal-combustion engines in vehicles and is helping to store excess solar and wind energy in the power grid, while electrocatalysis could potentially replace traditional thermochemical synthesis routes to feedstock chemicals (e.g., ammonia) and value-added products.

Unfortunately, electrochemical reactions are in general less well understood than thermochemical organic reactions, and as a result, progress towards next-generation energy-dense batteries and efficient electrosyntheses is slow. We believe that CRNs informed by first-principles simulations can change this and drive electrification forwards. We use CRNs to identify reaction mechanisms and understand what is going on in complex environments, such as the solid electrolyte interphase (SEI) in metal-ion batteries. By comparing the outcomes of different simulations, we can also leverage CRNs as an electrochemical design tool.

To get an even deeper understanding of complex electrochemical phenomena, we also turn towards multi-scale modeling. Generally, this involves using first-principles thermochemistry and kinetics to inform mesoscale (*e.g.* kinetic Monte Carlo) and continuum-scale models that can access experimentally relevant time scales and connect with key device-level observables.

## Managing the Plastic Waste Crisis

Currently, humans produce about 200 million tons of plastic waste every year. That plastic takes up space in landfills, damages fragile ecosystems, and harms human and non-human health. We're interested in making plastics more sustainable. We are working to design catalysts that can convert common polymers like polyethylene and polypropylene into valuable chemicals, providing an economically viable route to eliminate waste from landfills. We're also interested in designing new polymers that can easily be chemically or biochemically decomposed!

To tackle these challenges, we're most interested in leveraging HTE and ML. We may supplement our experimental studies with mechanistic studies using quantum chemical and dynamical simulations.