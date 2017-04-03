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
