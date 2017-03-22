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
            <ul class="products">
              {% for product in elements %}
                <li class="product" style="background-image: url('{{ product.image }}')"><a href="{{ product.url }}"><span class="product_title">{% if product.highlight.size > 0 %}<strong>{{ product.highlight }}</strong>{% endif %} {{ product.title }}</span></a></li>
              {% endfor %}
            </ul>
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
