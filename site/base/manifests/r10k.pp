class base::r10k (
  String $remote_repo	= $base::params::git_remote_repo,
  ) inherits base::params {

  class { 'r10k':
    remote	=> "$remote_repo",
  }
}
