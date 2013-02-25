
class hosts($entries = [], $ensure = 'present') {

        include hosts::params
        include hosts::config

}
