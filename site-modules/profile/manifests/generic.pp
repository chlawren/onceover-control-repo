class profile::generic (
  Boolean $motd = true,
) {
  if $motd {
    class { '::profile::base::motd': }
  }
}
