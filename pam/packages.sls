{% from "pam/map.jinja" import pam_settings with context %}

pam-packages:
  pkg.installed:
    - pkgs: {{ pam_settings.lookup.pkgs }}

{# EOF #}
