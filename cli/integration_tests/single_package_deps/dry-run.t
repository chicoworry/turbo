Setup
  $ . ${TESTDIR}/../setup.sh
  $ . ${TESTDIR}/setup.sh $(pwd)

Check
  $ ${TURBO} run test --dry --single-package
  
  Tasks to Run
  build
    Task                   = build                                                                                                  
    Hash                   = 818eddfdc27ae508                                                                                       
    Cached (Local)         = false                                                                                                  
    Cached (Remote)        = false                                                                                                  
    Command                = echo 'building' > foo                                                                                  
    Outputs                = foo                                                                                                    
    Log File               = .turbo/turbo-build.log                                                                                 
    Dependencies           =                                                                                                        
    Dependendents          = test                                                                                                   
    ResolvedTaskDefinition = {"outputs":["foo"],"cache":true,"dependsOn":[],"inputs":[],"outputMode":0,"env":[],"persistent":false} 
  test
    Task                   = test                                                                                                     
    Hash                   = 011f1e783558cf3d                                                                                         
    Cached (Local)         = false                                                                                                    
    Cached (Remote)        = false                                                                                                    
    Command                = [[ ( -f foo ) && $(cat foo) == 'building' ]]                                                             
    Outputs                =                                                                                                          
    Log File               = .turbo/turbo-test.log                                                                                    
    Dependencies           = build                                                                                                    
    Dependendents          =                                                                                                          
    ResolvedTaskDefinition = {"outputs":[],"cache":true,"dependsOn":["build"],"inputs":[],"outputMode":0,"env":[],"persistent":false} 

  $ ${TURBO} run test --dry=json --single-package
  {
    "tasks": [
      {
        "task": "build",
        "hash": "818eddfdc27ae508",
        "cacheState": {
          "local": false,
          "remote": false
        },
        "command": "echo 'building' \u003e foo",
        "outputs": [
          "foo"
        ],
        "excludedOutputs": null,
        "logFile": ".turbo/turbo-build.log",
        "dependencies": [],
        "dependents": [
          "test"
        ],
        "resolvedTaskDefinition": {
          "outputs": [
            "foo"
          ],
          "cache": true,
          "dependsOn": [],
          "inputs": [],
          "outputMode": 0,
          "env": [],
          "persistent": false
        }
      },
      {
        "task": "test",
        "hash": "011f1e783558cf3d",
        "cacheState": {
          "local": false,
          "remote": false
        },
        "command": "[[ ( -f foo ) \u0026\u0026 $(cat foo) == 'building' ]]",
        "outputs": null,
        "excludedOutputs": null,
        "logFile": ".turbo/turbo-test.log",
        "dependencies": [
          "build"
        ],
        "dependents": [],
        "resolvedTaskDefinition": {
          "outputs": [],
          "cache": true,
          "dependsOn": [
            "build"
          ],
          "inputs": [],
          "outputMode": 0,
          "env": [],
          "persistent": false
        }
      }
    ]
  }
