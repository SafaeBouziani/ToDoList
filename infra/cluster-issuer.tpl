apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging   # you can switch to letsencrypt-prod later
spec:
  acme:
    email: labrikijihane@gmail.com   # replace ${email} with your real email
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-staging
    solvers:
      - http01:
          ingress:
            class: nginx
