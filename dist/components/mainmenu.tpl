<nav class="mainmenu">
  <ol>
    {% for item in site.menuitems %}
      {% menulink item wrapper-tag="li" %}
    {% endfor %}
  </ol>
</nav>
