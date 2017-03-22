<div class="film-highlights">
  <h1 class="dashed-heading">{% if page.language_code == "ru" %}Новые фильмы{% elsif page.language_code == "et" %}Uued filmid{% else %}New films{% endif %}</h1>
  <nav class="film-roll">
    <ul>
      <li class="film-card" style="background: url(/images/header-bg.jpg)">
        <a href="{{ element.url }}">
          <span class="film-card_name">Kimi no na wa</span>
        </a>
      </li>
      <li class="film-card" style="background: url(/images/footer-bg.jpg)">
        <a href="{{ element.url }}">
          <span class="film-card_name">Veel anime</span>
        </a>
      </li>
      <li class="film-card" style="background: url(/images/header-bg.jpg)">
        <a href="{{ element.url }}">
          <span class="film-card_name">Järjekordne anime</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
