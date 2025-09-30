#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.6.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "utils.typ": *

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
    duration-minutes: 30,
    start-time: datetime(hour: 14, minute: 10, second: 0),
    end-time: datetime(hour: 14, minute: 40, second: 0),
    last-minutes: 5,
    note-font-size: 12,
    disable-markdown: false,
    default-transition: (
      type: "push",
      duration-seconds: 2,
      angle: ltr,
      alignment: "vertical",
      direction: "inward",
    ),
  )

// Theorems configuration by ctheorems
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(
    // handout: true,
    preamble: pdfpc-config,
    show-bibliography-as-footnote: bibliography(title: none, "bibliography.bib"),
  ),
  config-info(
    title: [Engineering Collective Systems in the Wearable Edge-Cloud Continuum: Models and Platform],
    subtitle: [Second Year PhD Presentation -- Cycle 39],
    author: author_list(
      (
        (first_author("Nicolas Farabegoli"), "nicolas.farabegoli@unibo.it"),
      )
    ),
    date: datetime.today().display("[day] [month repr:long] [year]"),
    institution: [University of Bologna],
    // logo: align(right)[#image("images/disi.svg", width: 55%)],
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 18pt)
#show math.equation: set text(font: "Fira Math")

#set raw(tab-size: 4)
#show raw: set text(size: 1em)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: (x: 1em, y: 1em),
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.75em)
#show footnote.entry: set text(size: 0.75em)

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

// == Outline <touying:hidden>

// #components.adaptive-columns(outline(title: none, indent: 1em))

= Background and Research Context

== Collective Systems in the Wearable Edge-Cloud Continuum

#components.side-by-side(columns: (2fr, auto))[
  #underline[Collective systems] are large-scale systems composed of several
  #bold[interconnected devices] that interact and collaborate to
  achieve *global common goals*.

  Traditionally, collective systems are considered as a "flat" network of devices, but the emergence of #bold[wearable devices] and the #bold[edge-cloud continuum] opens new research challenges and opportunities.

  In this new domain, the network is *highly heterogeneous* in terms of device capabilities, and the #bold[network topology] is #underline[dynamic], #underline[unpredictable], and #underline[multi-level].
][
  #figure(image("images/edge-cloud-continuum.svg", height: 60%))
]

== Research Topics

#components.side-by-side[
  // To exploit the *potential* of collective systems in the wearable edge-cloud continuum, my research focuses on #bold[three] main topics:

  === Languages
  Designing #underline[domain-specific languages], #underline[type systems], and #underline[LLMs] to provide *high-level abstractions* for engineering _Collective Systems_.

  === Reconfiguration
  Developing #underline[adaptive] and #underline[resilient] algorithms for the *self-management* of _Collective Adaptive Systems_ in the Cloud-Edge Continuum.

  === Infrastructure and Deployment
  Developing #underline[efficient] and #underline[scalable] infrastructure solutions for *deploying* and *managing* _CASs_ in the _ECC_.
][
  #figure(image("images/research-topics.svg", height: 80%))
]
