<nav class="mainmenu">
  <ol>
    {% for item in site.visible_menuitems %}
      {% menulink item wrapper-tag="li" %}
    {% endfor %}
  </ol>
</nav>
