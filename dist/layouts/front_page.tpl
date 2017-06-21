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
            {% if page.language_code == 'et' %}<h1 class="dashed-heading">Konkursid</h1>
            <nav class="film-roll">
              <ul>
                <li class="film-card -big" style="background-image: url(/photos/tugitool.jpg);"><a href="/konkursid/lendav-tugitool"><span class="film-card_name">Lendav tugitool</span></a></li>
                <li class="film-card -big" style="background-image: url(/photos/kokakunst.jpg);"><a href="/konkursid/kokakunst"><span class="film-card_name">Jaapani kokakunst</span></a></li>
              </ul>
            </nav><br />
            {% endif %}
            {% content %}
            {% comment %}{% include "blog-highlights" %}{% endcomment %}
            {% include "film-highlights" %}
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
