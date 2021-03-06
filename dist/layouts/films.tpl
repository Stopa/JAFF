<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% include "site-header" %}
</head>
<body>
  <div class="page-container">
    {% include "header" %}
    <section class="page-body">
        <div class="page-body_content">
          <div class="wrapper">
            {% content %}
            {% if editmode %}{% addbutton "Element" %}{% endif %}
            {% grouped programmes by programme in elements %}
            {% for programme in programmes %}
            <div class="film-highlights">
              {% for film in programme limit: 1 %}{% if film.programme != ' ' %}<h1 class="dashed-heading">
                {% include "film-programme" with film.programme %}
              </h1>{% endif %}{% endfor %}
              <nav class="film-roll -center">
                <ul>
                  {% for film in programme %}{% unless film.hidden == true %}
                  <li class="film-card -small" style="background-image: url({{ film.cover_art}})">
                    <a href="{{ film.url }}">
                      <span class="film-card_name">{{ film.title }}</span>
                    </a>
                  </li>
                  {% endunless %}{% endfor %}
                </ul>
              </nav>
            </div>
            {% endfor %}
            {% endgrouped %}
          </div>
        </div>
        {% include "sponsors" %}
      </div>
    </section>
    {% include "footer" %}
  </div>
{% include "JS" %}
</body>
</html>
