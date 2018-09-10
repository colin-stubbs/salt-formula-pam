{% from "pam/map.jinja" import pam_settings with context %}

include:
  - pam.packages

{% if 'login_defs' in pam_settings %}
{{ pam_settings.lookup.locations.login_defs }}:
  file.managed:
    - source: salt://pam/files/login.defs
    - template: jinja
    - context:
      filename: {{ pam_settings.lookup.locations.login_defs }}
      login_defs: {{ pam_settings.login_defs }}
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: pam-packages
{% endif %}

{# EOF #}
