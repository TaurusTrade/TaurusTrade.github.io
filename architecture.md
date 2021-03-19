Select has a modulized architecture, based on GeminiWPF framework.

One [`Module`]() can import/export many components (use MEF), a component can be an architecture part:

- [Service](services/index.md)
- ViewModel
- Command
- MenuDefinition

or a business part:

- `TradingRule`
- `Exchange`


```uml
[include](uml/architecture.uml)
```

