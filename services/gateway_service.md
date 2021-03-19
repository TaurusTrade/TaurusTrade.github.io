# start

```uml
@startuml

boundary    Framewrok as Framework

Framework -> GatewayService : create
GatewayService -> GatewayService : LoadGateways
GatewayService -> ConfigService : Load()
ConfigService -> GatewayService : GatewayConfig

@enduml
```
