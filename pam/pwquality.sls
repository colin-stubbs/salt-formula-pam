{% from "pam/map.jinja" import pam_settings with context %}

include:
  - pam.packages

{% if 'pwquality' in pam_settings %}
{{ pam_settings.lookup.locations.pwquality_conf }}:
  file.managed:
    - source: salt://pam/files/pwquality.conf
    - template: jinja
    - context:
      filename: {{ pam_settings.lookup.locations.pwquality_conf }}
      pwquality: {{ pam_settings.pwquality }}
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: pam-packages
{% endif %}

{# EOF #}
