+++
title = "On the Properties of Gender Spaces"
hascode = true
date = Date(2025, 4, 28)
rss = "EWCSS attempts to construct a framework for gender based on the mathematical concept of space. Drawing from Eve Kosofsky Sedgwick, as well as other theorists such as Judith Butler, they consider how gender categories are constructed from our fluctuating experience of gender, the cultural relativity of gender, and various elements of gendered perception."

tags = ["gender", "geometry", "space", "philosophy"]

blog_post_title = "On the Properties of Gender Spaces"
blog_post_date = Date(2025, 4, 28)
blog_post_author = ["ewcss"]
blog_post_preview = "EWCSS attempts to construct a framework for gender based on the mathematical concept of space. Drawing from Eve Kosofsky Sedgwick, as well as other theorists such as Judith Butler, they consider how gender categories are constructed from our fluctuating experience of gender, the cultural relativity of gender, and various elements of gendered perception."
blog_post_image = "20250428_on_the_properties_of_gender_spaces/gender_toc.png"
blog_post_image_alt = "A 3D plot with axes labeled 'masculinity', 'femininity', and 'androgyny' and a rough, bumpy, but somewhat spherical shape plotted. A point is circled; an arrow and text reading 'You are here' indicate the circle. To the left of the plot are the transgender, nonbinary, and intersex pride flags, along with the words 'Enter the Gender Space'."
+++

# On the Properties of Gender Spaces

As a first-year student at Columbia University,[^1] I was required to take a writing seminar. Most engineering students tried their hardest to take a seminar focused on technical subjects. For reasons that now make a lot of sense but perhaps didn't at the time, I eagerly enrolled in a seminar focused on gender and sexuality.

This course would be my first exposure to the work of Audre Lorde, Susan Sontag, Jack Halberstam, and Judith Butler, among other powerful thinkers in the areas of feminism, gender theory, and queer theory. But among our many readings, one that I keep returning to is Eve Kosofsky Sedgwick's "Gosh, Boy George, You Must Be Awfully Secure In Your Masculinity!".[^2]

"Gosh, Boy George" is a short but somewhat meandering piece in which Sedgwick considers masculinity and femininity, drawing both on the titular [singer-songwriter](https://en.wikipedia.org/wiki/Boy_George) as well as her own gendered experiences. What hooked me in, and what found this essay a permanent seat in my memory, was when she stepped out of her comfort zone in critical theory and into the realm of mathematics, of *space*:

> **Masculinity and femininity are in many respects orthogonal to each other.** Orthogonal: that is, instead of being at opposite poles of the same axis, they are actually in different, perpendicular dimensions, and therefore are independently variable. [...] If we may be forgiven a leap from two-dimensional into *n*-dimensional space, I think it would be interesting [...] to hypothesize that not only masculinity and femininity, but in addition effeminacy, butchness, femmeness, and probably some other superficially related terms, might equally turn out instead to represent independent variables --- or at least, unpredictably dependent ones.

I thought it was brilliant, the most exciting and powerful lens on gender that I had ever read.[^3] I was buzzing after finishing the article, and I probably read it twice more within a week.

## Gender for STEM Majors

Since I read "Gosh, Boy George" nearly ten years ago, I've brought it up at parties, over drinks, on dates, and elsewhere countless times, often when talking to mathematicians, scientists, and engineers.

As a queer and genderqueer person and feminist ally, I want -- perhaps need -- people to understand gender. This is especially important in a historical and political moment in which the very concept of gender is under attack by the Right.[^4] To provide an understanding, to me, means complicating binary understandings of gender, deconstructing gender essentialism, and creating space for the possibility of transness and gender non-conformity. But to do that effectively, I cannot just rip the rug out from under people and tell them that all that they have believed in a lie, a convenient and powerful illusion (Butler has recently adopted the term "phantasm").[^4] I (or anyone making such an argument) must build a new foundation, a new structure to hold thought and discussion about these concepts. That's where Sedgwick's article comes in.

There's an appeal to "Gosh, Boy George" that I think anyone could get behind. Humans are visual creatures gifted at recognizing patterns and finding meaning through analogy. Gender, being an abstract, fundamentally invisible thing,[^5] begs for metaphor, ideally a tangible metaphor, to make it more readily available for examination. This partially explains the conflation of sex and gender that is so pervasive in Western discourse. Sex, while still much messier and more difficult to pin down than most believe,[^6] can be defined in physical, biological terms: hormones levels, chromosomes, gonads, and the like. Though not typically described in these terms, sex acts a metaphor for gender; by conceptually binding sex to gender, one makes the abstract concrete. Reading Sedgwick reveals the possibility of an alternative. Gender is not sex, is not XX or XY chromosomes, nor is it a binary or a spectrum with masculine on one side and feminine on the other. Rather, it is a multi-dimensional space.

Most people do not think in terms of orthogonality and high-dimensional space. While Sedgwick can be helpful to the average person, hers might not be the right metaphor for everyone. But I suspect that it is the right metaphor -- or, at least, a very good one -- for STEM-y folks. Mathematicians can think of the space defined by $\mathbb{R}^N$ for some large $N$. Data scientists and chemical engineers can think of the loss landscape of an optimization problem or a machine learning model. As a chemist, I got used to thinking in high dimensions because of quantum mechanics, where orthogonality is a central feature. And so on.

This essay is written to my fellow scientists and engineers, some of whom may not think frequently about gender, may never have read any gender theory, may never have thought deeply about gender at all! My goal is to expand upon Sedgwick's ideas, fleshing them out in such a way as to ground discussions of gender in and around the sciences. I don't expect it to be perfect (after all, it is a metaphor), but I hope it will be a helpful conceptual and rhetorical tool.

## There Is Not One Gender Space

The first point to clarify is that, in this discussion, I am not describing a single, static space, nor do I think that Sedgwick would have supported such a view. Rather, a gender space can be constructed from a non-unique (but non-arbitrary) *basis*. Whether we think of Sedgwick's gender space as ontological (defining in what way people *are* gendered) or perceptual (describing how gender can be *observed*), such a space is certainly socially constructed. Some of the axes that Sedgwick suggests are historically recent developments (*e.g.*, "femmeness" as distinct from "femininity"), and others originated in the West and may not be salient or useful in other cultures (*e.g.*, butchness, a term which emerges from Western sapphic culture) or which are reserved for certain sub-populations (*e.g.*, stud-ness, where "stud" is a term used to describe masculine Black lesbians).

Recognizing that there is not a unique construction for gender space(s), this article cannot hope to describe the specific features of (a) gender space. Rather, the best that I can do is consider general features that hold (I suggest) for arbitrary gender spaces.

## Human Genders Are Functions, Not Points

Most people view most of their identities as static, and this includes gender. In the metaphorical gender space, this would imply that individuals occupy fixed points.

As an example, consider someone who is assigned male at birth and socialized and raised as a boy. This boy may view their (his) gender as constant, perhaps because the labels used to describe him are (mostly) constant and because of an implicit or explicit linking of gender and a supposed biological reality. We can assume without loss of generality that this boy is relatively masculine (*i.e.*, his supposed gender-y point is high on the "masculinity" axis) and is not particularly gender-y along other axes such as femininity and androgyny.

Even in this most normative example (in the contemporary Western context), gender identity is not fixed. As the boy grows up, he will eventually become a man, with distinct gender roles and expectations placed on him. Whereas young boys are expected to express a wide range of emotions, the range of normative emotional experiences for men is more narrow. Men are expected to labor to support a nuclear family based around a heterosexual marriage, while a boy has obligations mainly to his parents and perhaps other elders. And so on.

We can better understand an individual's gender as a function. This function generally varies with time, as the preceding example shows, but it can also vary as a result of environmental factors. One's experience of gender -- and, thus, one's gender-function -- may change as a result of the clothes and accessories they wear, the way they style their hair, and/or their make-up (see: drag queens and kings). One's body can also impact gender, which motivates many transgender, nonbinary, and genderqueer individuals to seek affirming hormone replacement therapy, surgery, and other treatments leading to body modifications. Finally, a range of contexts outside of the self can influence the value of one's gender-function.

A mathematician or physicist might at this point ask: what can we know about gender-functions? How do they behave?

Typically, gender-functions vary continuously -- that is, one's experience of gender does not jump and change suddenly. This means that, if one so desired, one could track gender derivatives -- how one's gender varies with time or other factors along each chosen axis. However, I note that there are exceptions where one's gender may be discontinuous. For instance, some gender-affirming surgeries create discontinuities in gendered experience.

While each person's gender varies, mostly this variance is bounded; that is, each person experiences only a limited range of gender(s). From these boundaries, we can define a shape, a gender-y manifold in our high-dimensional space. Gender itself might be constantly changing, but these gender-y manifolds are (more) stable, varying infrequently (for most, at least; some genderfluid individuals might describe even their bounds as changing wildly over time). In this extended metaphor, these manifolds represent *gender identities* or *gender categories*. Our archetypal man, mentioned above, defines himself as "man" and views that definition as stable, in spite of the unstable nature of gender, because he considers only the manifold and not the function that produces and defines it.

## Gender Perception Is Projection

To this point, we have mostly considered an individual's gender -- that is, how do they view themselves, and what is their internal conception of themselves as gendered beings? But equally important in this discussion, particularly in light of the ongoing attacks against transgender, genderqueer, and gender non-conforming individuals, is how one's gender is perceived by others.

We cannot under any circumstances know the entirety of anyone else's gendered experience (*i.e.*, we cannot perfectly perceive their gender-y manifold), and we certainly cannot locate someone else's gender definitively in any time and context.[^7] While I am not so confident on this point, it seems plausible to me that one cannot even perfectly know one's own gender-function, though such self-knowledge can certainly be improved through reflection. Gendered perception therefore always involves a loss of information. At the same time, the observer and the observed may exist in different gender spaces, using different bases. Accordingly, we can think of perception of someone else's gender as a projection, possibly coupled with a coordinate transformation.

Often, our projections flatten gender-y manifolds, lowering their dimensionality. This flattening occurs whenever a gender non-conforming individual is perceived by someone who believes in (and can thus conceptualize) only two gender categories. Whatever their manifold actually looks like, it will be squashed into a two- or even one-dimensional space, projected in such a way that it appears either as "man" or "woman". But make no mistake; flattening and down-projection can occur to anyone by anyone, even when one genderqueer or gender non-conforming person observes another. As data scientists know well, dimensionality reduction is _simplification_, and (over-)simplification can happen even with the best intentions and a high degree of empathy.

On the other hand, it is possible to project someone else's gender-y manifold into a higher dimension. This does not (necessarily) amount to an increase in information _per se_. All gender observation is lossy; the gender uncertainty principle has no exceptions. However, such an up-projection will often result in an increased in _perceived complexity_. A nonbinary person who has put in significant work to understand gender and to deconstruct their learned binary viewpoint may infer a degrees of non-conformity in the gendered experience of a self-described binary cisgender or transgender person. That perspective, that projection, is not more necessarily more true than the binary interpretation,[^8] but it is messier, more nuanced.

## Two (or _n_) Gendered Perceptions May Be Better Than One

As I mentioned, it is very possible that no amount of work allows one perfect knowledge of a gender-function or gender-y manifold, and a single projection always entails a loss of information. But what about multiple projections? Multiple people interacting with a gendered person will have different perceptions, perhaps subtly, perhaps radically. One observer might perceive the same gendered person differently at different points in time or in different contexts.

This multiplicity of projections can be valuable. By observing a gender from multiple perspectives, one can get a better sense of it, approaching complete knowledge if never reaching it. For an external observer, this might enable greater understanding, sympathy, or empathy. For the gendered individual themselves, seeing how one is seen can enhance self-knowledge. This is why many trans people "try out" new names, new pronouns. They offer new perspectives for their friends, families, and loves, and then they see if the resulting projections resonate with their own internal understanding of their gender-y manifold. As a personal example, I came to be more confident in my understanding of myself as transfeminine when I realized that I enjoyed when others "mistook" me as a woman, projecting my gender into the "wrong" category.

Of course, knowledge can be either beneficial or harmful. If a trans boy is constantly being perceived as a girl, he might come to a stronger sense of identity through the constant dissonance. But understanding his gender as being greatly different from how it is projected by those around him does not make it any easier to go through life with the resulting dysphoria and may in fact make things much worse.

## Gender Metrics

A *metric space* is a space where there is a well-defined notion of *distance* between points. In common usage, we can see that even the smallest gender spaces are metric; one might say that "boy" is far away from "woman" but relatively close to "man".

The notion of distance is important in our everyday social experience of gender. Many people experience homophily -- that is, they are attracted to others who are like them. Gender is one (though certainly not the only) category with which folx experience homophily. Implicitly, homophily requires that we can compare our genders to others, to assess who is most similar to us or, from an opposite perspective, to find where we belong.

A metric space does not necessarily have only one valid metric. Just as, in Euclidean spaces, we can use the Euclidean distance, the taxicab distance, or the Chebyshev distance, among others, so too can we define different metrics for gender spaces. This is also socially important. Though we rarely express it explicitly, different people may use different gender metrics, resulting in different assessments of who (should) belong with whom. A trans woman, using one metric (say, something like the Euclidean metric, which equally considers all gender-y dimensions) may understand that they are very similar to cisgender women. However, a cisgender woman may reject this understanding if she is using a different metric that (for instance) privileges certain gender-y aspects such as genitals.

Given that there could be many gender metrics, which should we use? Is one "better" than others? As is the case in geometry, I would say that there is no single, simple answer. Different metrics may be more valuable in different contexts, and it is not obvious to me that any one choice is generally "better" than another. You may ask, "but then, how should we determine the distance between genders or between gendered individuals?" My answer: however you want! You don't need to change anything about your use of gender metrics if you don't want to. But when it comes to taking actions based on gender distance, such as deciding who should be allowed to enter what bathroom or who should play on what sports team, it is best to defer to the determination of each individual. That is, if individual X says that they have an affinity to gendered group Y, then that determination of gendered distance should be privileged over any other. In the absence of any objective "right answer", the best we can do is to let each person be guided by their own subjective metric.

## Where to Go from Here

Do you see it now? Do you see fluctuating gender-functions bouncing around within complex manifolds? Can you see someone's gender getting flattened, distorted? Do you perhaps have a sense of what basis you use to understand gender, and where you sit in the resulting space? Can you evaluate how "close" or "far" your gender is from someone else's? If you answered "yes" to even one of those questions, I hope that you can also answer affirmatively to the question, "Do you think you have a better frame of reference for gender now?"

Whether it's "yes" or "no", I've done what I can. I shared my best metaphor and I tried to show how it works. Now, it's up to you to carry on. We are steeped in a gendered culture, and un-learning and re-learning gender is a challenging process. And, whether you're comfy in the gendered box that you were put in at birth or if you've already done years of gender exploration, it's imperative that we all speak up in defense of each individual's freedom over their own gender-function. Many lives depend on it.

# Footnotes

[^1]: Now a test ground for American Fascism.

[^2]: [DOI: 10.4324/9780203699072](https://doi.org/10.4324/9780203699072)

[^3]: For a more recent perspective on the philosophy of gender, I cannot recommend Florence Ashley's "What Is It like to Have a Gender Identity?" ([DOI: 10.1093/mind/fzac071](https://doi.org/10.1093/mind/fzac071)) enough.

[^4]: Butler, J., 2025. Who's afraid of gender?. Random House.

[^5]: This is not to say that there are not visual gender markers -- there are many -- but rather that the gender _itself_ cannot be seen.

[^6]: See this [New York Times](https://nyti.ms/2ArrhVF) article by Anne Fausto-Sterling to skim the surface of sex's complexity.

[^7]: In this way, and to borrow another metaphor, we can think of the gender function as something akin to a wavefunction in quantum mechanics. Following Heisenberg, there is always some uncertainty to even the most perfect measurement.

[^8]: As trans, nonbinary, and genderqueer folx, we must be careful on this point not to condescend, nor to view ourselves as enlightened arbiters of gender. Though experiences moving through gender space and observing one's gender from different angles (different projections) can provide powerful insights (as anyone who can "clock" other trans folx or who has helped someone "crack their egg", _i.e._, come into their transness, can attest), our knowledge always remains severely limited, and we should place trust in others' self-knowledge.