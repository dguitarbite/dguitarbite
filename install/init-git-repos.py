#!/bin/python
#
# Python Program to Parse programs.yaml file which is located here
# http://git.openstack.org/cgit/openstack/governance/plain/reference/programs.yaml
#
# Parsing prograns.yaml file will provide python with information on different
# project names and how to clone these projects.
#
# As the information is recieved, this program will then call git to create
# submodules and apply them as required.

import json
import subprocess
import sys
import urllib.request
import yaml

home_dir = sys.argv[1]

other_repositories = [
    'https://github.com/gregmalcolm/python_koans.git']


def init_git_repo(repo_location, repo_remote_url, remote_name):
    '''Initializes git repository and adds remote URLs.'''

    try:
        git_init_cmd = 'git init ' + repo_location
        print('Initializing git repository: ' + git_init_cmd)
        init_repo = subprocess.Popen(git_init_cmd.split(),
                                     stdout=subprocess.PIPE)
        init_output = init_repo.communicate()[0]
        print(init_output)

    except Exception:
        print("Error! Initializing Git Repository" + repo_location)

    try:
        git_remote_cmd = 'git remote add ' + remote_name + ' ' + \
            repo_remote_url
        print('Adding git remote: ' + git_remote_cmd)
        add_remote = subprocess.Popen(git_remote_cmd.split(),
                                      cwd=repo_location,
                                      stdout=subprocess.PIPE)
        remote_output = add_remote.communicate()[0]

    except Exception:
        print("Error! Adding git remote" + repo_location)

    try:
        git_fetch = 'git fetch ' + remote_name
        print('Fetching the repository contents')
        fetch_repo = subprocess.Popen(git_fetch.split(),
                                      cwd=repo_location,
                                      stdout=subprocess.PIPE)
        remote_output = fetch_repo.communicate()[0]
        print(remote_output)

    except Exception:
        print("Error! Trying to getch git remote" + repo_location)

    try:
        git_fetch = 'git pull -u ' + remote_name
        print('Setup Upstream and pull the master branch')
        fetch_repo = subprocess.Popen(git_fetch.split(),
                                      cwd=repo_location,
                                      stdout=subprocess.PIPE)
        remote_output = fetch_repo.communicate()[0]
        print(remote_output)

    except Exception:
        print("Error! Could not set the remote and pull code")


def clone_github_repo(org_location, repo_url, remote_name):
    '''Fetch the github repositories URL from Github API'''

    github_response = urllib.request.urlopen(repo_url)
    repositories = bytes.decode(github_response.read(), 'ascii', 'ignore')
    repositories = json.loads(repositories)

    for repo_info in repositories:
        repo_location = org_location + repo_info['name'] + '/'
        repo_remote_url = repo_info['git_url']
        init_git_repo(repo_location, repo_remote_url, remote_name)


def setup_openstack_repositories():
    '''Clone and Setup OpenStack Repositories.'''

    repo_info = open('programs.yaml', 'r')
    repo_info = yaml.load(repo_info)
    project_name = []

    for project in repo_info:
        project_name.append(project)

    # Create Folders As per project names

    for project in project_name:
        ''' Get the project name.'''

        for repo in repo_info.pop(project)['projects']:
            '''Get repository URL.'''

            repo_name = '/' + repo['repo']
            repo_url = 'git://git.openstack.org' + repo_name

            repo_location = home_dir + '/Repositories/Dev/OpenStack/' + \
                project.replace(' ', '_') + \
                repo_name.replace('/openstack/', '/')
            remote_name = 'g.o.o'
            init_git_repo(repo_location, repo_url, remote_name)


def setup_openSUSE_repositories():
    '''Set up openSUSE related repositories.
    URL: https://github.com/openSUSE
    '''

    openSUSE_repo_url = 'https://api.github.com/orgs/openSUSE/repos'
    repo_location = home_dir + '/Repositories/Dev/openSUSE/'
    remote_name = 'github'
    clone_github_repo(repo_location, openSUSE_repo_url, remote_name)


def setup_SUSE_repositories():
    '''Set up SUSE repositories.
    URL: https://github.com/SUSE
    '''

    SUSE_repo_url = 'https://api.github.com/orgs/SUSE/repos'
    repo_location = home_dir + '/Repositories/Dev/openSUSE/'
    remote_name = 'github'
    clone_github_repo(repo_location, SUSE_repo_url, remote_name)


def setup_susestudio_repositories():
    '''Set up susestudio repositories.
    URL: https://github.com/susestudio
    '''

    susestudio_repo_url = 'https://api.github.com/orgs/susestudio/repos'
    repo_location = home_dir + '/Repositories/Dev/openSUSE/'
    remote_name = 'github'
    clone_github_repo(repo_location, susestudio_repo_url, remote_name)


def setup_SUSE_Cloud_repositories():
    '''Setup SUSE-Cloud repositories.
    URL: https://github.com/SUSE-Cloud
    '''

    SUSE_Cloud_repo_url = 'https://api.github.com/orgs/SUSE-Cloud/repos'
    repo_location = home_dir + '/Repositories/Dev/openSUSE/'
    remote_name = 'github'
    clone_github_repo(repo_location, SUSE_Cloud_repo_url, remote_name)


def setup_openSUSE_Team():
    '''Setup openSUSE-Team repositories.
    URL: https://github.com/openSUSE-Team
    '''

    openSUSE_team_repo_url = 'https://api.github.com/orgs/openSUSE/repos'
    repo_location = home_dir + '/Repositories/Dev/openSUSE/'
    remote_name = 'github'
    clone_github_repo(repo_location, openSUSE_team_repo_url, remote_name)


setup_openstack_repositories()
setup_openSUSE_Team()
setup_SUSE_repositories()
setup_susestudio_repositories()
setup_SUSE_Cloud_repositories()
setup_openSUSE_Team()
