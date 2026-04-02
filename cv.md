---
title: CV
---

See [here](/cv.pdf) for the pdf version of my CV.


<h3 style="padding-bottom: 20px;">Experience</h3>
<ul>
{% for w in site.data.cv_html.employment %}
<li>
<div style="display: flex; justify-content: space-between; border-width: 0">
  <span style="text-align: left; margin-right: 3px"> <b style="font-size: 130%;">{{ w.firm }}</b> </span>
  <span style="text-align: right; color:#7a7a7a; white-space: nowrap">{{ w.date }}</span>
</div>
</li>
<p>{{ w.title }}</p>
{% endfor %}
</ul>

<h3 style="padding-bottom: 20px;">Education</h3>
<ul>
{% for w in site.data.cv_html.education %}
<li>
<div style="display: flex; justify-content: space-between; border-width: 0">
  <span style="text-align: left; margin-right: 3px"> <b style="font-size: 130%;">{{ w.institute }}</b> </span>
  <span style="text-align: right; color:#7a7a7a; white-space: nowrap">{{ w.year }}</span>
</div>
</li>
<p>{{ w.degree }}
{% if w.advisor != nil %}<br /><span style="color:#7a7a7a">Supervised by {{ w.advisor }}</span>{% endif %}</p>
{% endfor %}
</ul>

<h3 style="padding-bottom: 20px;">Awards</h3>
<ul>
{% for a in site.data.cv_html.awards %}
<li>
<div style="display: flex; justify-content: space-between; border-width: 0">
  <span style="text-align: left; margin-right: 3px"> {{ a.award }} </span>
  <span style="text-align: right; color:#7a7a7a; white-space: nowrap">{{ a.year }}</span>
</div>
</li>
{% endfor %}
</ul>
  
<h3 style="padding-bottom: 20px;">Activities</h3>
<ul>
{% for a in site.data.cv_html.activities %}
<li>
<div style="display: flex; justify-content: space-between; border-width: 0">
  <span style="text-align: left; margin-right: 3px">{{ a.activity }}</span>
  <span style="text-align: right; color:#7a7a7a; white-space: nowrap">{{ a.date }}</span>
</div>
</li>
{% endfor %}
</ul>

<h3 style="padding-bottom: 20px;">Teaching</h3>
<ul>
{% for c in site.data.cv_html.teaching %}
<li>
<div style="display: flex; justify-content: space-between; border-width: 0">
  <span style="text-align: left; margin-right: 3px">{{ c.class }}, {{ c.role }}, {{ c.institute }}</span>
  <span style="text-align: right; color:#7a7a7a; white-space: nowrap">{{ c.date }}</span>
</div>
</li>
{% endfor %}
</ul>

<h3 style="padding-bottom: 20px;">Invited Talks</h3>
<ul>
{% for t in site.data.cv_html.talks %}
<li>
<div style="display: flex; justify-content: space-between; border-width: 0">
  <span style="text-align: left; margin-right: 3px">
  {{ t.location }}{% if w.link != nil %} <a href={{ t.link }}>recording</a>{% endif %}
  </span>
  <span style="text-align: right; color:#7a7a7a; white-space: nowrap">{{ t.date }}</span>
</div>
</li>
{% endfor %}
</ul>
