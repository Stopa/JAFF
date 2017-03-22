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
            <h1 class="dashed-heading">{% editable element.title %}</h1>
            {% if editmode %}
              {% editable element.original_title %}
              {% editable element.meta %}
              {% editable element.programme %}<br />
              {% editable element.audio_language %}<br />
              Subtiitrid: <br />
              <label>En: {% editable element.subtitles_en %}</label>
              <label>Et: {% editable element.subtitles_et %}</label>
              <label>Ru: {% editable element.subtitles_ru %}</label>
              {% editable element.cover_art %}
              Seansid: {% editable element.screenings %}
            {% endif %}
            {% unless editmode %}
            <div class="film-meta">
              <em>{{ element.original_title }}</em>
              <p>{{ element.meta }}</p>
              <p class="screening-languages"><span class="screening-language -audio" title="{% if page.language_code == 'ru' %}Звук{% else %}Audio{% endif %}">{% case element.audio_language %}{% when 'Japanese' %}jap{% when 'Estonian' %}est{% when 'English' %}eng{% endcase %}</span>
                {% if element.subtitles_en %} <span class="screening-language -subtitle" title="{% if page.language_code == 'ru' %}Субтитры{% elsif page.language_code == 'ru' %}Subtiitrid{% else %}Subtitles{% endif %}">eng</span>{% endif %}
                {% if element.subtitles_et %} <span class="screening-language -subtitle" title="{% if page.language_code == 'ru' %}Субтитры{% elsif page.language_code == 'ru' %}Subtiitrid{% else %}Subtitles{% endif %}">est</span>{% endif %}
                {% if element.subtitles_ru %} <span class="screening-language -subtitle" title="{% if page.language_code == 'ru' %}Субтитры{% elsif page.language_code == 'ru' %}Subtiitrid{% else %}Subtitles{% endif %}">rus</span>{% endif %}</p>
            </div>
            {% endunless %}
            <div class="film-trailer">
              {% content name="trailer" bind="Element" %}
            </div>
            {% editable element.description %}
            {% unless editmode %}
            <h1>{% case page.language_code %}{% when 'et' %}Seansid{% when 'en' %}Screenings{% when 'ru' %}Сеансы{% endcase %}</h1>
            <div class="screenings">
              {% reorder element.screenings by datetime %}
              <table class="schedule -small">
              {% for screening in element.screenings %}
                {% ifchanged %}
                  {% unless element.first? %}</tbody>{% endunless %}
                  <tbody>
                  <tr class="day-row">
                    <th>{{ screening.datetime | format_date: "%a, %-d %B" | capitalize }}</th>
                    <th class="schedule-ticket-td">{% case page.language_code %}{% when 'et' %}Pilet{% when 'en' %}Ticket{% when 'ru' %}Билет{% endcase %}</th>
                  </tr>
                {% endifchanged %}
                <tr>
                  <td>
                    <strong>{{ screening.screening_time }}</strong>
                    {{ screening.cinema }}
                    ({{ screening.city }})
                  </td>
                  <td class="schedule-ticket-td">
                    {% if screening.ticket_url.size > 0 %}
                      <a class="schedule-ticket" href="{{ screening.ticket_url}}" target="_blank">&raquo;</a>
                    {% endif %}
                  </td>
                </tr>
              {% endfor %}
              </tbody>
              </table>
              {% endunless %}
            </div>
          </div>
        </div>
        {% include "sponsors" %}
      </div>
    </section>
    {% include "footer" %}
  </div>
</body>
</html>
