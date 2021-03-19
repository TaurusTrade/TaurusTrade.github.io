# Gateway 

A gateway is the interface that your client communicate to the broker's Server.

Gateway is an abstract defination, it can mean the direct access of broker, or your internal counter system, etc.

In general, gateway provide following functions:

- get market data, such as Tick, Bar, etc.
- send order or cancel order
- query state of your account which include cash, positions, and portfolio state if you're in a grade group of an institution

