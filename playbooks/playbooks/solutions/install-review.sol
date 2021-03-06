---
- name: Web server is installed and running
  hosts: all
  tasks:
    - name: IIS service is installed
      win_feature:
        name: Web-Server
        state: present

    - name: IIS service is started
      win_service:
        name: W3Svc
        state: started

- name: Default web page is created on win1
  hosts: win1.example.com
  tasks:
    - name: Index file is created
      win_copy:
        content: "The win1 web server has been provisioned by Ansible"
        dest: C:\Inetpub\wwwroot\index.html

- name: Default web page is created on win2
  hosts: win2.example.com
  tasks:
    - name: Index file is created
      win_copy:
        content: "The win2 web server has been provisioned by Ansible"
        dest: C:\Inetpub\wwwroot\index.html