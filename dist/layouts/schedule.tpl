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
            {% elementscontext edicy_all_languages="true" edicy_model="Screening" %}
            {% reorder elements by datetime %}
            <div class="schedule-filter">
              <select class="date-filter">
                <option value="">{% case page.language_code %}{% when 'et' %}Kõik päevad{% when 'en' %}All days{% when 'ru' %}Все дни{% endcase %}</option>
                {% for element in elements %}
                {% ifchanged %}
                <option value="{{ element.datetime | format_date:"%d-%m-%Y" }}">{{ element.datetime | format_date:"%a %-d. %B" }}</option>
                {% endifchanged %}
                {% endfor %}
              </select>
              <select class="city-filter">
                <option value="">{% case page.language_code %}{% when 'et' %}Kõik linnad{% when 'en' %}All cities{% when 'ru' %}Все города{% endcase %}</option>
                {% grouped cities by city in elements %}
                {% for group in cities %}
                <option value="{{ group.first.city}}">{{ group.first.city}}</option>
                {% endfor %}
                {% endgrouped %}
              </select>
            </div>
            <table class="schedule">
              {% for element in elements %}
              {% ifchanged %}
              {% unless element.first? %}</tbody>{% endunless %}
              <tbody data-day="{{ element.datetime | format_date:"%d-%m-%Y"}}">
              <tr class="day-row" data-day="{{ element.datetime | format_date:"%d-%m-%Y" }}">
                <th>{{ element.datetime | format_date:"%a, %-d. %B" }}</th>
                <th></th>
                <th>{% case page.language_code %}{% when 'et' %}Kell{% when 'en' %}Time{% when 'ru' %}Время{% endcase %}</th>
                <th>{% case page.language_code %}{% when 'et' %}Kino{% when 'en' %}Cinema{% when 'ru' %}Кино{% endcase %}</th>
                <th class="schedule-ticket-td">{% case page.language_code %}{% when 'et' %}Pilet{% when 'en' %}Ticket{% when 'ru' %}Билет{% endcase %}</th>
              </tr>
              {% endifchanged %}
              <tr class="screening-row" data-day="{{ element.datetime | format_date:"%d-%m-%Y"}}" data-city="{{ element.city }}">
                <td>{% if element.special.size > 0 %}<strong>{{ element.special }}:</strong> {% endif %}<a data-screening-title="{{ element.title }}"></a></td>
                <td class="screening-languages-td"></td>
                <td>{% if editmode %}<a href="{{ element.url }}">{% endif %}{{ element.screening_time }}{% if editmode %}</a>{% endif %}</td>
                <td>{{ element.cinema }}</td>
                <td class="schedule-ticket-td">{% if element.ticket_url.size > 0 %}<a class="schedule-ticket" href="{{ element.ticket_url}}" target="_blank">&raquo;</a>{% endif %}</td>
              </tr>
              {% endfor %}
              {% endelementscontext %}
            </tbody>
            </table>
          </div>
        </div>
        {% include "sponsors" %}
      </div>
    </section>
    {% include "footer" %}
    <script>

  function filterScreenings() {
    var selectedCity = document.querySelector('.city-filter').value,
        selectedDate = document.querySelector('.date-filter').value,
        hashparts = [],
        rows = document.querySelectorAll('.screening-row');

    if (selectedCity == '') {
      Array.prototype.forEach.call(rows, function(row) {
        row.classList.remove('hidden');
      });
    } else {
      Array.prototype.forEach.call(rows, function(row) {
        var rowCity = row.dataset.city,
            cityMatches = selectedCity == rowCity

        if (cityMatches) {
          row.classList.remove('hidden');
        } else {
          row.classList.add('hidden');
        }
      });
    }

    var scheduleBodies = document.querySelectorAll('.schedule tbody');
    Array.prototype.forEach.call(scheduleBodies, function(body) {
      var tbodyDate = body.dataset.day,
          dateMatches = selectedDate == '' || selectedDate == tbodyDate,
          hasScreenings = body.querySelectorAll('.screening-row:not(.hidden)').length > 0

      if (!(dateMatches && hasScreenings)) {
        body.classList.add('hidden');
      } else {
        body.classList.remove('hidden');
      }
    });

    if (selectedCity !== '') {
      hashparts.push('city='+selectedCity);
    }

    if (selectedDate !== '') {
      hashparts.push('date='+selectedDate);
    }

    location.hash = hashparts.join('&');
  }

  var selects = document.querySelectorAll('.schedule-filter select');
  Array.prototype.forEach.call(selects, function(select) {
    select.addEventListener('change', filterScreenings);
  });

  if (location.hash.length > 0) {
    var hashCityMatch = location.hash.match(/city=([^\&]+)/),
        hashCity = hashCityMatch ? hashCityMatch[1] : '',
        hashDateMatch = location.hash.match(/date=([^\&]+)/),
        hashDate = hashDateMatch ? hashDateMatch[1] : '',
        citySelector = '[value="' + decodeURIComponent(hashCity) + '"]',
        dateSelector = '[value="' + decodeURIComponent(hashDate) + '"]';

    if (hashCityMatch) {
      document.querySelector('.city-filter ' + citySelector).selected = true;
    }

    if (hashDateMatch) {
      document.querySelector('.date-filter ' + dateSelector).selected = true;
    }

    filterScreenings();
  }
{% elementscontext edicy_model="Film" %}
  var movies = {
    {% for element in elements %}
    {% assign words = element.screenings.first.title | split: ' ' %}
    {% assign name = '' %}
    {% for word in words %}
    {% if forloop.rindex > 2 %}
    {% assign name = name | append:' ' | append: word %}
    {% endif %}
    {% endfor %}
    "{{ name | lstrip }}": {
      title: "{{ element.title | strip | strip_newlines }}",
      url: '{{ element.url }}',
      audio: '{% case element.audio_language %}{% when 'Japanese' %}jap{% when 'Estonian' %}est{% when 'English' %}eng{% endcase %}',
      subtitles:
        '{% if element.subtitles_en %}eng{% endif %}{% if element.subtitles_ru %}|rus{% endif %}{% if element.subtitles_et %}|est{% endif %}'.split('|')

    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  };
{% endelementscontext %}

  var titles = document.querySelectorAll('[data-screening-title]');
  Array.prototype.forEach.call(titles, function(title) {
    var screeningTitle = title.dataset.screeningTitle,
        words = screeningTitle.split(' '),
        wordsCount = words.length,
        filmWords = words.splice(0, wordsCount - 2),
        filmObject = movies[filmWords.join(' ')],
        filmName = filmObject.title,
        filmUrl = filmObject.url,
        filmAudio = filmObject.audio,
        filmSubs = filmObject.subtitles,
        languageTd = title.parentNode.nextElementSibling;

    title.setAttribute('href', filmUrl);
    title.innerHTML = filmName;

    var audioElement = document.createElement('span');
    audioElement.classList.add('screening-language', '-audio');
    audioElement.innerHTML = filmAudio;

    languageTd.appendChild(audioElement);

    filmSubs.forEach(function(lang) {
      if (lang.length > 0) {
        var langElement = document.createElement('span');
        langElement.classList.add('screening-language', '-subtitle');
        langElement.innerHTML = lang;

        languageTd.appendChild(langElement);
      }
    });
  });
  </script>
  </div>
</body>
</html>
