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
            <h1 class="dashed-heading">{{ "news" |lc }}</h1>
            {% for article in articles %}
            <article class="blog-article">
              <h1>{{ article.title }}</h1>
              <p class="meta">{{ article.created_at | format_date: "long" }}</p>
              <div class="article-contents">
                <div class="article-image" style="background-image: url({{ article.image }})"></div>
                <div class="article-text">
                  {{ article.body }} <a href="{{ article.url }}" class="article-read-more">(...)</a>
                </div>
              </div>
            </article>
            {% endfor %}
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
