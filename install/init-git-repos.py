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

import subprocess
import yaml
import sys

home_dir = sys.argv[1]

other_repositories = [ \
        'https://github.com/gregmalcolm/python_koans.git',
        ]


def init_git_repo( repo_location, repo_remote_url, remote_name):
    '''Initializes git repository and adds remote URLs.'''

    git_init_cmd = 'git init ' + repo_location
    print('Initializing git repository: ' + git_init_cmd)
    init_repo = subprocess.Popen(git_init_cmd.split(), \
            stdout=subprocess.PIPE)
    init_output = init_repo.communicate()[0]

    git_remote_cmd = 'git remote add ' + remote_name + ' ' + repo_remote_url
    print('Adding git remote: ' + git_remote_cmd)
    add_remote = subprocess.Popen(git_remote_cmd.split(), \
            cwd=repo_location, stdout=subprocess.PIPE)
    remote_output = add_remote.communicate()[0]

    git_fetch = 'git fetch ' + remote_name
    print('Update the git repositories')
    fetch_repo = subprocess.Popen(git_fetch.split(), \
            cwf=repo_location, stdout=subprocess.PIPE)
    remote_output = add_remote.communicate()[0]


def setup_openstack_repositories():
    '''Clone and Setup OpenStack Repositories'''

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

            '''
            git_submodule_cmd = 'git submodule add -f ' + repo_url + \
                    ' Repos/OpenStack/' + project.replace(' ', '_') + \
                    repo_name.replace('/openstack/', '/')
            submodule_add = subprocess.Popen(git_submodule_cmd.split(), \
                    stdout=subprocess.PIPE)
            output = submodule_add.communicate()[0]
            '''

            repo_location = home_dir + '/Repositories/Dev/OpenStack/' + \
                    project.replace(' ', '_') + \
                    repo_name.replace('/openstack/', '/')
            remote_name = 'g.o.o'
            init_git_repo(repo_location, repo_url, remote_name)


def setup_opensuse_repositories():
    '''
    Set up openSUSE related repositories.
    URL: https://github.com/openSUSE
    '''

    pass


def setup_SUSE_repositories():
    '''
    Set up SUSE repositories.
    URL: https://github.com/SUSE
    '''

    pass


def setup_susestudio_repositories():
    '''
    Set up susestudio repositories.
    URL: https://github.com/susestudio
    '''

    pass


def setup_SUSE_Cloud_repositories():
    '''
    Setup SUSE-Cloud repositories.
    URL: https://github.com/SUSE-Cloud
    '''

    pass


def setup_openSUSE_Team():
    '''
    Setup openSUSE-Team repositories.
    URL: https://github.com/openSUSE-Team
    '''

    pass

setup_openstack_repositories()
