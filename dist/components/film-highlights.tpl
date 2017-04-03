{% elementscontext edicy_all_languages="true" edicy_page_path_prefix="filmid" q.element.values.featured="true" %}
<div class="film-highlights">
  <h1 class="dashed-heading">{% if page.language_code == "ru" %}Новые фильмы{% elsif page.language_code == "et" %}Uued filmid{% else %}New films{% endif %}</h1>
  <nav class="film-roll">
    <ul>{% for element in elements %}
      <li class="film-card" style="background-image: url({{ element.cover_art }})">
        <a href="{{ element.url }}">
          <span class="film-card_name">{{ element.title }}</span>
        </a>
      </li>{% endfor %}
    </ul>
  </nav>
</div>
{% endelementscontext %}
