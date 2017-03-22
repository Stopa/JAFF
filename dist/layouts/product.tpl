<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% include "site-header" %}
  <style>
  .varselect {
    display: block;
    margin: 10px 0 0;
  }
  </style>
</head>
<body>
  <div class="page-container">
    {% include "header" %}
    <section class="page-body">
        <div class="page-body_content">
          <div class="wrapper">
            <div class="product-container">
              <div class="product-container_left">
                {% if editmode %}
                  {% editable element.image %}
                {% else %}
                  <img src="{{ element.image }}" alt="{{ element.title }}" />
                {% endif %}
              </div>
              <div class="product-container_right">
                <h2 style="margin-top: 0;">{% editable element.title %}</h2>
                {% content name="right" bind="Element" %}
                {% if editmode %}Highlight: {% editable element.highlight %}{% endif %}
              </div>
            </div>
          </div>
        </div>
        {% include "sponsors" %}
      </div>
    </section>
    {% include "footer" %}
  </div>
<script>
  var variations = {
    2230: ["S", "M", "L", "XL"], // pusa
    2232: ["S", "M", "L", "XL"], // komplekt
    2228: ["S", "M", "L", "XL"], // särk
    2231: ["S", "M", "L", "XL"], // väike komplekt
    2233: ["L", "XL", "XXL"], // 2016 särk
    2234: ["{% if page.language_code == 'en' %}Black{% elsif page.language_code == 'ru' %}Черные{% else %}Must{% endif %} 37-40", "{% if page.language_code == 'en' %}Black{% elsif page.language_code == 'ru' %}Черные{% else %}Must{% endif %} 41-44", "{% if page.language_code == 'en' %}White{% elsif page.language_code == 'ru' %}Белые{% else %}Valge{% endif %} 41-44"], // sokid
    2236: ["XL", "XXL"], // 2015 särk
    2543: ["a", "b"],
    2544: ['C', 'asd']
  };

  var buyButtons = document.querySelectorAll('.edy-buy-button');
  Array.prototype.forEach.call(buyButtons, function(button) {
    var product_id = button.dataset.productId,
        product_variations = variations[product_id];

    if (product_variations) {
      var varselect = document.createElement('select');
      varselect.classList.add('varselect');

      product_variations.forEach(function(variation, index) {
        var varoption = document.createElement('option');
        varoption.innerHTML = variation;
        varselect.appendChild(varoption);
      });
      button.parentNode.insertBefore(varselect, button);

      varselect.selectedIndex = 0;

      varselect.addEventListener('change', function(event) {
        var select = event.target,
            b = select.nextElementSibling;

        b.dataset.note = select.value;
      });

      button.dataset['note'] = product_variations[0];
    }
  });
</script>
</body>
</html>
