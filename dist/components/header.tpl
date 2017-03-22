<header class="page-header">
  <div class="wrapper">
    <div class="page-header_left">
      <h1 class="logo">
        <a href="{{ site.root_item.url }}">{{ site.title }}</a>
      </h1>
    </div>
    <div class="page-header_right">
      {% include "langmenu" %}
      {% include "mainmenu" %}
      <div class="page-header_title">
        {% xcontent name="header" %}
      </div>
    </div>
  </div>
</header>
