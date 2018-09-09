pam:
  limits:
    CIS-1.5.1:
      domain: '*'
      type: hard
      item: core
      value: 0
  limits_d:
    20-nproc: |
      # Default limit for number of user's processes to prevent
      # accidental fork bombs.
      # See rhbz #432903 for reasoning.

      *          soft    nproc     4096
      root       soft    nproc     unlimited
