{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

{% comment %}FAV ICON{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% comment %}TODO: Add functionality after the CMS is going to support it{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% comment %}STYLESHEETS{% endcomment %}
{% stylesheet_link "main.css?2017-3" %}
{% if editmode %}
  {% stylesheet_link "editmode.min.css" %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
{% endif %}

{% comment %}SITE TITLE{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }}{% unless page.site_title == "" %} — {{ page.site_title }}{% endunless %}{% elsif element %}{{ element.title }} - {{ page.site_title }}{% else %}{% if site.root_item.selected? and page.site_title != "" %}{{ page.site_title }}{% else %}{{ page.title }}{% unless page.site_title == "" %} — {{ page.site_title }}{% endunless %}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% include "open-graph" %}

{% comment %}MISCELLANEOUS{% endcomment %}
{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}


<style>
  @media screen and (max-width: 550px) {
    .schedule-ticket:before {
      content: '{% if page.language_code == 'et' %}Osta pilet{% else if page.language_code == 'ru' %}Купи билет{% else %}Buy ticket{% endif %} ';
    }
  }
</style>
