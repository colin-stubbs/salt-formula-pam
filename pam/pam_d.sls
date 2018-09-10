{% from "pam/map.jinja" import pam_settings with context %}

include:
  - pam.packages

{% if 'pam_d' in pam_settings and 'source' in pam_settings.pam_d %}
{{ pam_settings.lookup.locations.pam_d }}:
  file.recurse:
    - source: {{ pam_settings.pam_d.source }}
    - makedirs: True
    - follow_symlinks: True
    - allow_symlink: True
    - clean: {{ pam_settings.pam_d.clean|default(False) }}
    - user: root
    - group: root
    - mode: 0755
    - dir_mode: 0755
    - file_mode: 0644
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: pam-packages
{% endif %}

{# EOF #}
