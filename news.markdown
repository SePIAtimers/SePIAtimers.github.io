---
layout: news

title: News
summary: 直近の活動
---

{% for post in site.categories.news %}
{% include contents/post_summary.html %}
{% endfor %}
