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
    '''Initializes git repository, adds remote and pulls the code'''

    try:
        # Initialize Empty Repository
        git_init_cmd = 'git init ' + repo_location
        print('Initializing git repository: ' + repo_location)
        init_repo = subprocess.Popen(git_init_cmd.split(),
                                     stdout=subprocess.PIPE)
        init_repo.communicate()[0]

    except Exception:
        print("Error! Initializing Git Repository" + repo_location)

    try:
        # Add git remote
        git_remote_cmd = 'git remote add ' + remote_name + ' ' + \
            repo_remote_url
        add_remote = subprocess.Popen(git_remote_cmd.split(),
                                      cwd=repo_location,
                                      stdout=subprocess.PIPE)
        add_remote.communicate()[0]

    except Exception:
        print("Error! Adding git remote" + repo_location)

    try:
        # Fetch git repository content
        git_fetch = 'git fetch ' + remote_name
        fetch_repo = subprocess.Popen(git_fetch.split(),
                                      cwd=repo_location,
                                      stdout=subprocess.PIPE)
        fetch_repo.communicate()[0]

    except Exception:
        print("Error! Trying to getch git remote" + repo_location)

    try:
        # Pull Changes
        git_pull = 'git pull -u ' + remote_name + ' master'
        pull_repo = subprocess.Popen(git_pull.split(),
                                     cwd=repo_location,
                                     stdout=subprocess.PIPE)
        pull_repo.communicate()[0]

    except Exception:
        print("Error! Could not set the remote and pull code")

    try:
        # Set master branch to track upstream master
        git_set_remote = 'git branch -u ' + remote_name + '/master'
        set_remote = subprocess.Popen(git_set_remote.split(),
                                      cwd=repo_location,
                                      stdout=subprocess.PIPE)
        set_remote.communicate()[0]

    except Exception:
        print("Error! Could not set the remote")


def clone_github_orgs(github_org_urls):
    '''Fetch the github repositories URL from Github API'''

    remote_name = 'github'
    dev_dir = home_dir + '/Repositories/Dev/'

    def mine_urls(url_string, repo_org_url):

        try:
            org_links = url_string.split(',')
            repo_url = org_links[0].split(';')[0]
            repo_url = repo_url.replace('<', '').replace('>', '')
            repo_url = repo_url[:-1]
            last_page = org_links[1].split(';')[0]
            last_page = last_page.replace('<', '').replace('>', '')
            last_page = last_page[-1]

        except Exception:
            repo_url = repo_org_url
            last_page = ''

        return repo_url, last_page

    def clone_orgs(repo_url):
        github_response = urllib.request.urlopen(repo_url)
        repositories = bytes.decode(github_response.read(), 'ascii',
                                    'ignore')
        repositories = json.loads(repositories)

        for repo_info in repositories:
            repo_location = org_location + repo_info['name'] + '/'
            repo_remote_url = repo_info['git_url']
            init_git_repo(repo_location, repo_remote_url, remote_name)

    for github_org_url in github_org_urls:

        org_location = dev_dir + github_org_url[0]
        github_response = urllib.request.urlopen(github_org_url[1])
        get_github_header = github_response.info()
        org_links = get_github_header.get('Link')
        base_repo_url, last_page = mine_urls(org_links, github_org_url[1])

        try:
            last_page = int(last_page)

            for page_no in range(1, last_page + 1):

                repo_url = base_repo_url + str(page_no)
                clone_orgs(repo_url)

        except Exception:
            clone_orgs(base_repo_url)

def setup_openstack_repos():
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


def setup_github_orgs():
    '''Setup github repositories from their organizations'''

    github_org_urls = [
        ['openSUSE/', 'https://api.github.com/orgs/openSUSE/repos'],
        ['SUSE/', 'https://api.github.com/orgs/SUSE/repos'],
        ['susestudio/', 'https://api.github.com/orgs/susestudio/repos'],
        ['SUSE-Cloud/', 'https://api.github.com/orgs/SUSE-Cloud/repos'],
        ['openSUSE-Team/', 'https://api.github.com/orgs/openSUSE-Team/repos']
    ]

    clone_github_orgs(github_org_urls)


setup_openstack_repos()
setup_github_orgs()
