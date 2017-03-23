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
                {% case film.programme %}
                  {% when 'Põhikava' %}
                    {% case page.language_code %}
                      {% when 'et' %}Põhikava
                      {% when 'ru' %}Основная программа
                      {% when 'en' %}Main programme
                    {% endcase %}
                  {% when 'Jaapani kokakunst' %}
                    {% case page.language_code %}
                      {% when 'et' %}Jaapani kokakunst
                      {% when 'ru' %}Японская кухня
                      {% when 'en' %}Japanese art of cooking
                    {% endcase %}
                  {% when 'JAFFi parimad filmid' %}
                    {% case page.language_code %}
                      {% when 'et' %}Top 7: JAFFi parimad filmid
                      {% when 'ru' %}Лучшие фильмы JAFFа
                      {% when 'en' %}Тоp 7: Best films of JAFF
                    {% endcase %}
                  {% when 'Robotid animes' %}
                    {% case page.language_code %}
                      {% when 'et' %}Robotid animes
                      {% when 'ru' %}Роботы в аниме
                      {% when 'en' %}Robots in anime
                    {% endcase %}
                  {% when 'Oscar' %}Oscar Gala
                  {% when 'Anime vs Manga vs Film' %}Anime vs Manga vs Film
                  {% when 'Perefilmid' %}
                    {% case page.language_code %}
                      {% when 'et' %}Perefilmid
                      {% when 'ru' %}Семейные фильмы
                      {% when 'en' %}Family films
                    {% endcase %}
                  {% when 'Eriseanss' %}
                    {% case page.language_code %}
                      {% when 'et' %}Eriseanss
                      {% when 'ru' %}Специальный сеанс
                      {% when 'en' %}Special screening
                    {% endcase %}
                  {% when 'Jaapani elustiili programm / Kokakunst' %}
                    {% case page.language_code %}
                      {% when 'et' %}Jaapani elustiili programm / Kokakunst
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'Eriprogramm "VERSUS"' %}
                    {% case page.language_code %}
                      {% when 'et' %}Eriprogramm "VERSUS"
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'JAFFi eri: Küborgid' %}
                    {% case page.language_code %}
                      {% when 'et' %}JAFFi eri: Küborgid
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'Eesti animatsioon' %}
                    {% case page.language_code %}
                      {% when 'et' %}Eesti animatsioon
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'Külaliste päev' %}
                    {% case page.language_code %}
                      {% when 'et' %}Külaliste päev
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'Filmiprojektide presentatsioon' %}
                    {% case page.language_code %}
                      {% when 'et' %}Filmiprojektide presentatsioon
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'Armastatud koguperefilmid' %}
                    {% case page.language_code %}
                      {% when 'et' %}Armastatud koguperefilmid
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                  {% when 'Film-kontsert' %}
                    {% case page.language_code %}
                      {% when 'et' %}Film-kontsert
                      {% when 'ru' %}
                      {% when 'en' %}
                    {% endcase %}
                {% endcase %}
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
