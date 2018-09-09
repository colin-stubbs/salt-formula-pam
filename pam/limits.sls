{% from "pam/map.jinja" import pam_settings with context %}

include:
  - pam.packages

{% if 'limits' in pam_settings %}
{{ pam_settings.lookup.locations.limits_conf }}:
  file.managed:
    - source: salt://pam/files/limits.conf
    - template: jinja
    - context:
      limits_conf: {{ pam_settings.lookup.locations.limits_conf }}
      limits: {{ pam_settings.limits }}
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: pam-packages
{% endif %}

{% if 'limits_d' in pam_settings %}
{% for limit_d_file_name, limit_d_file_content in pam_settings.limits_d.items() %}
{{ pam_settings.lookup.locations.limits_d }}/{{ limit_d_file_name }}.conf:
  file.managed:
    - contents_pillar: pam:limits_d:{{ limit_d_file_name }}
    - user: root
    - group: root
    - mode: 0644
    - require:
      - file: {{ pam_settings.lookup.locations.limits_conf }}
{% endfor %}
{% endif %}

{# EOF #}
