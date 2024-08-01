---
Control_node:
  hosts:
  %{~ for i, ip in Control_node ~}
    controlnode${i+1}:
      ansible_host: ${ip}
      ansible_user: ubuntu
    %{~ endfor ~}

Work_node:
  hosts:
  %{~ for i, ip in Work_node ~}
    worknode${i+1}:
      ansible_host: ${ip}
      ansible_user: ubuntu 
    %{~ endfor ~}
