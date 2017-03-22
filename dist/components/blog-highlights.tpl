<div class="blog-highlights">
  <h1 class="dashed-heading">{% if site.language_code == "ru" %}Свежее{% elsif site.language_code == "et" %}Värsked uudised{% else %}Fresh news{% endif %}</h1>
  <nav class="news-roll">
    <ol>
      {% for article in site.latest_5_articles %}
      <li style="background-image: url(/images/header-bg.jpg1);">
        <a href="{{ article.url }}">
          {{ article.title }}
        </a>
      </li>
      {% endfor %}
    </ol>
  </nav>
</div>
