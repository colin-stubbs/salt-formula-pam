{% from "pam/map.jinja" import pam_settings with context %}

include:
  - pam.packages
  - pam.limits
  - pam.pwquality
  - pam.login_defs

{# EOF #}
