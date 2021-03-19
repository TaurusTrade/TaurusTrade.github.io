# EventEngine --> ActorService or GeneralActor ?

	EventEngine 负责消息的注册、发送、转发。。。

	- def start(self) -> None:
	- def stop(self) -> None:
	- def put(self, event: Event) -> None:
	- def register(self, type: str, handler: HandlerType) -> None:
	- def unregister(self, type: str, handler: HandlerType) -> None:
	- def _process(self, event: Event) -> None:  转发至注册的 Handler
	- def _run_timer(self) -> None: 按照构造函数指定的 interval 发送 EVENT_TIMER 消息

引用 EventEngine:

	1. MainEngine: 创建 EventEngine
	2. 其他 (app.engine...) : 在 MainEngine.add_engine()时传入



WithProducer: IActor:  Task ReceiveAsync(IContext context);
FromFunc:     public delegate Task Receive(IContext context);



MainEngine --> ActorService （+ MEF? )
app.xxx.XXXEngine --> StrategyActor ?
gateway.xxx.XXXGateway -->  


# ActorService （+ MEF? )--> MainEngine



+ AddGateway --> add_gateway

- def add_engine(self, engine_class: Any) -> "BaseEngine":
        """
        Add function engine.
        """
        engine = engine_class(self, self.event_engine)
        self.engines[engine.engine_name] = engine
        return engine

- def add_gateway(self, gateway_class: Type[BaseGateway]) -> BaseGateway:
        """
        Add gateway.
        """
        gateway = gateway_class(self.event_engine)
        self.gateways[gateway.gateway_name] = gateway

        # Add gateway supported exchanges into engine
        for exchange in gateway.exchanges:
            if exchange not in self.exchanges:
                self.exchanges.append(exchange)

        return gateway

- def add_app(self, app_class: Type[BaseApp]) -> "BaseEngine":
        """
        Add app.
        """
        app = app_class()
        self.apps[app.app_name] = app

        engine = self.add_engine(app.engine_class)
        return engine

- def init_engines(self) -> None:
        """
        Init all engines.
        """
        self.add_engine(LogEngine)
        self.add_engine(OmsEngine)
        self.add_engine(EmailEngine)