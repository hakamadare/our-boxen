# projects::rk_scala
#
class projects::rk_scala {
  package { 'mvnvm': ensure => 'latest' }
  package { 'maven-completion': ensure => 'latest' }
  package { 'sbtenv': ensure => 'latest' }
  package { 'scalaenv': ensure => 'latest' }
}
