
class spex::set_timezone{
  class { 'timezone':
    timezone => 'America/New_York',
  }
}
