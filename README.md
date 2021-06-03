# TestingComponentDeletion

## Deploy metadata

This repository pretends to show a small dependency tree that can be easily
deployed and removed from your developer org.

You can deploy this repository from vscode using the Salesforce extensions for
Salesforce DX. Or you can add executable permissions to the shell script found
at `./scripts/sh/deploy.sh`.


```
chmod +x ./scripts/sh/deploy.sh
```

Notice that you need a correctly set up organization in your project scope,
preferably a developer org. That way, `sfdx` can determine by itself which user
you are using to perform the deployment. Then run the following script:

```
./scripts/sh/deploy.sh
```

## Removing components 

To delete deprecated components from your organization, execute the following
command:

```
sfdx force:mdapi:deploy --deploydir deprecationManifests \
--testlevel RunSpecifiedTests \
--runtests MOCKED -w 3
```

Considering that `ExtraObject__c` is a component that will remain, confirm that
this is the case once you run the command. Then you can delete it manually or
adding the type member to the file `destructiveChanges.xml` and executing the
previous command again.

## Considerations added 

All the commands listed here were executed with `sfdx-cli` version
`sfdx-cli/7.99.0 wsl-x64 node-v12.22`. In order to run these commands in other
systems like Powershell, you may need to perform extra configurations.
