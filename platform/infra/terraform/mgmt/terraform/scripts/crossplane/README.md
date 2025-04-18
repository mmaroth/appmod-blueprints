# How Environment Config works

After VPC is created, the values for VPC Id and Subnet Ids in the environment config are substituted in the `setup-environments.sh` script.

This enables any Crossplane XRDs created in the crossplane compositions on the management cluster to substitute these values into managed resources.  This ensures that customers will not need to manually go in and specify these values when creating a resource using the XRDs.  

There is an example in the `mysql-aurora` XRD merged in from the Measuring Platform Success feature branch.
