class logs { 
    cron { logrotate:
      command => "/usr/sbin/logrotate",
      user    => root,
      hour    => 2,
      minute  => 0
    } 


/*
http://docs.puppetlabs.com/references/latest/type.html#cron
An important note: the Cron type will not reset parameters that are
removed from a manifest. For example, removing a minute => 10 parameter
will not reset the minute component of the associated cronjob to *.
These changes must be expressed by setting the parameter to minute =>
absent because Puppet only manages parameters that are out of sync with
manifest entries.


cron { 'resource title':
  name        => # (namevar) The symbolic name of the cron job.  This name is 
  ensure      => # The basic property that the resource should be...
  command     => # The command to execute in the cron job.  The...
  environment => # Any environment settings associated with this...
  hour        => # The hour at which to run the cron job. Optional; 
  minute      => # The minute at which to run the cron job...
  month       => # The month of the year.  Optional; if specified...
  monthday    => # The day of the month on which to run the...
  provider    => # The specific backend to use for this `cron...
  special     => # A special value such as 'reboot' or 'annually'...
  target      => # The username that will own the cron entry...
  user        => # The user to run the command as.  This user must...
  weekday     => # The weekday on which to run the command...
  # ...plus any applicable metaparameters.
}
***/

}