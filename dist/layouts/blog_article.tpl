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
            <article class="blog-article single"><h1 class="dashed-heading">{% editable article.title %}</h1>
            <p class="meta">{{ article.created_at | format_date: "long" }}</p>
              <div class="article-contents">
                <div class="article-image" style="background-image: url({{ article.image }})"></div>
                <div class="article-text">
                  {% editable article.body %}
                </div>
              </div>
            </article>
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
