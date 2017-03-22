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
            {% editable element.title %}<br />
            {% editable element.datetime %} <br />
            {% editable element.city %}<br />
            {% editable element.cinema %}<br />
            {% editable element.ticket_url %}<br />
            {% editable element.special %}<br />
            {{ element.film }}
          </div>
        </div>
        {% include "sponsors" %}
      </div>
    </section>
    {% include "footer" %}
  </div>
</body>
</html>
