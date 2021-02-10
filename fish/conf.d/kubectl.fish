#!/usr/bin/env fish

abbr -a k 'kubectl'

abbr -a kg 'kubectl get'
abbr -a kgp 'kubectl get pods'
abbr -a kgs 'kubectl get svc'
abbr -a kgsec 'kubectl get secret'
abbr -a kgcm 'kubectl get cm'
abbr -a kgd 'kubectl get deployment'
abbr -a kgi 'kubectl get ingress'
abbr -a kgrs 'kubectl get rs'

abbr -a ke 'kubectl edit'
abbr -a kep 'kubectl edit pods'
abbr -a kes 'kubectl edit svc'
abbr -a kesec 'kubectl edit secret'
abbr -a kecm 'kubectl edit cm'
abbr -a ked 'kubectl edit deployment'
abbr -a kei 'kubectl edit ingress'
abbr -a kers 'kubectl edit rs'

abbr -a kd 'kubectl describe'
abbr -a kdp 'kubectl describe pods'
abbr -a kds 'kubectl describe svc'
abbr -a kdsec 'kubectl describe secret'
abbr -a kdcm 'kubectl describe cm'
abbr -a kdd 'kubectl describe deployment'
abbr -a kdi 'kubectl describe ingress'
abbr -a kdrs 'kubectl describe rs'

abbr -a kl 'kubectl logs'
abbr -a klf 'kubectl logs -f'

abbr -a keti 'kubectl exec -ti'
