{% blogcontext "uudised" %}
<div class="blog-highlights">
  <h1 class="dashed-heading">{% if site.language_code == "ru" %}Свежее{% elsif site.language_code == "et" %}Värsked uudised{% else %}Fresh news{% endif %}</h1>
  <nav class="news-roll">
    <ol>
      {% for article in blog.articles limit: 5 %}
      <li style="background-image: url({{ article.image }});">
        <a href="{{ article.url }}">
          {{ article.title }}
        </a>
      </li>
      {% endfor %}
    </ol>
  </nav>
</div>
{% endblogcontext %}
