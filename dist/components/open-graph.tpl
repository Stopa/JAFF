{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% assign fallback_body_image = 'http://jaff10.animefest.eu/photos/jaffog17b.jpg' %}

{% comment %}Open Graph image{% endcomment %}
{% if article %}
  {% if article.image == nil %}
    {% if article.data.post_image != nil and article.data.post_image != '' %}
      {% assign og_image = article.data.post_image %}
    {% elsif fallback_body_image != nil and fallback_body_image != '' %}
      {% assign og_image = fallback_body_image %}
    {% elsif body_bg_image_sizes != nil and body_bg_image_sizes != '' %}
      {% assign og_image = body_bg_image_sizes[0] %}
    {% endif %}
  {% else %}
    {% assign og_image = article.image %}
  {% endif %}
{% else %}
  {% if page.image == nil %}
    {% if fallback_body_image != nil and fallback_body_image != '' %}
      {% assign og_image = fallback_body_image %}
    {% elsif body_bg_image_sizes != nil and body_bg_image_sizes != '' %}
      {% assign og_image = body_bg_image_sizes[0] %}
    {% endif %}
  {% else %}
    {% assign og_image = page.image %}
  {% endif %}
{% endif %}

{% if og_image %}
  {% if og_image.url %}<meta property="og:image" content="{{ og_image.url }}">{% else %}<meta property="og:image" content="{{ og_image }}">{% endif %}
  {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
  {% if og_image.width %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
  {% if og_image.height %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}{% assign description = article.description %}{% else %}{% assign description = page.description %}{% endif %}
{% if description != nil and description != '' %}
  <meta property="og:description" content="{{ description }}">
  <meta name="description" content="{{ description }}">
{% endif %}
