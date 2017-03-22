<nav class="langmenu">
  <ol>
    {% for language in site.languages %}
    <li{% if language.selected? %} class="selected"{% endif %}><a href="{{ language.url }}">{{ language.title }}</a></li>
    {% endfor %}
  </ol>
</nav>
